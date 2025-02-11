import 'dart:convert';

import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:Schoople/domain/core/failures/main_failures.dart';
import 'package:Schoople/domain/profile/i_profile_repo.dart';
import 'package:Schoople/domain/profile/models/profile/profile/profile.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:injectable/injectable.dart';

import '../api_key.dart';

@LazySingleton(as: IProfileRepo)
class ProfileRepository implements IProfileRepo {
  @override
  Future<Either<MainFailures, Profile>> getProfileDetails() async {
    try {
      final response =
          await http.get(Uri.parse(ApiEndPoints.profile), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
        Profile profile = Profile.fromJson(responseJson);
        return Right(profile);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (_) {
      print("error in api");
      return const Left(MainFailures.clientFailure());
    }
  }
}
