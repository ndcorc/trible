// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessCategory _$BusinessCategoryFromJson(Map<String, dynamic> json) =>
    _BusinessCategory(
      title: json['title'] as String,
      distance: json['distance'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$BusinessCategoryToJson(_BusinessCategory instance) =>
    <String, dynamic>{
      'title': instance.title,
      'distance': instance.distance,
      'imageUrl': instance.imageUrl,
    };
