import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import '../../utils/enums.dart';

part 'status_modifier_model.freezed.dart';

abstract class StatusModifierModel with EquatableMixin {
  final int statusId;
  final StatusModifierType statusModifierType;
  final Stat stat;
  final double? multiplicativeBonus;
  final double? flatBonus;
  final num Function(num)? customBonus;
  int activeCharacterTurns;
  StatusModifierModel(
      {required this.statusId,
      required this.stat,
      required this.statusModifierType,
      required this.activeCharacterTurns,
      this.multiplicativeBonus,
      this.flatBonus,
      this.customBonus});

  static int modifier(
          {required StatusModifierModel statusModifierModel,
          required bool inverse}) =>
      (statusModifierModel.statusModifierType == StatusModifierType.debuff
          ? -1
          : 1) *
      (inverse ? -1 : 1) *
      (statusModifierModel.activeCharacterTurns > 0 ? 1 : -1);

  static num calculateStatChange(
      {required num statValue,
      required StatusModifierModel statusModifierModel,
      bool inverseModifier = false}) {
    assert(!(statusModifierModel.multiplicativeBonus == null &&
        statusModifierModel.flatBonus == null &&
        statusModifierModel.customBonus == null));
    final num multiplicativeBonus =
            statValue * (statusModifierModel.multiplicativeBonus ?? 0),
        flatBonus = statusModifierModel.flatBonus ?? 0;

    return modifier(
            statusModifierModel: statusModifierModel,
            inverse: inverseModifier) *
        (statusModifierModel.customBonus == null
            ? multiplicativeBonus + flatBonus
            : statusModifierModel.customBonus!(statValue));
  }

  @override
  List<Object?> get props => [statusId];
}

@unfreezed
class BuffStatusModel extends StatusModifierModel with _$BuffStatusModel {
  BuffStatusModel._()
      : super(
            statusId: 0,
            stat: Stat.none,
            activeCharacterTurns: 0,
            statusModifierType: StatusModifierType.buff);

  factory BuffStatusModel({
    required int statusId,
    required StatusModifierType statusModifierType,
    required Stat stat,
    required int activeCharacterTurns,
    double? multiplicativeBonus,
    double? flatBonus,
    num Function(num)? customBonus,
  }) = _BuffStatusModel;
}

@unfreezed
class DebuffStatusModel extends StatusModifierModel with _$DebuffStatusModel {
  DebuffStatusModel._()
      : super(
            statusId: 0,
            stat: Stat.none,
            activeCharacterTurns: 0,
            statusModifierType: StatusModifierType.debuff);

  factory DebuffStatusModel({
    required int statusId,
    required StatusModifierType statusModifierType,
    required Stat stat,
    required int activeCharacterTurns,
    double? multiplicativeBonus,
    double? flatBonus,
    num Function(num)? customBonus,
  }) = _DebuffStatusModel;
}
