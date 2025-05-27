import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/utils/converters.dart';

part 'announcement.freezed.dart';
part 'announcement.g.dart';

@freezed
abstract class Announcement with _$Announcement {
  factory Announcement({
    required String id,
    required String title,
    required String description,
    @DocumentReferenceConverter() DocumentReference? business,
    required bool isActive,
    required int priority, // Higher number = higher priority
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() Timestamp? expiresAt,
  }) = _Announcement;

  factory Announcement.fromJson(Map<String, Object?> json) =>
      _$AnnouncementFromJson(json);
}
