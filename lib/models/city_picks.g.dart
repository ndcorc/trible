// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_picks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityPicks _$CityPicksFromJson(Map<String, dynamic> json) => _CityPicks(
  id: json['id'] as String,
  userId: json['userId'] as String,
  cityName: json['cityName'] as String,
  cityImageUrl: json['cityImageUrl'] as String,
  businessIds:
      (json['businessIds'] as List<dynamic>).map((e) => e as String).toList(),
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampConverter().fromJson(json['updatedAt']),
);

Map<String, dynamic> _$CityPicksToJson(_CityPicks instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'cityName': instance.cityName,
      'cityImageUrl': instance.cityImageUrl,
      'businessIds': instance.businessIds,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': _$JsonConverterToJson<dynamic, Timestamp>(
        instance.updatedAt,
        const TimestampConverter().toJson,
      ),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
