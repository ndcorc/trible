import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/models/business.dart';
import 'package:trible/utils/converters.dart';

part 'reward.freezed.dart';
part 'reward.g.dart';

@freezed
abstract class Reward with _$Reward {
  factory Reward({
    required String id,
    required String title,
    required String description,
    @DocumentReferenceConverter() DocumentReference? businessRef,
    Business? business,
    @TimestampConverter() required Timestamp expiresAt,
    required bool isActive,
    required String requiredMembershipLevel, // e.g., "Pillar", "Obsidian"
    @TimestampConverter() required Timestamp createdAt,
  }) = _Reward;

  factory Reward.fromJson(Map<String, Object?> json) => _$RewardFromJson(json);
}

@freezed
abstract class UserReward with _$UserReward {
  factory UserReward({
    required String id,
    required String rewardId,
    required String userId,
    required bool isInCart,
    required bool isApplied,
    String? qrCode,
    @TimestampConverter() Timestamp? appliedAt,
    @TimestampConverter() required Timestamp createdAt,
  }) = _UserReward;

  factory UserReward.fromJson(Map<String, Object?> json) =>
      _$UserRewardFromJson(json);
}
