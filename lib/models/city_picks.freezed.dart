// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_picks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityPicks implements DiagnosticableTreeMixin {

 String get id; String get userId; String get cityName; String get cityImageUrl; List<String> get businessIds;@TimestampConverter() Timestamp get createdAt;@TimestampConverter() Timestamp? get updatedAt;
/// Create a copy of CityPicks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityPicksCopyWith<CityPicks> get copyWith => _$CityPicksCopyWithImpl<CityPicks>(this as CityPicks, _$identity);

  /// Serializes this CityPicks to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CityPicks'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('cityName', cityName))..add(DiagnosticsProperty('cityImageUrl', cityImageUrl))..add(DiagnosticsProperty('businessIds', businessIds))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityPicks&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.cityImageUrl, cityImageUrl) || other.cityImageUrl == cityImageUrl)&&const DeepCollectionEquality().equals(other.businessIds, businessIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,cityName,cityImageUrl,const DeepCollectionEquality().hash(businessIds),createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CityPicks(id: $id, userId: $userId, cityName: $cityName, cityImageUrl: $cityImageUrl, businessIds: $businessIds, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CityPicksCopyWith<$Res>  {
  factory $CityPicksCopyWith(CityPicks value, $Res Function(CityPicks) _then) = _$CityPicksCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String cityName, String cityImageUrl, List<String> businessIds,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp? updatedAt
});




}
/// @nodoc
class _$CityPicksCopyWithImpl<$Res>
    implements $CityPicksCopyWith<$Res> {
  _$CityPicksCopyWithImpl(this._self, this._then);

  final CityPicks _self;
  final $Res Function(CityPicks) _then;

/// Create a copy of CityPicks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? cityName = null,Object? cityImageUrl = null,Object? businessIds = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,cityImageUrl: null == cityImageUrl ? _self.cityImageUrl : cityImageUrl // ignore: cast_nullable_to_non_nullable
as String,businessIds: null == businessIds ? _self.businessIds : businessIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CityPicks with DiagnosticableTreeMixin implements CityPicks {
   _CityPicks({required this.id, required this.userId, required this.cityName, required this.cityImageUrl, required final  List<String> businessIds, @TimestampConverter() required this.createdAt, @TimestampConverter() this.updatedAt}): _businessIds = businessIds;
  factory _CityPicks.fromJson(Map<String, dynamic> json) => _$CityPicksFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String cityName;
@override final  String cityImageUrl;
 final  List<String> _businessIds;
@override List<String> get businessIds {
  if (_businessIds is EqualUnmodifiableListView) return _businessIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_businessIds);
}

@override@TimestampConverter() final  Timestamp createdAt;
@override@TimestampConverter() final  Timestamp? updatedAt;

/// Create a copy of CityPicks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityPicksCopyWith<_CityPicks> get copyWith => __$CityPicksCopyWithImpl<_CityPicks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CityPicksToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CityPicks'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('cityName', cityName))..add(DiagnosticsProperty('cityImageUrl', cityImageUrl))..add(DiagnosticsProperty('businessIds', businessIds))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityPicks&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.cityImageUrl, cityImageUrl) || other.cityImageUrl == cityImageUrl)&&const DeepCollectionEquality().equals(other._businessIds, _businessIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,cityName,cityImageUrl,const DeepCollectionEquality().hash(_businessIds),createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CityPicks(id: $id, userId: $userId, cityName: $cityName, cityImageUrl: $cityImageUrl, businessIds: $businessIds, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CityPicksCopyWith<$Res> implements $CityPicksCopyWith<$Res> {
  factory _$CityPicksCopyWith(_CityPicks value, $Res Function(_CityPicks) _then) = __$CityPicksCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String cityName, String cityImageUrl, List<String> businessIds,@TimestampConverter() Timestamp createdAt,@TimestampConverter() Timestamp? updatedAt
});




}
/// @nodoc
class __$CityPicksCopyWithImpl<$Res>
    implements _$CityPicksCopyWith<$Res> {
  __$CityPicksCopyWithImpl(this._self, this._then);

  final _CityPicks _self;
  final $Res Function(_CityPicks) _then;

/// Create a copy of CityPicks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? cityName = null,Object? cityImageUrl = null,Object? businessIds = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_CityPicks(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,cityImageUrl: null == cityImageUrl ? _self.cityImageUrl : cityImageUrl // ignore: cast_nullable_to_non_nullable
as String,businessIds: null == businessIds ? _self._businessIds : businessIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}


}

// dart format on
