import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile.g.dart';
part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    @JsonKey(name: "poster_path") required String? postarPath,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
