// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Business _$BusinessFromJson(Map<String, dynamic> json) => _Business(
  id: json['id'] as String,
  name: json['name'] as String,
  tagline: json['tagline'] as String,
  logoUrl: json['logoUrl'] as String,
  coverImageUrl: json['coverImageUrl'] as String,
  checkInInstructions: json['checkInInstructions'] as String,
  isActive: json['isActive'] as bool,
  location: BusinessLocation.fromJson(json['location'] as Map<String, dynamic>),
  phone: (json['phone'] as num).toInt(),
  redeemPolicy: json['redeemPolicy'] as String,
  waitlistInterestScore: (json['waitlistInterestScore'] as num).toInt(),
  website: json['website'] as String,
  owner: const DocumentReferenceConverter().fromJson(json['owner']),
  category: const DocumentReferenceConverter().fromJson(json['category']),
  joinedAt: const TimestampConverter().fromJson(json['joinedAt']),
);

Map<String, dynamic> _$BusinessToJson(_Business instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'tagline': instance.tagline,
  'logoUrl': instance.logoUrl,
  'coverImageUrl': instance.coverImageUrl,
  'checkInInstructions': instance.checkInInstructions,
  'isActive': instance.isActive,
  'location': instance.location,
  'phone': instance.phone,
  'redeemPolicy': instance.redeemPolicy,
  'waitlistInterestScore': instance.waitlistInterestScore,
  'website': instance.website,
  'owner': const DocumentReferenceConverter().toJson(instance.owner),
  'category': const DocumentReferenceConverter().toJson(instance.category),
  'joinedAt': const TimestampConverter().toJson(instance.joinedAt),
};

_BusinessLocation _$BusinessLocationFromJson(Map<String, dynamic> json) =>
    _BusinessLocation(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      geoPoint: const GeoPointConverter().fromJson(json['geoPoint']),
    );

Map<String, dynamic> _$BusinessLocationToJson(_BusinessLocation instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'geoPoint': const GeoPointConverter().toJson(instance.geoPoint),
    };
