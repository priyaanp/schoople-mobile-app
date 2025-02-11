// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      iso6391: json['iso_639_1'] as String?,
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
      includeAdult: json['include_adult'] as bool?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'id': instance.id,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'include_adult': instance.includeAdult,
      'username': instance.username,
    };
