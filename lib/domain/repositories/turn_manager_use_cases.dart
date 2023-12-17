import 'package:hsr_turn_simulator/domain/models/status_modifier_model.dart';
import 'package:hsr_turn_simulator/domain/repositories/status_modifier_repository.dart';
import 'package:hsr_turn_simulator/domain/repositories/turn_manager_repository.dart';
import 'package:hsr_turn_simulator/utils/enums.dart';

import '../models/character_model.dart';

class TurnManagerUseCases {
  final StatusModifierRepositoryImpl _statusModifier;
  final TurnManagerRepositoryImpl _turnManager;
  const TurnManagerUseCases()
      : _turnManager = const TurnManagerRepositoryImpl(),
        _statusModifier = const StatusModifierRepositoryImpl();

  void setupFirstTurnOrder({required List<CharacterModel> characters}) {
    _turnManager.initializeOrder(characters: characters);
  }

  void applySpeedStatusModifier({required CharacterModel character}) {
    print(
        "<APPLIED SPEED BUFF>\nReceiver: ${character.name}\nBuff Active Turns: ${1}");
    final actionForwardBuff = BuffStatusModel(
      statusId: 01,
      statusModifierType: StatusModifierType.buff,
      stat: Stat.actionGauge,
      activeCharacterTurns: 2,
      flatBonus: 0.10,
    );
    // final speedBuff = BuffStatusModel(
    //     statusId: 01,
    //     statusModifierType: StatusModifierType.buff,
    //     stat: Stat.speed,
    //     flatBonus: 100,
    //     activeCharacterTurns: 1);
    _statusModifier.addStatusModifiers(
      character: character,
      modifiers: {actionForwardBuff},
    );
  }

  void runSimulation(
      {required List<CharacterModel> characters, int turns = 10}) {
    // Init
    setupFirstTurnOrder(characters: characters);

    bool alreadyAppliedStatusChange = false;

    for (int i = 0; i < turns; i++) {
      // Advance Queue based on Action Value
      final CharacterModel actor =
          _turnManager.initializeTurn(characters: characters);

      print(
          "TURN #${i + 1}\n\n${_turnManager.formatTurnQueue(characters: characters)}\n\n");

      // Character performs action
      if (!alreadyAppliedStatusChange && i == 0) {
        applySpeedStatusModifier(character: characters.first);
      }

      // Return character on queue
      _turnManager.backToTurnQueue(characters: characters, character: actor);

      print(
          "END OF TURN #${i + 1}\n\n${_turnManager.formatTurnQueue(characters: characters)}\n\n");
    }
  }
}
