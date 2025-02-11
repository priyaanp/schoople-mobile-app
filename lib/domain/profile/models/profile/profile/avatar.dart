import 'package:freezed_annotation/freezed_annotation.dart';

import 'gravatar.dart';
import 'tmdb.dart';

part 'avatar.freezed.dart';
part 'avatar.g.dart';

@freezed
class Avatar with _$Avatar {
  factory Avatar({
    Gravatar? gravatar,
    Tmdb? tmdb,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}
