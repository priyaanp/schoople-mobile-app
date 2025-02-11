// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tmdb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tmdb _$TmdbFromJson(Map<String, dynamic> json) {
  return _Tmdb.fromJson(json);
}

/// @nodoc
mixin _$Tmdb {
  @JsonKey(name: 'avatar_path')
  String? get avatarPath => throw _privateConstructorUsedError;

  /// Serializes this Tmdb to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tmdb
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TmdbCopyWith<Tmdb> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TmdbCopyWith<$Res> {
  factory $TmdbCopyWith(Tmdb value, $Res Function(Tmdb) then) =
      _$TmdbCopyWithImpl<$Res, Tmdb>;
  @useResult
  $Res call({@JsonKey(name: 'avatar_path') String? avatarPath});
}

/// @nodoc
class _$TmdbCopyWithImpl<$Res, $Val extends Tmdb>
    implements $TmdbCopyWith<$Res> {
  _$TmdbCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tmdb
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarPath = freezed,
  }) {
    return _then(_value.copyWith(
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TmdbImplCopyWith<$Res> implements $TmdbCopyWith<$Res> {
  factory _$$TmdbImplCopyWith(
          _$TmdbImpl value, $Res Function(_$TmdbImpl) then) =
      __$$TmdbImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'avatar_path') String? avatarPath});
}

/// @nodoc
class __$$TmdbImplCopyWithImpl<$Res>
    extends _$TmdbCopyWithImpl<$Res, _$TmdbImpl>
    implements _$$TmdbImplCopyWith<$Res> {
  __$$TmdbImplCopyWithImpl(_$TmdbImpl _value, $Res Function(_$TmdbImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tmdb
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarPath = freezed,
  }) {
    return _then(_$TmdbImpl(
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TmdbImpl implements _Tmdb {
  _$TmdbImpl({@JsonKey(name: 'avatar_path') this.avatarPath});

  factory _$TmdbImpl.fromJson(Map<String, dynamic> json) =>
      _$$TmdbImplFromJson(json);

  @override
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;

  @override
  String toString() {
    return 'Tmdb(avatarPath: $avatarPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TmdbImpl &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, avatarPath);

  /// Create a copy of Tmdb
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TmdbImplCopyWith<_$TmdbImpl> get copyWith =>
      __$$TmdbImplCopyWithImpl<_$TmdbImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TmdbImplToJson(
      this,
    );
  }
}

abstract class _Tmdb implements Tmdb {
  factory _Tmdb({@JsonKey(name: 'avatar_path') final String? avatarPath}) =
      _$TmdbImpl;

  factory _Tmdb.fromJson(Map<String, dynamic> json) = _$TmdbImpl.fromJson;

  @override
  @JsonKey(name: 'avatar_path')
  String? get avatarPath;

  /// Create a copy of Tmdb
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TmdbImplCopyWith<_$TmdbImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
