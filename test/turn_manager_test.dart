import 'package:hsr_turn_simulator/domain/models/character_model.dart';
import 'package:hsr_turn_simulator/domain/repositories/turn_manager_use_cases.dart';

void main() {
  final List<CharacterModel> characters = [
    PlayableCharacterModel(
        name: "Dummy #1", baseSpeed: 120, statusModifiers: {}),
    PlayableCharacterModel(
        name: "Dummy #2", baseSpeed: 100, statusModifiers: {}),
    PlayableCharacterModel(
        name: "Dummy #3", baseSpeed: 90, statusModifiers: {}),
  ];
  const TurnManagerUseCases turnManager = TurnManagerUseCases();

  turnManager.runSimulation(characters: characters, turns: 5);
}
