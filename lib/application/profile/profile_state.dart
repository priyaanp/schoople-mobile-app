part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required bool isLoading,
    Profile? profileList,
    required Option<Either<MainFailures, Profile>> profileFailureOrSuccess,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return const ProfileState(isLoading: false, profileFailureOrSuccess: None()
        // profileList:[]
        );
  }
}
