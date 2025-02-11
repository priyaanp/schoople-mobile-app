// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  Gravatar? get gravatar => throw _privateConstructorUsedError;
  Tmdb? get tmdb => throw _privateConstructorUsedError;

  /// Serializes this Avatar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call({Gravatar? gravatar, Tmdb? tmdb});

  $GravatarCopyWith<$Res>? get gravatar;
  $TmdbCopyWith<$Res>? get tmdb;
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gravatar = freezed,
    Object? tmdb = freezed,
  }) {
    return _then(_value.copyWith(
      gravatar: freezed == gravatar
          ? _value.gravatar
          : gravatar // ignore: cast_nullable_to_non_nullable
              as Gravatar?,
      tmdb: freezed == tmdb
          ? _value.tmdb
          : tmdb // ignore: cast_nullable_to_non_nullable
              as Tmdb?,
    ) as $Val);
  }

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GravatarCopyWith<$Res>? get gravatar {
    if (_value.gravatar == null) {
      return null;
    }

    return $GravatarCopyWith<$Res>(_value.gravatar!, (value) {
      return _then(_value.copyWith(gravatar: value) as $Val);
    });
  }

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TmdbCopyWith<$Res>? get tmdb {
    if (_value.tmdb == null) {
      return null;
    }

    return $TmdbCopyWith<$Res>(_value.tmdb!, (value) {
      return _then(_value.copyWith(tmdb: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AvatarImplCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$AvatarImplCopyWith(
          _$AvatarImpl value, $Res Function(_$AvatarImpl) then) =
      __$$AvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Gravatar? gravatar, Tmdb? tmdb});

  @override
  $GravatarCopyWith<$Res>? get gravatar;
  @override
  $TmdbCopyWith<$Res>? get tmdb;
}

/// @nodoc
class __$$AvatarImplCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$AvatarImpl>
    implements _$$AvatarImplCopyWith<$Res> {
  __$$AvatarImplCopyWithImpl(
      _$AvatarImpl _value, $Res Function(_$AvatarImpl) _then)
      : super(_value, _then);

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gravatar = freezed,
    Object? tmdb = freezed,
  }) {
    return _then(_$AvatarImpl(
      gravatar: freezed == gravatar
          ? _value.gravatar
          : gravatar // ignore: cast_nullable_to_non_nullable
              as Gravatar?,
      tmdb: freezed == tmdb
          ? _value.tmdb
          : tmdb // ignore: cast_nullable_to_non_nullable
              as Tmdb?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarImpl implements _Avatar {
  _$AvatarImpl({this.gravatar, this.tmdb});

  factory _$AvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarImplFromJson(json);

  @override
  final Gravatar? gravatar;
  @override
  final Tmdb? tmdb;

  @override
  String toString() {
    return 'Avatar(gravatar: $gravatar, tmdb: $tmdb)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarImpl &&
            (identical(other.gravatar, gravatar) ||
                other.gravatar == gravatar) &&
            (identical(other.tmdb, tmdb) || other.tmdb == tmdb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, gravatar, tmdb);

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      __$$AvatarImplCopyWithImpl<_$AvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarImplToJson(
      this,
    );
  }
}

abstract class _Avatar implements Avatar {
  factory _Avatar({final Gravatar? gravatar, final Tmdb? tmdb}) = _$AvatarImpl;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$AvatarImpl.fromJson;

  @override
  Gravatar? get gravatar;
  @override
  Tmdb? get tmdb;

  /// Create a copy of Avatar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
