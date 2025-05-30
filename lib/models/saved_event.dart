// lib/models/saved_event.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/utils/converters.dart';

part 'saved_event.freezed.dart';
part 'saved_event.g.dart';

@freezed
abstract class SavedEvent with _$SavedEvent {
  factory SavedEvent({
    required String id,
    required String eventId,
    required String userId,
    required String eventTitle,
    required String eventLocation,
    required String status, // "saved", "added_to_calendar"
    @TimestampConverter() required Timestamp createdAt,
  }) = _SavedEvent;

  factory SavedEvent.fromJson(Map<String, Object?> json) =>
      _$SavedEventFromJson(json);
}
