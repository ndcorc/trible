import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/models/business.dart';

part 'promotion.freezed.dart';
part 'promotion.g.dart';

@freezed
abstract class Promotion with _$Promotion {
  factory Promotion({
    required String id,
    required String businessId,
    required String title,
    String? description,
    required String category,
    Business? business,
  }) = _Promotion;
  factory Promotion.fromJson(Map<String, Object?> json) =>
      _$PromotionFromJson(json);
}
