// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoyaltyProgram {

 String get id; String get businessId; String get businessName; String get businessLogoUrl; String get programType;// e.g., "punch_card", "percentage_off"
 String get description; int? get currentPunches; int? get totalPunchesNeeded; double? get discountPercentage;@TimestampConverter() Timestamp get createdAt;
/// Create a copy of LoyaltyProgram
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoyaltyProgramCopyWith<LoyaltyProgram> get copyWith => _$LoyaltyProgramCopyWithImpl<LoyaltyProgram>(this as LoyaltyProgram, _$identity);

  /// Serializes this LoyaltyProgram to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoyaltyProgram&&(identical(other.id, id) || other.id == id)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.businessLogoUrl, businessLogoUrl) || other.businessLogoUrl == businessLogoUrl)&&(identical(other.programType, programType) || other.programType == programType)&&(identical(other.description, description) || other.description == description)&&(identical(other.currentPunches, currentPunches) || other.currentPunches == currentPunches)&&(identical(other.totalPunchesNeeded, totalPunchesNeeded) || other.totalPunchesNeeded == totalPunchesNeeded)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,businessId,businessName,businessLogoUrl,programType,description,currentPunches,totalPunchesNeeded,discountPercentage,createdAt);

@override
String toString() {
  return 'LoyaltyProgram(id: $id, businessId: $businessId, businessName: $businessName, businessLogoUrl: $businessLogoUrl, programType: $programType, description: $description, currentPunches: $currentPunches, totalPunchesNeeded: $totalPunchesNeeded, discountPercentage: $discountPercentage, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $LoyaltyProgramCopyWith<$Res>  {
  factory $LoyaltyProgramCopyWith(LoyaltyProgram value, $Res Function(LoyaltyProgram) _then) = _$LoyaltyProgramCopyWithImpl;
@useResult
$Res call({
 String id, String businessId, String businessName, String businessLogoUrl, String programType, String description, int? currentPunches, int? totalPunchesNeeded, double? discountPercentage,@TimestampConverter() Timestamp createdAt
});




}
/// @nodoc
class _$LoyaltyProgramCopyWithImpl<$Res>
    implements $LoyaltyProgramCopyWith<$Res> {
  _$LoyaltyProgramCopyWithImpl(this._self, this._then);

  final LoyaltyProgram _self;
  final $Res Function(LoyaltyProgram) _then;

/// Create a copy of LoyaltyProgram
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? businessId = null,Object? businessName = null,Object? businessLogoUrl = null,Object? programType = null,Object? description = null,Object? currentPunches = freezed,Object? totalPunchesNeeded = freezed,Object? discountPercentage = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,businessName: null == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String,businessLogoUrl: null == businessLogoUrl ? _self.businessLogoUrl : businessLogoUrl // ignore: cast_nullable_to_non_nullable
as String,programType: null == programType ? _self.programType : programType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,currentPunches: freezed == currentPunches ? _self.currentPunches : currentPunches // ignore: cast_nullable_to_non_nullable
as int?,totalPunchesNeeded: freezed == totalPunchesNeeded ? _self.totalPunchesNeeded : totalPunchesNeeded // ignore: cast_nullable_to_non_nullable
as int?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LoyaltyProgram implements LoyaltyProgram {
   _LoyaltyProgram({required this.id, required this.businessId, required this.businessName, required this.businessLogoUrl, required this.programType, required this.description, this.currentPunches, this.totalPunchesNeeded, this.discountPercentage, @TimestampConverter() required this.createdAt});
  factory _LoyaltyProgram.fromJson(Map<String, dynamic> json) => _$LoyaltyProgramFromJson(json);

@override final  String id;
@override final  String businessId;
@override final  String businessName;
@override final  String businessLogoUrl;
@override final  String programType;
// e.g., "punch_card", "percentage_off"
@override final  String description;
@override final  int? currentPunches;
@override final  int? totalPunchesNeeded;
@override final  double? discountPercentage;
@override@TimestampConverter() final  Timestamp createdAt;

/// Create a copy of LoyaltyProgram
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoyaltyProgramCopyWith<_LoyaltyProgram> get copyWith => __$LoyaltyProgramCopyWithImpl<_LoyaltyProgram>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoyaltyProgramToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoyaltyProgram&&(identical(other.id, id) || other.id == id)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.businessLogoUrl, businessLogoUrl) || other.businessLogoUrl == businessLogoUrl)&&(identical(other.programType, programType) || other.programType == programType)&&(identical(other.description, description) || other.description == description)&&(identical(other.currentPunches, currentPunches) || other.currentPunches == currentPunches)&&(identical(other.totalPunchesNeeded, totalPunchesNeeded) || other.totalPunchesNeeded == totalPunchesNeeded)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,businessId,businessName,businessLogoUrl,programType,description,currentPunches,totalPunchesNeeded,discountPercentage,createdAt);

@override
String toString() {
  return 'LoyaltyProgram(id: $id, businessId: $businessId, businessName: $businessName, businessLogoUrl: $businessLogoUrl, programType: $programType, description: $description, currentPunches: $currentPunches, totalPunchesNeeded: $totalPunchesNeeded, discountPercentage: $discountPercentage, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LoyaltyProgramCopyWith<$Res> implements $LoyaltyProgramCopyWith<$Res> {
  factory _$LoyaltyProgramCopyWith(_LoyaltyProgram value, $Res Function(_LoyaltyProgram) _then) = __$LoyaltyProgramCopyWithImpl;
@override @useResult
$Res call({
 String id, String businessId, String businessName, String businessLogoUrl, String programType, String description, int? currentPunches, int? totalPunchesNeeded, double? discountPercentage,@TimestampConverter() Timestamp createdAt
});




}
/// @nodoc
class __$LoyaltyProgramCopyWithImpl<$Res>
    implements _$LoyaltyProgramCopyWith<$Res> {
  __$LoyaltyProgramCopyWithImpl(this._self, this._then);

  final _LoyaltyProgram _self;
  final $Res Function(_LoyaltyProgram) _then;

/// Create a copy of LoyaltyProgram
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? businessId = null,Object? businessName = null,Object? businessLogoUrl = null,Object? programType = null,Object? description = null,Object? currentPunches = freezed,Object? totalPunchesNeeded = freezed,Object? discountPercentage = freezed,Object? createdAt = null,}) {
  return _then(_LoyaltyProgram(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as String,businessName: null == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String,businessLogoUrl: null == businessLogoUrl ? _self.businessLogoUrl : businessLogoUrl // ignore: cast_nullable_to_non_nullable
as String,programType: null == programType ? _self.programType : programType // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,currentPunches: freezed == currentPunches ? _self.currentPunches : currentPunches // ignore: cast_nullable_to_non_nullable
as int?,totalPunchesNeeded: freezed == totalPunchesNeeded ? _self.totalPunchesNeeded : totalPunchesNeeded // ignore: cast_nullable_to_non_nullable
as int?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}


}

// dart format on
