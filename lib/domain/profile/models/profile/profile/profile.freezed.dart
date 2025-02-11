// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  Avatar? get avatar => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_639_1')
  String? get iso6391 => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso_3166_1')
  String? get iso31661 => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'include_adult')
  bool? get includeAdult => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {Avatar? avatar,
      int? id,
      @JsonKey(name: 'iso_639_1') String? iso6391,
      @JsonKey(name: 'iso_3166_1') String? iso31661,
      String? name,
      @JsonKey(name: 'include_adult') bool? includeAdult,
      String? username});

  $AvatarCopyWith<$Res>? get avatar;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = freezed,
    Object? id = freezed,
    Object? iso6391 = freezed,
    Object? iso31661 = freezed,
    Object? name = freezed,
    Object? includeAdult = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      iso6391: freezed == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String?,
      iso31661: freezed == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      includeAdult: freezed == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvatarCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $AvatarCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Avatar? avatar,
      int? id,
      @JsonKey(name: 'iso_639_1') String? iso6391,
      @JsonKey(name: 'iso_3166_1') String? iso31661,
      String? name,
      @JsonKey(name: 'include_adult') bool? includeAdult,
      String? username});

  @override
  $AvatarCopyWith<$Res>? get avatar;
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatar = freezed,
    Object? id = freezed,
    Object? iso6391 = freezed,
    Object? iso31661 = freezed,
    Object? name = freezed,
    Object? includeAdult = freezed,
    Object? username = freezed,
  }) {
    return _then(_$ProfileImpl(
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      iso6391: freezed == iso6391
          ? _value.iso6391
          : iso6391 // ignore: cast_nullable_to_non_nullable
              as String?,
      iso31661: freezed == iso31661
          ? _value.iso31661
          : iso31661 // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      includeAdult: freezed == includeAdult
          ? _value.includeAdult
          : includeAdult // ignore: cast_nullable_to_non_nullable
              as bool?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  _$ProfileImpl(
      {this.avatar,
      this.id,
      @JsonKey(name: 'iso_639_1') this.iso6391,
      @JsonKey(name: 'iso_3166_1') this.iso31661,
      this.name,
      @JsonKey(name: 'include_adult') this.includeAdult,
      this.username});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final Avatar? avatar;
  @override
  final int? id;
  @override
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @override
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  @override
  final String? name;
  @override
  @JsonKey(name: 'include_adult')
  final bool? includeAdult;
  @override
  final String? username;

  @override
  String toString() {
    return 'Profile(avatar: $avatar, id: $id, iso6391: $iso6391, iso31661: $iso31661, name: $name, includeAdult: $includeAdult, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.iso6391, iso6391) || other.iso6391 == iso6391) &&
            (identical(other.iso31661, iso31661) ||
                other.iso31661 == iso31661) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.includeAdult, includeAdult) ||
                other.includeAdult == includeAdult) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, avatar, id, iso6391, iso31661, name, includeAdult, username);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  factory _Profile(
      {final Avatar? avatar,
      final int? id,
      @JsonKey(name: 'iso_639_1') final String? iso6391,
      @JsonKey(name: 'iso_3166_1') final String? iso31661,
      final String? name,
      @JsonKey(name: 'include_adult') final bool? includeAdult,
      final String? username}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  Avatar? get avatar;
  @override
  int? get id;
  @override
  @JsonKey(name: 'iso_639_1')
  String? get iso6391;
  @override
  @JsonKey(name: 'iso_3166_1')
  String? get iso31661;
  @override
  String? get name;
  @override
  @JsonKey(name: 'include_adult')
  bool? get includeAdult;
  @override
  String? get username;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
