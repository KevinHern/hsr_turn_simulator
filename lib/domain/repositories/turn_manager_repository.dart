import '../models/character_model.dart';

abstract class TurnManagerRepositoryContract {
  static const int actionGaugeDefaultValue = 10000;

  const TurnManagerRepositoryContract();

  int calculateBaseActionValue({required CharacterModel character});

  double calculateCurrentActionGauge({required CharacterModel character});

  void initializeOrder({required List<CharacterModel> characters});

  // Same as "advance to next character in the queue"
  void advanceActionValue(
      {required List<CharacterModel> characters,
      required int actionValueConsumption});

  void nextTurn({required List<CharacterModel> characters});

  String formatTurnQueue({required List<CharacterModel> characters});
}

class TurnManagerRepositoryImpl extends TurnManagerRepositoryContract {
  const TurnManagerRepositoryImpl();

  @override
  int calculateBaseActionValue({required CharacterModel character}) =>
      (TurnManagerRepositoryContract.actionGaugeDefaultValue /
              character.baseSpeed)
          .ceil();

  @override
  double calculateCurrentActionGauge({required CharacterModel character}) =>
      (character.currentActionValue * character.currentSpeed).toDouble();

  @override
  void initializeOrder({required List<CharacterModel> characters}) {
    for (final CharacterModel character in characters) {
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
  void nextTurn({required List<CharacterModel> characters}) {
    advanceActionValue(
        characters: characters,
        actionValueConsumption: characters.first.currentActionValue);

    characters.first.resetActionValue();

    characters.add(characters.removeAt(0));
  }

  @override
  String formatTurnQueue({required List<CharacterModel> characters}) =>
      characters
          .map((e) => "${e.name} AV: ${e.currentActionValue}")
          .reduce((value, element) => "$value\n$element");
}
