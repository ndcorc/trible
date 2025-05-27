// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Event _$EventFromJson(Map<String, dynamic> json) => _Event(
  id: json['id'] as String,
  title: json['title'] as String,
  location: json['location'] as String,
  description: json['description'] as String,
  startTime: const TimestampConverter().fromJson(json['startTime']),
  endTime: const TimestampConverter().fromJson(json['endTime']),
  organizer: const DocumentReferenceConverter().fromJson(json['organizer']),
  isActive: json['isActive'] as bool,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$EventToJson(_Event instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'location': instance.location,
  'description': instance.description,
  'startTime': const TimestampConverter().toJson(instance.startTime),
  'endTime': const TimestampConverter().toJson(instance.endTime),
  'organizer': const DocumentReferenceConverter().toJson(instance.organizer),
  'isActive': instance.isActive,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};
