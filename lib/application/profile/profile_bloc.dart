import 'package:Schoople/domain/core/failures/main_failures.dart';
import 'package:Schoople/domain/profile/i_profile_repo.dart';
import 'package:Schoople/domain/profile/models/profile/profile/profile.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';




part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepo _profileRepo;
  ProfileBloc(this._profileRepo) : super(ProfileState.initial()) {
    on<_GetProfileDetails>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true, profileFailureOrSuccess: none()));
        final Either<MainFailures, Profile> profileOptions =
            await _profileRepo.getProfileDetails();
        emit(profileOptions.fold(
            (failure) => state.copyWith(
                isLoading: false, profileFailureOrSuccess: Some(Left(failure))),
            (success) => state.copyWith(
                isLoading: false,
                profileList: success,
                profileFailureOrSuccess: Some(Right(success)))                
            ));
      },
    );
  }
}
