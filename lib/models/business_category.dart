import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'business_category.freezed.dart';
part 'business_category.g.dart';

@freezed
abstract class BusinessCategory with _$BusinessCategory {
  factory BusinessCategory({
    required String title,
    required String distance,
    required String imageUrl,
  }) = _BusinessCategory;
  factory BusinessCategory.fromJson(Map<String, Object?> json) =>
      _$BusinessCategoryFromJson(json);
}
