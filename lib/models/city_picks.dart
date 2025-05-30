// lib/models/city_picks.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/utils/converters.dart';

part 'city_picks.freezed.dart';
part 'city_picks.g.dart';

@freezed
abstract class CityPicks with _$CityPicks {
  factory CityPicks({
    required String id,
    required String userId,
    required String cityName,
    required String cityImageUrl,
    required List<String> businessIds,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() Timestamp? updatedAt,
  }) = _CityPicks;

  factory CityPicks.fromJson(Map<String, Object?> json) =>
      _$CityPicksFromJson(json);
}
