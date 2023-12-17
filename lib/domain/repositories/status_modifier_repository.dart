import 'dart:math';

import 'package:hsr_turn_simulator/domain/models/character_model.dart';
import 'package:hsr_turn_simulator/domain/models/status_modifier_model.dart';
import 'package:hsr_turn_simulator/utils/enums.dart';

import '../../utils/numeric_constants.dart';

abstract class StatusModifierRepositoryContract {
  const StatusModifierRepositoryContract();

  void applyStatModification(
      {required CharacterModel character,
      required StatusModifierModel statusModifier});

  void addStatusModifiers(
      {required CharacterModel character,
      required Set<StatusModifierModel> modifiers});

  void advanceStatusModifiers({required CharacterModel character});
}

class StatusModifierRepositoryImpl extends StatusModifierRepositoryContract {
  const StatusModifierRepositoryImpl();

  @override
  void applyStatModification(
      {required CharacterModel character,
      required StatusModifierModel statusModifier}) {
    switch (statusModifier.stat) {
      case Stat.speed:
        final int newSpeed = character.currentSpeed +
            StatusModifierModel.calculateStatChange(
                    statValue: character.baseSpeed,
                    statusModifierModel: statusModifier)
                .ceil();

        character.currentActionValue =
            (character.currentActionValue * character.currentSpeed / newSpeed)
                .ceil();

        print("New Speed: $newSpeed");
        print("New Action Value: ${character.currentActionValue}");

        character.currentSpeed = newSpeed;
        break;
      case Stat.actionGauge:
        if (statusModifier.statusModifierType == StatusModifierType.buff) {
          character.actionGaugeForward +=
              StatusModifierModel.calculateStatChange(
                      statValue: 0, statusModifierModel: statusModifier)
                  .toDouble();
        } else {
          character.actionGaugeDelay += StatusModifierModel.calculateStatChange(
                  statValue: 0,
                  statusModifierModel: statusModifier,
                  inverseModifier: true)
              .toDouble();
        }

        final double currentActionGauge =
            (character.currentActionValue * character.baseSpeed).toDouble();

        final double modifierActionGauge = defaultActionGaugeValue *
            (character.actionGaugeForward - character.actionGaugeDelay);

        final double newActionGauge =
            max(0, currentActionGauge - modifierActionGauge);

        character.currentActionValue =
            (newActionGauge / character.currentSpeed).ceil();

        print(
            "Action Guage Forward %: ${character.actionGaugeForward}\nAction Guage Delay %: ${character.actionGaugeDelay}");
        print(
            "Current Action Gauge: $currentActionGauge\nModified Action Gauge: $modifierActionGauge");
        print(
            "New Action Gauge: $newActionGauge\nNew Action Value: ${character.currentActionValue}");

        break;
      default:
        throw Exception(
            "Status Modifier Repository Impl: Unimplemented stat change for ${statusModifier.stat}");
    }
  }

  @override
  void addStatusModifiers(
      {required CharacterModel character,
      required Set<StatusModifierModel> modifiers}) {
    for (StatusModifierModel modifier in modifiers) {
      if (character.statusModifiers.contains(modifier)) {
        character.statusModifiers.lookup(modifier)!.activeCharacterTurns =
            modifier.activeCharacterTurns;
      } else {
        character.statusModifiers.add(modifier);
        applyStatModification(character: character, statusModifier: modifier);
      }
    }
  }

  @override
  void advanceStatusModifiers({required CharacterModel character}) {
    for (final StatusModifierModel statusModifierModel
        in character.statusModifiers) {
      if (--statusModifierModel.activeCharacterTurns == 0) {
        // Revert changes to stat once stat modifier expires
        applyStatModification(
            character: character, statusModifier: statusModifierModel);
      }
    }
  }
}
