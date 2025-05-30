// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoyaltyProgram _$LoyaltyProgramFromJson(Map<String, dynamic> json) =>
    _LoyaltyProgram(
      id: json['id'] as String,
      businessId: json['businessId'] as String,
      businessName: json['businessName'] as String,
      businessLogoUrl: json['businessLogoUrl'] as String,
      programType: json['programType'] as String,
      description: json['description'] as String,
      currentPunches: (json['currentPunches'] as num?)?.toInt(),
      totalPunchesNeeded: (json['totalPunchesNeeded'] as num?)?.toInt(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$LoyaltyProgramToJson(_LoyaltyProgram instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessId': instance.businessId,
      'businessName': instance.businessName,
      'businessLogoUrl': instance.businessLogoUrl,
      'programType': instance.programType,
      'description': instance.description,
      'currentPunches': instance.currentPunches,
      'totalPunchesNeeded': instance.totalPunchesNeeded,
      'discountPercentage': instance.discountPercentage,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
