import 'package:freezed_annotation/freezed_annotation.dart';

part 'gravatar.freezed.dart';
part 'gravatar.g.dart';

@freezed
class Gravatar with _$Gravatar {
  factory Gravatar({
    String? hash,
  }) = _Gravatar;

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
}
