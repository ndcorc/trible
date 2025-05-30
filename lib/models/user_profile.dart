// lib/models/user_profile.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/utils/converters.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  factory UserProfile({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    required String membershipLevel, // e.g., "Pillar", "Obsidian"
    String? avatarUrl,
    required String qrCode,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() Timestamp? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, Object?> json) =>
      _$UserProfileFromJson(json);
}
