import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/utils/converters.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
abstract class Event with _$Event {
  factory Event({
    required String id,
    required String title,
    required String location,
    required String description,
    @TimestampConverter() required Timestamp startTime,
    @TimestampConverter() required Timestamp endTime,
    @DocumentReferenceConverter() DocumentReference? organizer,
    required bool isActive,
    @TimestampConverter() required Timestamp createdAt,
  }) = _Event;

  factory Event.fromJson(Map<String, Object?> json) => _$EventFromJson(json);
}
