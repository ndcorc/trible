// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reward _$RewardFromJson(Map<String, dynamic> json) => _Reward(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  businessRef: const DocumentReferenceConverter().fromJson(json['businessRef']),
  business:
      json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
  expiresAt: const TimestampConverter().fromJson(json['expiresAt']),
  isActive: json['isActive'] as bool,
  requiredMembershipLevel: json['requiredMembershipLevel'] as String,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$RewardToJson(_Reward instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'businessRef': const DocumentReferenceConverter().toJson(
    instance.businessRef,
  ),
  'business': instance.business,
  'expiresAt': const TimestampConverter().toJson(instance.expiresAt),
  'isActive': instance.isActive,
  'requiredMembershipLevel': instance.requiredMembershipLevel,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};

_UserReward _$UserRewardFromJson(Map<String, dynamic> json) => _UserReward(
  id: json['id'] as String,
  rewardId: json['rewardId'] as String,
  userId: json['userId'] as String,
  isInCart: json['isInCart'] as bool,
  isApplied: json['isApplied'] as bool,
  qrCode: json['qrCode'] as String?,
  appliedAt: const TimestampConverter().fromJson(json['appliedAt']),
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$UserRewardToJson(_UserReward instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rewardId': instance.rewardId,
      'userId': instance.userId,
      'isInCart': instance.isInCart,
      'isApplied': instance.isApplied,
      'qrCode': instance.qrCode,
      'appliedAt': _$JsonConverterToJson<dynamic, Timestamp>(
        instance.appliedAt,
        const TimestampConverter().toJson,
      ),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
