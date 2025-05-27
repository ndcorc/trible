// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Announcement _$AnnouncementFromJson(Map<String, dynamic> json) =>
    _Announcement(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      business: const DocumentReferenceConverter().fromJson(json['business']),
      isActive: json['isActive'] as bool,
      priority: (json['priority'] as num).toInt(),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      expiresAt: const TimestampConverter().fromJson(json['expiresAt']),
    );

Map<String, dynamic> _$AnnouncementToJson(_Announcement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'business': const DocumentReferenceConverter().toJson(instance.business),
      'isActive': instance.isActive,
      'priority': instance.priority,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'expiresAt': _$JsonConverterToJson<dynamic, Timestamp>(
        instance.expiresAt,
        const TimestampConverter().toJson,
      ),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
