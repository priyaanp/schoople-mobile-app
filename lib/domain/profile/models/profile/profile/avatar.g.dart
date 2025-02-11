// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvatarImpl _$$AvatarImplFromJson(Map<String, dynamic> json) => _$AvatarImpl(
      gravatar: json['gravatar'] == null
          ? null
          : Gravatar.fromJson(json['gravatar'] as Map<String, dynamic>),
      tmdb: json['tmdb'] == null
          ? null
          : Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AvatarImplToJson(_$AvatarImpl instance) =>
    <String, dynamic>{
      'gravatar': instance.gravatar,
      'tmdb': instance.tmdb,
    };
