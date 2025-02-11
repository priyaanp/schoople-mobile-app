import 'package:freezed_annotation/freezed_annotation.dart';

import 'avatar.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  factory Profile({
    Avatar? avatar,
    int? id,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    @JsonKey(name: 'iso_3166_1') String? iso31661,
    String? name,
    @JsonKey(name: 'include_adult') bool? includeAdult,
    String? username,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
