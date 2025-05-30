// lib/models/loyalty_program.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trible/utils/converters.dart';

part 'loyalty_program.freezed.dart';
part 'loyalty_program.g.dart';

@freezed
abstract class LoyaltyProgram with _$LoyaltyProgram {
  factory LoyaltyProgram({
    required String id,
    required String businessId,
    required String businessName,
    required String businessLogoUrl,
    required String programType, // e.g., "punch_card", "percentage_off"
    required String description,
    int? currentPunches,
    int? totalPunchesNeeded,
    double? discountPercentage,
    @TimestampConverter() required Timestamp createdAt,
  }) = _LoyaltyProgram;

  factory LoyaltyProgram.fromJson(Map<String, Object?> json) =>
      _$LoyaltyProgramFromJson(json);
}
