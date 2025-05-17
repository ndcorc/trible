// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Business implements DiagnosticableTreeMixin {

 String get id; String get name; String get tagline; String get logoUrl; String get coverImageUrl; String get checkInInstructions; bool get isActive; String get address; String get city; String get state; int get phone; String get redeemPolicy; int get waitlistInterestScore; String get website;@GeoPointConverter() GeoPoint get location;@DocumentReferenceConverter() DocumentReference? get owner;@DocumentReferenceConverter() DocumentReference? get category;@TimestampConverter() Timestamp get joinedAt;// Keep lat/lon for convenience but make them computed getters
@JsonKey(includeFromJson: false, includeToJson: false) double? get lat;@JsonKey(includeFromJson: false, includeToJson: false) double? get lon;
/// Create a copy of Business
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCopyWith<Business> get copyWith => _$BusinessCopyWithImpl<Business>(this as Business, _$identity);

  /// Serializes this Business to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Business'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('tagline', tagline))..add(DiagnosticsProperty('logoUrl', logoUrl))..add(DiagnosticsProperty('coverImageUrl', coverImageUrl))..add(DiagnosticsProperty('checkInInstructions', checkInInstructions))..add(DiagnosticsProperty('isActive', isActive))..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('city', city))..add(DiagnosticsProperty('state', state))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('redeemPolicy', redeemPolicy))..add(DiagnosticsProperty('waitlistInterestScore', waitlistInterestScore))..add(DiagnosticsProperty('website', website))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('owner', owner))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('joinedAt', joinedAt))..add(DiagnosticsProperty('lat', lat))..add(DiagnosticsProperty('lon', lon));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Business&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.checkInInstructions, checkInInstructions) || other.checkInInstructions == checkInInstructions)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.redeemPolicy, redeemPolicy) || other.redeemPolicy == redeemPolicy)&&(identical(other.waitlistInterestScore, waitlistInterestScore) || other.waitlistInterestScore == waitlistInterestScore)&&(identical(other.website, website) || other.website == website)&&(identical(other.location, location) || other.location == location)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.category, category) || other.category == category)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,tagline,logoUrl,coverImageUrl,checkInInstructions,isActive,address,city,state,phone,redeemPolicy,waitlistInterestScore,website,location,owner,category,joinedAt,lat,lon]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Business(id: $id, name: $name, tagline: $tagline, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, checkInInstructions: $checkInInstructions, isActive: $isActive, address: $address, city: $city, state: $state, phone: $phone, redeemPolicy: $redeemPolicy, waitlistInterestScore: $waitlistInterestScore, website: $website, location: $location, owner: $owner, category: $category, joinedAt: $joinedAt, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $BusinessCopyWith<$Res>  {
  factory $BusinessCopyWith(Business value, $Res Function(Business) _then) = _$BusinessCopyWithImpl;
@useResult
$Res call({
 String id, String name, String tagline, String logoUrl, String coverImageUrl, String checkInInstructions, bool isActive, String address, String city, String state, int phone, String redeemPolicy, int waitlistInterestScore, String website,@GeoPointConverter() GeoPoint location,@DocumentReferenceConverter() DocumentReference? owner,@DocumentReferenceConverter() DocumentReference? category,@TimestampConverter() Timestamp joinedAt,@JsonKey(includeFromJson: false, includeToJson: false) double? lat,@JsonKey(includeFromJson: false, includeToJson: false) double? lon
});




}
/// @nodoc
class _$BusinessCopyWithImpl<$Res>
    implements $BusinessCopyWith<$Res> {
  _$BusinessCopyWithImpl(this._self, this._then);

  final Business _self;
  final $Res Function(Business) _then;

/// Create a copy of Business
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? tagline = null,Object? logoUrl = null,Object? coverImageUrl = null,Object? checkInInstructions = null,Object? isActive = null,Object? address = null,Object? city = null,Object? state = null,Object? phone = null,Object? redeemPolicy = null,Object? waitlistInterestScore = null,Object? website = null,Object? location = null,Object? owner = freezed,Object? category = freezed,Object? joinedAt = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,checkInInstructions: null == checkInInstructions ? _self.checkInInstructions : checkInInstructions // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as int,redeemPolicy: null == redeemPolicy ? _self.redeemPolicy : redeemPolicy // ignore: cast_nullable_to_non_nullable
as String,waitlistInterestScore: null == waitlistInterestScore ? _self.waitlistInterestScore : waitlistInterestScore // ignore: cast_nullable_to_non_nullable
as int,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as DocumentReference?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as DocumentReference?,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Business with DiagnosticableTreeMixin implements Business {
   _Business({required this.id, required this.name, required this.tagline, required this.logoUrl, required this.coverImageUrl, required this.checkInInstructions, required this.isActive, required this.address, required this.city, required this.state, required this.phone, required this.redeemPolicy, required this.waitlistInterestScore, required this.website, @GeoPointConverter() required this.location, @DocumentReferenceConverter() this.owner, @DocumentReferenceConverter() this.category, @TimestampConverter() required this.joinedAt, @JsonKey(includeFromJson: false, includeToJson: false) this.lat, @JsonKey(includeFromJson: false, includeToJson: false) this.lon});
  factory _Business.fromJson(Map<String, dynamic> json) => _$BusinessFromJson(json);

@override final  String id;
@override final  String name;
@override final  String tagline;
@override final  String logoUrl;
@override final  String coverImageUrl;
@override final  String checkInInstructions;
@override final  bool isActive;
@override final  String address;
@override final  String city;
@override final  String state;
@override final  int phone;
@override final  String redeemPolicy;
@override final  int waitlistInterestScore;
@override final  String website;
@override@GeoPointConverter() final  GeoPoint location;
@override@DocumentReferenceConverter() final  DocumentReference? owner;
@override@DocumentReferenceConverter() final  DocumentReference? category;
@override@TimestampConverter() final  Timestamp joinedAt;
// Keep lat/lon for convenience but make them computed getters
@override@JsonKey(includeFromJson: false, includeToJson: false) final  double? lat;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  double? lon;

/// Create a copy of Business
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCopyWith<_Business> get copyWith => __$BusinessCopyWithImpl<_Business>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Business'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('tagline', tagline))..add(DiagnosticsProperty('logoUrl', logoUrl))..add(DiagnosticsProperty('coverImageUrl', coverImageUrl))..add(DiagnosticsProperty('checkInInstructions', checkInInstructions))..add(DiagnosticsProperty('isActive', isActive))..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('city', city))..add(DiagnosticsProperty('state', state))..add(DiagnosticsProperty('phone', phone))..add(DiagnosticsProperty('redeemPolicy', redeemPolicy))..add(DiagnosticsProperty('waitlistInterestScore', waitlistInterestScore))..add(DiagnosticsProperty('website', website))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('owner', owner))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('joinedAt', joinedAt))..add(DiagnosticsProperty('lat', lat))..add(DiagnosticsProperty('lon', lon));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Business&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.tagline, tagline) || other.tagline == tagline)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.checkInInstructions, checkInInstructions) || other.checkInInstructions == checkInInstructions)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.redeemPolicy, redeemPolicy) || other.redeemPolicy == redeemPolicy)&&(identical(other.waitlistInterestScore, waitlistInterestScore) || other.waitlistInterestScore == waitlistInterestScore)&&(identical(other.website, website) || other.website == website)&&(identical(other.location, location) || other.location == location)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.category, category) || other.category == category)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,tagline,logoUrl,coverImageUrl,checkInInstructions,isActive,address,city,state,phone,redeemPolicy,waitlistInterestScore,website,location,owner,category,joinedAt,lat,lon]);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Business(id: $id, name: $name, tagline: $tagline, logoUrl: $logoUrl, coverImageUrl: $coverImageUrl, checkInInstructions: $checkInInstructions, isActive: $isActive, address: $address, city: $city, state: $state, phone: $phone, redeemPolicy: $redeemPolicy, waitlistInterestScore: $waitlistInterestScore, website: $website, location: $location, owner: $owner, category: $category, joinedAt: $joinedAt, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$BusinessCopyWith<$Res> implements $BusinessCopyWith<$Res> {
  factory _$BusinessCopyWith(_Business value, $Res Function(_Business) _then) = __$BusinessCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String tagline, String logoUrl, String coverImageUrl, String checkInInstructions, bool isActive, String address, String city, String state, int phone, String redeemPolicy, int waitlistInterestScore, String website,@GeoPointConverter() GeoPoint location,@DocumentReferenceConverter() DocumentReference? owner,@DocumentReferenceConverter() DocumentReference? category,@TimestampConverter() Timestamp joinedAt,@JsonKey(includeFromJson: false, includeToJson: false) double? lat,@JsonKey(includeFromJson: false, includeToJson: false) double? lon
});




}
/// @nodoc
class __$BusinessCopyWithImpl<$Res>
    implements _$BusinessCopyWith<$Res> {
  __$BusinessCopyWithImpl(this._self, this._then);

  final _Business _self;
  final $Res Function(_Business) _then;

/// Create a copy of Business
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? tagline = null,Object? logoUrl = null,Object? coverImageUrl = null,Object? checkInInstructions = null,Object? isActive = null,Object? address = null,Object? city = null,Object? state = null,Object? phone = null,Object? redeemPolicy = null,Object? waitlistInterestScore = null,Object? website = null,Object? location = null,Object? owner = freezed,Object? category = freezed,Object? joinedAt = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_Business(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tagline: null == tagline ? _self.tagline : tagline // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,checkInInstructions: null == checkInInstructions ? _self.checkInInstructions : checkInInstructions // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as int,redeemPolicy: null == redeemPolicy ? _self.redeemPolicy : redeemPolicy // ignore: cast_nullable_to_non_nullable
as String,waitlistInterestScore: null == waitlistInterestScore ? _self.waitlistInterestScore : waitlistInterestScore // ignore: cast_nullable_to_non_nullable
as int,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoPoint,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as DocumentReference?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as DocumentReference?,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as Timestamp,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$BusinessLocation implements DiagnosticableTreeMixin {

 String get address; String get city; String get state;// Add the GeoPoint field
@GeoPointConverter() GeoPoint get geoPoint;// Keep lat/lon for convenience but make them computed getters
@JsonKey(includeFromJson: false, includeToJson: false) double? get lat;@JsonKey(includeFromJson: false, includeToJson: false) double? get lon;
/// Create a copy of BusinessLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessLocationCopyWith<BusinessLocation> get copyWith => _$BusinessLocationCopyWithImpl<BusinessLocation>(this as BusinessLocation, _$identity);

  /// Serializes this BusinessLocation to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BusinessLocation'))
    ..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('city', city))..add(DiagnosticsProperty('state', state))..add(DiagnosticsProperty('geoPoint', geoPoint))..add(DiagnosticsProperty('lat', lat))..add(DiagnosticsProperty('lon', lon));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessLocation&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.geoPoint, geoPoint) || other.geoPoint == geoPoint)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,city,state,geoPoint,lat,lon);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BusinessLocation(address: $address, city: $city, state: $state, geoPoint: $geoPoint, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $BusinessLocationCopyWith<$Res>  {
  factory $BusinessLocationCopyWith(BusinessLocation value, $Res Function(BusinessLocation) _then) = _$BusinessLocationCopyWithImpl;
@useResult
$Res call({
 String address, String city, String state,@GeoPointConverter() GeoPoint geoPoint,@JsonKey(includeFromJson: false, includeToJson: false) double? lat,@JsonKey(includeFromJson: false, includeToJson: false) double? lon
});




}
/// @nodoc
class _$BusinessLocationCopyWithImpl<$Res>
    implements $BusinessLocationCopyWith<$Res> {
  _$BusinessLocationCopyWithImpl(this._self, this._then);

  final BusinessLocation _self;
  final $Res Function(BusinessLocation) _then;

/// Create a copy of BusinessLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? city = null,Object? state = null,Object? geoPoint = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,geoPoint: null == geoPoint ? _self.geoPoint : geoPoint // ignore: cast_nullable_to_non_nullable
as GeoPoint,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BusinessLocation with DiagnosticableTreeMixin implements BusinessLocation {
   _BusinessLocation({required this.address, required this.city, required this.state, @GeoPointConverter() required this.geoPoint, @JsonKey(includeFromJson: false, includeToJson: false) this.lat, @JsonKey(includeFromJson: false, includeToJson: false) this.lon});
  factory _BusinessLocation.fromJson(Map<String, dynamic> json) => _$BusinessLocationFromJson(json);

@override final  String address;
@override final  String city;
@override final  String state;
// Add the GeoPoint field
@override@GeoPointConverter() final  GeoPoint geoPoint;
// Keep lat/lon for convenience but make them computed getters
@override@JsonKey(includeFromJson: false, includeToJson: false) final  double? lat;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  double? lon;

/// Create a copy of BusinessLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessLocationCopyWith<_BusinessLocation> get copyWith => __$BusinessLocationCopyWithImpl<_BusinessLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessLocationToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BusinessLocation'))
    ..add(DiagnosticsProperty('address', address))..add(DiagnosticsProperty('city', city))..add(DiagnosticsProperty('state', state))..add(DiagnosticsProperty('geoPoint', geoPoint))..add(DiagnosticsProperty('lat', lat))..add(DiagnosticsProperty('lon', lon));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessLocation&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.geoPoint, geoPoint) || other.geoPoint == geoPoint)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,city,state,geoPoint,lat,lon);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BusinessLocation(address: $address, city: $city, state: $state, geoPoint: $geoPoint, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$BusinessLocationCopyWith<$Res> implements $BusinessLocationCopyWith<$Res> {
  factory _$BusinessLocationCopyWith(_BusinessLocation value, $Res Function(_BusinessLocation) _then) = __$BusinessLocationCopyWithImpl;
@override @useResult
$Res call({
 String address, String city, String state,@GeoPointConverter() GeoPoint geoPoint,@JsonKey(includeFromJson: false, includeToJson: false) double? lat,@JsonKey(includeFromJson: false, includeToJson: false) double? lon
});




}
/// @nodoc
class __$BusinessLocationCopyWithImpl<$Res>
    implements _$BusinessLocationCopyWith<$Res> {
  __$BusinessLocationCopyWithImpl(this._self, this._then);

  final _BusinessLocation _self;
  final $Res Function(_BusinessLocation) _then;

/// Create a copy of BusinessLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? city = null,Object? state = null,Object? geoPoint = null,Object? lat = freezed,Object? lon = freezed,}) {
  return _then(_BusinessLocation(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,geoPoint: null == geoPoint ? _self.geoPoint : geoPoint // ignore: cast_nullable_to_non_nullable
as GeoPoint,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
