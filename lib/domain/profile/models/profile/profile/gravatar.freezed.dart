// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gravatar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Gravatar _$GravatarFromJson(Map<String, dynamic> json) {
  return _Gravatar.fromJson(json);
}

/// @nodoc
mixin _$Gravatar {
  String? get hash => throw _privateConstructorUsedError;

  /// Serializes this Gravatar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Gravatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GravatarCopyWith<Gravatar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GravatarCopyWith<$Res> {
  factory $GravatarCopyWith(Gravatar value, $Res Function(Gravatar) then) =
      _$GravatarCopyWithImpl<$Res, Gravatar>;
  @useResult
  $Res call({String? hash});
}

/// @nodoc
class _$GravatarCopyWithImpl<$Res, $Val extends Gravatar>
    implements $GravatarCopyWith<$Res> {
  _$GravatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Gravatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GravatarImplCopyWith<$Res>
    implements $GravatarCopyWith<$Res> {
  factory _$$GravatarImplCopyWith(
          _$GravatarImpl value, $Res Function(_$GravatarImpl) then) =
      __$$GravatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? hash});
}

/// @nodoc
class __$$GravatarImplCopyWithImpl<$Res>
    extends _$GravatarCopyWithImpl<$Res, _$GravatarImpl>
    implements _$$GravatarImplCopyWith<$Res> {
  __$$GravatarImplCopyWithImpl(
      _$GravatarImpl _value, $Res Function(_$GravatarImpl) _then)
      : super(_value, _then);

  /// Create a copy of Gravatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = freezed,
  }) {
    return _then(_$GravatarImpl(
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GravatarImpl implements _Gravatar {
  _$GravatarImpl({this.hash});

  factory _$GravatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$GravatarImplFromJson(json);

  @override
  final String? hash;

  @override
  String toString() {
    return 'Gravatar(hash: $hash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GravatarImpl &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hash);

  /// Create a copy of Gravatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GravatarImplCopyWith<_$GravatarImpl> get copyWith =>
      __$$GravatarImplCopyWithImpl<_$GravatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GravatarImplToJson(
      this,
    );
  }
}

abstract class _Gravatar implements Gravatar {
  factory _Gravatar({final String? hash}) = _$GravatarImpl;

  factory _Gravatar.fromJson(Map<String, dynamic> json) =
      _$GravatarImpl.fromJson;

  @override
  String? get hash;

  /// Create a copy of Gravatar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GravatarImplCopyWith<_$GravatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
