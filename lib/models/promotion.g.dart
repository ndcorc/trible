// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Promotion _$PromotionFromJson(Map<String, dynamic> json) => _Promotion(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  expirationDate: const TimestampConverter().fromJson(json['expirationDate']),
  businessRef: const DocumentReferenceConverter().fromJson(json['businessRef']),
  business:
      json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PromotionToJson(
  _Promotion instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'expirationDate': const TimestampConverter().toJson(instance.expirationDate),
  'businessRef': const DocumentReferenceConverter().toJson(
    instance.businessRef,
  ),
  'business': instance.business,
};
