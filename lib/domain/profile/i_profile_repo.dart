

import 'package:Schoople/domain/profile/models/profile/profile/profile.dart';
import 'package:dartz/dartz.dart';

import '../core/failures/main_failures.dart';


abstract class IProfileRepo {
  Future<Either<MainFailures, Profile>> getProfileDetails();
}
