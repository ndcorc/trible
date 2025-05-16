import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'business.freezed.dart';
part 'business.g.dart';

@freezed
abstract class Business with _$Business {
  factory Business({
    required String id,
    required String name,
    required String tagline,
    required String imageUrl,
    required String distance,
    required String category,
  }) = _Business;
  factory Business.fromJson(Map<String, Object?> json) =>
      _$BusinessFromJson(json);
}
