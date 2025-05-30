// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedEvent _$SavedEventFromJson(Map<String, dynamic> json) => _SavedEvent(
  id: json['id'] as String,
  eventId: json['eventId'] as String,
  userId: json['userId'] as String,
  eventTitle: json['eventTitle'] as String,
  eventLocation: json['eventLocation'] as String,
  status: json['status'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$SavedEventToJson(_SavedEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'userId': instance.userId,
      'eventTitle': instance.eventTitle,
      'eventLocation': instance.eventLocation,
      'status': instance.status,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
