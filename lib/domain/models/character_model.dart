import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/enums.dart';

part 'character_model.freezed.dart';

abstract class CharacterModel {
  final String name;
  final int baseSpeed;
  late int baseActionValue;
  final CharacterType characterType;
  int currentSpeed, currentActionValue;

  CharacterModel(
      {required this.name,
      required this.characterType,
      required this.baseSpeed})
      : currentSpeed = baseSpeed,
        currentActionValue = 0;

  void resetActionValue() => currentActionValue = baseActionValue;
}

@unfreezed
class PlayableCharacterModel extends CharacterModel
    with _$PlayableCharacterModel {
  PlayableCharacterModel._()
      : super(
            name: "Playable Character",
            characterType: CharacterType.playable,
            baseSpeed: 0);

  factory PlayableCharacterModel({
    required String name,
    required int baseSpeed,
  }) = _PlayableCharacterModel;
}
