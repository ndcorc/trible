// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserContribution _$UserContributionFromJson(Map<String, dynamic> json) =>
    _UserContribution(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$UserContributionToJson(_UserContribution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
