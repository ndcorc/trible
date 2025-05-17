import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:trible/models/business.dart';
import 'package:trible/utils/converters.dart';

part 'promotion.freezed.dart';
part 'promotion.g.dart';

@freezed
abstract class Promotion with _$Promotion {
  factory Promotion({
    required String id,
    required String title,
    String? description,
    @TimestampConverter() required Timestamp expirationDate,
    @DocumentReferenceConverter() DocumentReference? businessRef,
    Business? business,
  }) = _Promotion;
  factory Promotion.fromJson(Map<String, Object?> json) =>
      _$PromotionFromJson(json);
}
