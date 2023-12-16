import 'package:hsr_turn_simulator/domain/repositories/turn_manager_repository.dart';

import '../models/character_model.dart';

class TurnManagerUseCases {
  final TurnManagerRepositoryImpl _turnManager;
  const TurnManagerUseCases()
      : _turnManager = const TurnManagerRepositoryImpl();

  void setupFirstTurnOrder({required List<CharacterModel> characters}) {
    _turnManager.initializeOrder(characters: characters);
  }

  void runSimulation(
      {required List<CharacterModel> characters, int turns = 10}) {
    // Init
    setupFirstTurnOrder(characters: characters);

    for (int i = 0; i < turns; i++) {
      print(
          "TURN #${i + 1}\n\n${_turnManager.formatTurnQueue(characters: characters)}\n\n");

      _turnManager.nextTurn(characters: characters);
    }
  }
}
