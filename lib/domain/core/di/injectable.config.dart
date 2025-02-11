// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:Schoople/application/profile/profile_bloc.dart' as _i80;
import 'package:Schoople/domain/profile/i_profile_repo.dart' as _i803;
import 'package:Schoople/infrastructure/profile/profile_repository.dart'
    as _i511;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i803.IProfileRepo>(() => _i511.ProfileRepository());
    gh.factory<_i80.ProfileBloc>(
        () => _i80.ProfileBloc(gh<_i803.IProfileRepo>()));
    return this;
  }
}
