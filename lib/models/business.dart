import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/utils/converters.dart';

part 'business.freezed.dart';
part 'business.g.dart';

@freezed
abstract class Business with _$Business {
  factory Business({
    required String id,
    required String name,
    required String tagline,
    required String logoUrl,
    required String coverImageUrl,
    required String checkInInstructions,
    required bool isActive,
    required BusinessLocation location,
    required int phone,
    required String redeemPolicy,
    required int waitlistInterestScore,
    required String website,
    @DocumentReferenceConverter() DocumentReference? owner,
    @DocumentReferenceConverter() DocumentReference? category,
    @TimestampConverter() required Timestamp joinedAt,
  }) = _Business;

  factory Business.fromJson(Map<String, Object?> json) =>
      _$BusinessFromJson(json);
}

@freezed
abstract class BusinessLocation with _$BusinessLocation {
  factory BusinessLocation({
    required String address,
    required String city,
    required String state,

    // Add the GeoPoint field
    @GeoPointConverter() required GeoPoint geoPoint,

    // Keep lat/lon for convenience but make them computed getters
    @JsonKey(includeFromJson: false, includeToJson: false) double? lat,

    @JsonKey(includeFromJson: false, includeToJson: false) double? lon,
  }) = _BusinessLocation;

  factory BusinessLocation.fromJson(Map<String, Object?> json) =>
      _$BusinessLocationFromJson(json);
}
