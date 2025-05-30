// lib/models/user_activity.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/utils/converters.dart';

part 'user_contribution.freezed.dart';
part 'user_contribution.g.dart';

@freezed
abstract class UserContribution with _$UserContribution {
  factory UserContribution({
    required String id,
    required String userId,
    required String type, // "event_submission", "event_rsvp", etc.
    required String title,
    required String description,
    @TimestampConverter() required Timestamp createdAt,
  }) = _UserContribution;

  factory UserContribution.fromJson(Map<String, Object?> json) =>
      _$UserContributionFromJson(json);
}
