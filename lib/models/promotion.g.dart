// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Promotion _$PromotionFromJson(Map<String, dynamic> json) => _Promotion(
  id: json['id'] as String,
  businessId: json['businessId'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  category: json['category'] as String,
  business:
      json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PromotionToJson(_Promotion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessId': instance.businessId,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'business': instance.business,
    };
