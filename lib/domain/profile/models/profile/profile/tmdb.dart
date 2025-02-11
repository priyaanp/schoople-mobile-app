import 'package:freezed_annotation/freezed_annotation.dart';

part 'tmdb.freezed.dart';
part 'tmdb.g.dart';

@freezed
class Tmdb with _$Tmdb {
  factory Tmdb({
    @JsonKey(name: 'avatar_path') String? avatarPath,
  }) = _Tmdb;

  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);
}
