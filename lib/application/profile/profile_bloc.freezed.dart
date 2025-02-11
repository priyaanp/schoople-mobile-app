// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfileDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProfileDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfileDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProfileDetails value) getProfileDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProfileDetails value)? getProfileDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProfileDetails value)? getProfileDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetProfileDetailsImplCopyWith<$Res> {
  factory _$$GetProfileDetailsImplCopyWith(_$GetProfileDetailsImpl value,
          $Res Function(_$GetProfileDetailsImpl) then) =
      __$$GetProfileDetailsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProfileDetailsImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$GetProfileDetailsImpl>
    implements _$$GetProfileDetailsImplCopyWith<$Res> {
  __$$GetProfileDetailsImplCopyWithImpl(_$GetProfileDetailsImpl _value,
      $Res Function(_$GetProfileDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetProfileDetailsImpl implements _GetProfileDetails {
  const _$GetProfileDetailsImpl();

  @override
  String toString() {
    return 'ProfileEvent.getProfileDetails()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProfileDetailsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getProfileDetails,
  }) {
    return getProfileDetails();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getProfileDetails,
  }) {
    return getProfileDetails?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getProfileDetails,
    required TResult orElse(),
  }) {
    if (getProfileDetails != null) {
      return getProfileDetails();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetProfileDetails value) getProfileDetails,
  }) {
    return getProfileDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetProfileDetails value)? getProfileDetails,
  }) {
    return getProfileDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProfileDetails value)? getProfileDetails,
    required TResult orElse(),
  }) {
    if (getProfileDetails != null) {
      return getProfileDetails(this);
    }
    return orElse();
  }
}

abstract class _GetProfileDetails implements ProfileEvent {
  const factory _GetProfileDetails() = _$GetProfileDetailsImpl;
}

/// @nodoc
mixin _$ProfileState {
  bool get isLoading => throw _privateConstructorUsedError;
  Profile? get profileList => throw _privateConstructorUsedError;
  Option<Either<MainFailures, Profile>> get profileFailureOrSuccess =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {bool isLoading,
      Profile? profileList,
      Option<Either<MainFailures, Profile>> profileFailureOrSuccess});

  $ProfileCopyWith<$Res>? get profileList;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? profileList = freezed,
    Object? profileFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      profileList: freezed == profileList
          ? _value.profileList
          : profileList // ignore: cast_nullable_to_non_nullable
              as Profile?,
      profileFailureOrSuccess: null == profileFailureOrSuccess
          ? _value.profileFailureOrSuccess
          : profileFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, Profile>>,
    ) as $Val);
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profileList {
    if (_value.profileList == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profileList!, (value) {
      return _then(_value.copyWith(profileList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Profile? profileList,
      Option<Either<MainFailures, Profile>> profileFailureOrSuccess});

  @override
  $ProfileCopyWith<$Res>? get profileList;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? profileList = freezed,
    Object? profileFailureOrSuccess = null,
  }) {
    return _then(_$ProfileStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      profileList: freezed == profileList
          ? _value.profileList
          : profileList // ignore: cast_nullable_to_non_nullable
              as Profile?,
      profileFailureOrSuccess: null == profileFailureOrSuccess
          ? _value.profileFailureOrSuccess
          : profileFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, Profile>>,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {required this.isLoading,
      this.profileList,
      required this.profileFailureOrSuccess});

  @override
  final bool isLoading;
  @override
  final Profile? profileList;
  @override
  final Option<Either<MainFailures, Profile>> profileFailureOrSuccess;

  @override
  String toString() {
    return 'ProfileState(isLoading: $isLoading, profileList: $profileList, profileFailureOrSuccess: $profileFailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.profileList, profileList) ||
                other.profileList == profileList) &&
            (identical(
                    other.profileFailureOrSuccess, profileFailureOrSuccess) ||
                other.profileFailureOrSuccess == profileFailureOrSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, profileList, profileFailureOrSuccess);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {required final bool isLoading,
      final Profile? profileList,
      required final Option<Either<MainFailures, Profile>>
          profileFailureOrSuccess}) = _$ProfileStateImpl;

  @override
  bool get isLoading;
  @override
  Profile? get profileList;
  @override
  Option<Either<MainFailures, Profile>> get profileFailureOrSuccess;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
