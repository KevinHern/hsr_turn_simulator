import 'package:hsr_turn_simulator/domain/models/status_modifier_model.dart';
import 'package:hsr_turn_simulator/domain/repositories/status_modifier_repository.dart';

import '../../utils/numeric_constants.dart';
import '../models/character_model.dart';

abstract class TurnManagerRepositoryContract {
  const TurnManagerRepositoryContract();

  int calculateBaseActionValue({required CharacterModel character});

  double calculateCurrentActionGauge({required CharacterModel character});

  void initializeOrder({required List<CharacterModel> characters});

  // Same as "advance to next character in the queue"
  void advanceActionValue(
      {required List<CharacterModel> characters,
      required int actionValueConsumption});

  CharacterModel initializeTurn({required List<CharacterModel> characters});

  void backToTurnQueue(
      {required List<CharacterModel> characters,
      required CharacterModel character});

  String formatTurnQueue({required List<CharacterModel> characters});
}

class TurnManagerRepositoryImpl extends TurnManagerRepositoryContract {
  final StatusModifierRepositoryImpl _statusModifierRepository;
  const TurnManagerRepositoryImpl()
      : _statusModifierRepository = const StatusModifierRepositoryImpl();

  @override
  int calculateBaseActionValue({required CharacterModel character}) =>
      (defaultActionGaugeValue / character.baseSpeed).ceil();

  @override
  double calculateCurrentActionGauge({required CharacterModel character}) =>
      (character.currentActionValue * character.currentSpeed).toDouble();

  @override
  void initializeOrder({required List<CharacterModel> characters}) {
    for (final CharacterModel character in characters) {
      character.currentSpeed = character.baseSpeed;
      final int baseActionValue =
          calculateBaseActionValue(character: character);
      character.baseActionValue = baseActionValue;
      character.currentActionValue = baseActionValue;
    }

    characters
        .sort((a, b) => a.currentActionValue.compareTo(b.currentActionValue));
  }

  @override
  void advanceActionValue(
      {required List<CharacterModel> characters,
      required int actionValueConsumption}) {
    for (final CharacterModel character in characters) {
      character.currentActionValue -= actionValueConsumption;
    }
  }

  @override
  CharacterModel initializeTurn({required List<CharacterModel> characters}) {
    advanceActionValue(
        characters: characters,
        actionValueConsumption: characters.first.currentActionValue);

    return characters.removeAt(0);
  }

  @override
  void backToTurnQueue(
      {required List<CharacterModel> characters,
      required CharacterModel character}) {
    _statusModifierRepository.advanceStatusModifiers(character: character);

    character.resetActionValue();

    final int queueIndex = characters.indexWhere(
        (element) => element.currentActionValue > character.currentActionValue);

    queueIndex == -1
        ? characters.add(character)
        : characters.insert(queueIndex, character);
  }

  @override
  String formatTurnQueue({required List<CharacterModel> characters}) => characters
      .map((e) =>
          "${e.name} {AV: ${e.currentActionValue}, Base Speed: ${e.baseSpeed}, Current Speed: ${e.currentSpeed}}")
      .reduce((value, element) => "$value\n$element");
}
