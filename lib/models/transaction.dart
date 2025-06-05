import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/utils/converters.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  factory Transaction({
    required String id,
    required String userId,
    required String businessId,
    required String businessName,
    required TransactionType type,
    required double amount, // Purchase amount in dollars
    required int pointsEarned, // Points earned from this transaction
    required int pointsRedeemed, // Points redeemed in this transaction
    String? description,
    Map<String, dynamic>? metadata, // Additional transaction data
    @TimestampConverter() required Timestamp createdAt,
    @DocumentReferenceConverter() DocumentReference? businessRef,
    @DocumentReferenceConverter() DocumentReference? userRef,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, Object?> json) =>
      _$TransactionFromJson(json);
}

enum TransactionType {
  purchase, // Regular purchase - earns points
  rewardRedemption, // Spending points for rewards
  checkIn, // Simple check-in for foot traffic
  pointsExpiry, // System transaction for expired points
}

@freezed
abstract class PointBalance with _$PointBalance {
  factory PointBalance({
    required String id,
    required String userId,
    required int totalPoints,
    required int availablePoints, // Total minus expired/redeemed
    @TimestampConverter() required Timestamp lastUpdated,
    @TimestampConverter() required Timestamp createdAt,
  }) = _PointBalance;

  factory PointBalance.fromJson(Map<String, Object?> json) =>
      _$PointBalanceFromJson(json);
}

@freezed
abstract class PointTransaction with _$PointTransaction {
  factory PointTransaction({
    required String id,
    required String userId,
    required String transactionId, // Links to main Transaction
    required PointTransactionType type,
    required int pointsChange, // Positive for earning, negative for spending
    required int balanceAfter, // Point balance after this transaction
    @TimestampConverter()
    required Timestamp expiresAt, // When these points expire
    @TimestampConverter() required Timestamp createdAt,
    String? description,
  }) = _PointTransaction;

  factory PointTransaction.fromJson(Map<String, Object?> json) =>
      _$PointTransactionFromJson(json);
}

enum PointTransactionType {
  earned, // Points earned from purchase
  redeemed, // Points spent on rewards
  expired, // Points that expired
  adjusted, // Manual adjustment (admin)
}

@freezed
abstract class FootTrafficEntry with _$FootTrafficEntry {
  factory FootTrafficEntry({
    required String id,
    required String userId,
    required String businessId,
    required String businessName,
    required double transactionAmount,
    required TransactionType transactionType,
    @TimestampConverter() required Timestamp visitTime,
    @GeoPointConverter() required GeoPoint businessLocation,

    // User demographics (anonymized for analytics)
    required String userMembershipLevel,
    String? userAgeGroup, // e.g., "25-34"
    String? userCity,

    // Visit context
    String? dayOfWeek,
    String? timeOfDay, // e.g., "morning", "afternoon", "evening"
    int? visitDurationMinutes,

    // Business context
    String? businessCategory,
    double? businessRating,

    Map<String, dynamic>? additionalMetrics,
  }) = _FootTrafficEntry;

  factory FootTrafficEntry.fromJson(Map<String, Object?> json) =>
      _$FootTrafficEntryFromJson(json);
}
