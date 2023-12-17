// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayableCharacterModel {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  int get baseSpeed => throw _privateConstructorUsedError;
  set baseSpeed(int value) => throw _privateConstructorUsedError;
  Set<StatusModifierModel> get statusModifiers =>
      throw _privateConstructorUsedError;
  set statusModifiers(Set<StatusModifierModel> value) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayableCharacterModelCopyWith<PlayableCharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayableCharacterModelCopyWith<$Res> {
  factory $PlayableCharacterModelCopyWith(PlayableCharacterModel value,
          $Res Function(PlayableCharacterModel) then) =
      _$PlayableCharacterModelCopyWithImpl<$Res, PlayableCharacterModel>;
  @useResult
  $Res call(
      {String name, int baseSpeed, Set<StatusModifierModel> statusModifiers});
}

/// @nodoc
class _$PlayableCharacterModelCopyWithImpl<$Res,
        $Val extends PlayableCharacterModel>
    implements $PlayableCharacterModelCopyWith<$Res> {
  _$PlayableCharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? baseSpeed = null,
    Object? statusModifiers = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseSpeed: null == baseSpeed
          ? _value.baseSpeed
          : baseSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      statusModifiers: null == statusModifiers
          ? _value.statusModifiers
          : statusModifiers // ignore: cast_nullable_to_non_nullable
              as Set<StatusModifierModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayableCharacterModelImplCopyWith<$Res>
    implements $PlayableCharacterModelCopyWith<$Res> {
  factory _$$PlayableCharacterModelImplCopyWith(
          _$PlayableCharacterModelImpl value,
          $Res Function(_$PlayableCharacterModelImpl) then) =
      __$$PlayableCharacterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, int baseSpeed, Set<StatusModifierModel> statusModifiers});
}

/// @nodoc
class __$$PlayableCharacterModelImplCopyWithImpl<$Res>
    extends _$PlayableCharacterModelCopyWithImpl<$Res,
        _$PlayableCharacterModelImpl>
    implements _$$PlayableCharacterModelImplCopyWith<$Res> {
  __$$PlayableCharacterModelImplCopyWithImpl(
      _$PlayableCharacterModelImpl _value,
      $Res Function(_$PlayableCharacterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? baseSpeed = null,
    Object? statusModifiers = null,
  }) {
    return _then(_$PlayableCharacterModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseSpeed: null == baseSpeed
          ? _value.baseSpeed
          : baseSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      statusModifiers: null == statusModifiers
          ? _value.statusModifiers
          : statusModifiers // ignore: cast_nullable_to_non_nullable
              as Set<StatusModifierModel>,
    ));
  }
}

/// @nodoc

class _$PlayableCharacterModelImpl extends _PlayableCharacterModel {
  _$PlayableCharacterModelImpl(
      {required this.name,
      required this.baseSpeed,
      required this.statusModifiers})
      : super._();

  @override
  String name;
  @override
  int baseSpeed;
  @override
  Set<StatusModifierModel> statusModifiers;

  @override
  String toString() {
    return 'PlayableCharacterModel(name: $name, baseSpeed: $baseSpeed, statusModifiers: $statusModifiers)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayableCharacterModelImplCopyWith<_$PlayableCharacterModelImpl>
      get copyWith => __$$PlayableCharacterModelImplCopyWithImpl<
          _$PlayableCharacterModelImpl>(this, _$identity);
}

abstract class _PlayableCharacterModel extends PlayableCharacterModel {
  factory _PlayableCharacterModel(
          {required String name,
          required int baseSpeed,
          required Set<StatusModifierModel> statusModifiers}) =
      _$PlayableCharacterModelImpl;
  _PlayableCharacterModel._() : super._();

  @override
  String get name;
  set name(String value);
  @override
  int get baseSpeed;
  set baseSpeed(int value);
  @override
  Set<StatusModifierModel> get statusModifiers;
  set statusModifiers(Set<StatusModifierModel> value);
  @override
  @JsonKey(ignore: true)
  _$$PlayableCharacterModelImplCopyWith<_$PlayableCharacterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
