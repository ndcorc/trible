// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reward.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reward implements DiagnosticableTreeMixin {

 String get id; String get title; String get description;@DocumentReferenceConverter() DocumentReference? get businessRef; Business? get business;@TimestampConverter() Timestamp get expiresAt; bool get isActive; String get requiredMembershipLevel;// e.g., "Pillar", "Obsidian"
@TimestampConverter() Timestamp get createdAt;
/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RewardCopyWith<Reward> get copyWith => _$RewardCopyWithImpl<Reward>(this as Reward, _$identity);

  /// Serializes this Reward to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Reward'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('businessRef', businessRef))..add(DiagnosticsProperty('business', business))..add(DiagnosticsProperty('expiresAt', expiresAt))..add(DiagnosticsProperty('isActive', isActive))..add(DiagnosticsProperty('requiredMembershipLevel', requiredMembershipLevel))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reward&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.businessRef, businessRef) || other.businessRef == businessRef)&&(identical(other.business, business) || other.business == business)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.requiredMembershipLevel, requiredMembershipLevel) || other.requiredMembershipLevel == requiredMembershipLevel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,businessRef,business,expiresAt,isActive,requiredMembershipLevel,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Reward(id: $id, title: $title, description: $description, businessRef: $businessRef, business: $business, expiresAt: $expiresAt, isActive: $isActive, requiredMembershipLevel: $requiredMembershipLevel, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RewardCopyWith<$Res>  {
  factory $RewardCopyWith(Reward value, $Res Function(Reward) _then) = _$RewardCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@DocumentReferenceConverter() DocumentReference? businessRef, Business? business,@TimestampConverter() Timestamp expiresAt, bool isActive, String requiredMembershipLevel,@TimestampConverter() Timestamp createdAt
});


$BusinessCopyWith<$Res>? get business;

}
/// @nodoc
class _$RewardCopyWithImpl<$Res>
    implements $RewardCopyWith<$Res> {
  _$RewardCopyWithImpl(this._self, this._then);

  final Reward _self;
  final $Res Function(Reward) _then;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? businessRef = freezed,Object? business = freezed,Object? expiresAt = null,Object? isActive = null,Object? requiredMembershipLevel = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,businessRef: freezed == businessRef ? _self.businessRef : businessRef // ignore: cast_nullable_to_non_nullable
as DocumentReference?,business: freezed == business ? _self.business : business // ignore: cast_nullable_to_non_nullable
as Business?,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as Timestamp,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,requiredMembershipLevel: null == requiredMembershipLevel ? _self.requiredMembershipLevel : requiredMembershipLevel // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}
/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCopyWith<$Res>? get business {
    if (_self.business == null) {
    return null;
  }

  return $BusinessCopyWith<$Res>(_self.business!, (value) {
    return _then(_self.copyWith(business: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Reward with DiagnosticableTreeMixin implements Reward {
   _Reward({required this.id, required this.title, required this.description, @DocumentReferenceConverter() this.businessRef, this.business, @TimestampConverter() required this.expiresAt, required this.isActive, required this.requiredMembershipLevel, @TimestampConverter() required this.createdAt});
  factory _Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@DocumentReferenceConverter() final  DocumentReference? businessRef;
@override final  Business? business;
@override@TimestampConverter() final  Timestamp expiresAt;
@override final  bool isActive;
@override final  String requiredMembershipLevel;
// e.g., "Pillar", "Obsidian"
@override@TimestampConverter() final  Timestamp createdAt;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RewardCopyWith<_Reward> get copyWith => __$RewardCopyWithImpl<_Reward>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RewardToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Reward'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('businessRef', businessRef))..add(DiagnosticsProperty('business', business))..add(DiagnosticsProperty('expiresAt', expiresAt))..add(DiagnosticsProperty('isActive', isActive))..add(DiagnosticsProperty('requiredMembershipLevel', requiredMembershipLevel))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reward&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.businessRef, businessRef) || other.businessRef == businessRef)&&(identical(other.business, business) || other.business == business)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.requiredMembershipLevel, requiredMembershipLevel) || other.requiredMembershipLevel == requiredMembershipLevel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,businessRef,business,expiresAt,isActive,requiredMembershipLevel,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Reward(id: $id, title: $title, description: $description, businessRef: $businessRef, business: $business, expiresAt: $expiresAt, isActive: $isActive, requiredMembershipLevel: $requiredMembershipLevel, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RewardCopyWith<$Res> implements $RewardCopyWith<$Res> {
  factory _$RewardCopyWith(_Reward value, $Res Function(_Reward) _then) = __$RewardCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@DocumentReferenceConverter() DocumentReference? businessRef, Business? business,@TimestampConverter() Timestamp expiresAt, bool isActive, String requiredMembershipLevel,@TimestampConverter() Timestamp createdAt
});


@override $BusinessCopyWith<$Res>? get business;

}
/// @nodoc
class __$RewardCopyWithImpl<$Res>
    implements _$RewardCopyWith<$Res> {
  __$RewardCopyWithImpl(this._self, this._then);

  final _Reward _self;
  final $Res Function(_Reward) _then;

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? businessRef = freezed,Object? business = freezed,Object? expiresAt = null,Object? isActive = null,Object? requiredMembershipLevel = null,Object? createdAt = null,}) {
  return _then(_Reward(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,businessRef: freezed == businessRef ? _self.businessRef : businessRef // ignore: cast_nullable_to_non_nullable
as DocumentReference?,business: freezed == business ? _self.business : business // ignore: cast_nullable_to_non_nullable
as Business?,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as Timestamp,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,requiredMembershipLevel: null == requiredMembershipLevel ? _self.requiredMembershipLevel : requiredMembershipLevel // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

/// Create a copy of Reward
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCopyWith<$Res>? get business {
    if (_self.business == null) {
    return null;
  }

  return $BusinessCopyWith<$Res>(_self.business!, (value) {
    return _then(_self.copyWith(business: value));
  });
}
}


/// @nodoc
mixin _$UserReward implements DiagnosticableTreeMixin {

 String get id; String get rewardId; String get userId; bool get isInCart; bool get isApplied; String? get qrCode;@TimestampConverter() Timestamp? get appliedAt;@TimestampConverter() Timestamp get createdAt;
/// Create a copy of UserReward
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRewardCopyWith<UserReward> get copyWith => _$UserRewardCopyWithImpl<UserReward>(this as UserReward, _$identity);

  /// Serializes this UserReward to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserReward'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('rewardId', rewardId))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('isInCart', isInCart))..add(DiagnosticsProperty('isApplied', isApplied))..add(DiagnosticsProperty('qrCode', qrCode))..add(DiagnosticsProperty('appliedAt', appliedAt))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserReward&&(identical(other.id, id) || other.id == id)&&(identical(other.rewardId, rewardId) || other.rewardId == rewardId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isInCart, isInCart) || other.isInCart == isInCart)&&(identical(other.isApplied, isApplied) || other.isApplied == isApplied)&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.appliedAt, appliedAt) || other.appliedAt == appliedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rewardId,userId,isInCart,isApplied,qrCode,appliedAt,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserReward(id: $id, rewardId: $rewardId, userId: $userId, isInCart: $isInCart, isApplied: $isApplied, qrCode: $qrCode, appliedAt: $appliedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserRewardCopyWith<$Res>  {
  factory $UserRewardCopyWith(UserReward value, $Res Function(UserReward) _then) = _$UserRewardCopyWithImpl;
@useResult
$Res call({
 String id, String rewardId, String userId, bool isInCart, bool isApplied, String? qrCode,@TimestampConverter() Timestamp? appliedAt,@TimestampConverter() Timestamp createdAt
});




}
/// @nodoc
class _$UserRewardCopyWithImpl<$Res>
    implements $UserRewardCopyWith<$Res> {
  _$UserRewardCopyWithImpl(this._self, this._then);

  final UserReward _self;
  final $Res Function(UserReward) _then;

/// Create a copy of UserReward
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rewardId = null,Object? userId = null,Object? isInCart = null,Object? isApplied = null,Object? qrCode = freezed,Object? appliedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rewardId: null == rewardId ? _self.rewardId : rewardId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isInCart: null == isInCart ? _self.isInCart : isInCart // ignore: cast_nullable_to_non_nullable
as bool,isApplied: null == isApplied ? _self.isApplied : isApplied // ignore: cast_nullable_to_non_nullable
as bool,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as String?,appliedAt: freezed == appliedAt ? _self.appliedAt : appliedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserReward with DiagnosticableTreeMixin implements UserReward {
   _UserReward({required this.id, required this.rewardId, required this.userId, required this.isInCart, required this.isApplied, this.qrCode, @TimestampConverter() this.appliedAt, @TimestampConverter() required this.createdAt});
  factory _UserReward.fromJson(Map<String, dynamic> json) => _$UserRewardFromJson(json);

@override final  String id;
@override final  String rewardId;
@override final  String userId;
@override final  bool isInCart;
@override final  bool isApplied;
@override final  String? qrCode;
@override@TimestampConverter() final  Timestamp? appliedAt;
@override@TimestampConverter() final  Timestamp createdAt;

/// Create a copy of UserReward
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRewardCopyWith<_UserReward> get copyWith => __$UserRewardCopyWithImpl<_UserReward>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRewardToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserReward'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('rewardId', rewardId))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('isInCart', isInCart))..add(DiagnosticsProperty('isApplied', isApplied))..add(DiagnosticsProperty('qrCode', qrCode))..add(DiagnosticsProperty('appliedAt', appliedAt))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserReward&&(identical(other.id, id) || other.id == id)&&(identical(other.rewardId, rewardId) || other.rewardId == rewardId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isInCart, isInCart) || other.isInCart == isInCart)&&(identical(other.isApplied, isApplied) || other.isApplied == isApplied)&&(identical(other.qrCode, qrCode) || other.qrCode == qrCode)&&(identical(other.appliedAt, appliedAt) || other.appliedAt == appliedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rewardId,userId,isInCart,isApplied,qrCode,appliedAt,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserReward(id: $id, rewardId: $rewardId, userId: $userId, isInCart: $isInCart, isApplied: $isApplied, qrCode: $qrCode, appliedAt: $appliedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserRewardCopyWith<$Res> implements $UserRewardCopyWith<$Res> {
  factory _$UserRewardCopyWith(_UserReward value, $Res Function(_UserReward) _then) = __$UserRewardCopyWithImpl;
@override @useResult
$Res call({
 String id, String rewardId, String userId, bool isInCart, bool isApplied, String? qrCode,@TimestampConverter() Timestamp? appliedAt,@TimestampConverter() Timestamp createdAt
});




}
/// @nodoc
class __$UserRewardCopyWithImpl<$Res>
    implements _$UserRewardCopyWith<$Res> {
  __$UserRewardCopyWithImpl(this._self, this._then);

  final _UserReward _self;
  final $Res Function(_UserReward) _then;

/// Create a copy of UserReward
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rewardId = null,Object? userId = null,Object? isInCart = null,Object? isApplied = null,Object? qrCode = freezed,Object? appliedAt = freezed,Object? createdAt = null,}) {
  return _then(_UserReward(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,rewardId: null == rewardId ? _self.rewardId : rewardId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isInCart: null == isInCart ? _self.isInCart : isInCart // ignore: cast_nullable_to_non_nullable
as bool,isApplied: null == isApplied ? _self.isApplied : isApplied // ignore: cast_nullable_to_non_nullable
as bool,qrCode: freezed == qrCode ? _self.qrCode : qrCode // ignore: cast_nullable_to_non_nullable
as String?,appliedAt: freezed == appliedAt ? _self.appliedAt : appliedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}


}

// dart format on
