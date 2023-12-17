import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hsr_turn_simulator/domain/models/status_modifier_model.dart';
import 'package:hsr_turn_simulator/utils/numeric_constants.dart';

import '../../utils/enums.dart';

part 'character_model.freezed.dart';

abstract class CharacterModel {
  final String name;
  final int baseSpeed;
  final CharacterType characterType;
  Set<StatusModifierModel> statusModifiers;
  int currentSpeed, baseActionValue, currentActionValue;
  double actionGaugeForward, actionGaugeDelay;

  CharacterModel(
      {required this.name,
      required this.characterType,
      required this.baseSpeed})
      : statusModifiers = {},
        currentSpeed = baseSpeed,
        baseActionValue = 0,
        currentActionValue = 0,
        actionGaugeForward = 0.0,
        actionGaugeDelay = 0.0;

  void resetActionValue() => currentActionValue = (defaultActionGaugeValue *
          (1 - actionGaugeForward + actionGaugeDelay) /
          currentSpeed)
      .ceil();
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
    required Set<StatusModifierModel> statusModifiers,
  }) = _PlayableCharacterModel;
}
