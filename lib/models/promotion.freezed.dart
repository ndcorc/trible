// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Promotion implements DiagnosticableTreeMixin {

 String get id; String get title; String? get description;@TimestampConverter() Timestamp get expirationDate;@DocumentReferenceConverter() DocumentReference? get businessRef; Business? get business;
/// Create a copy of Promotion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromotionCopyWith<Promotion> get copyWith => _$PromotionCopyWithImpl<Promotion>(this as Promotion, _$identity);

  /// Serializes this Promotion to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Promotion'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('expirationDate', expirationDate))..add(DiagnosticsProperty('businessRef', businessRef))..add(DiagnosticsProperty('business', business));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Promotion&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.businessRef, businessRef) || other.businessRef == businessRef)&&(identical(other.business, business) || other.business == business));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,expirationDate,businessRef,business);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Promotion(id: $id, title: $title, description: $description, expirationDate: $expirationDate, businessRef: $businessRef, business: $business)';
}


}

/// @nodoc
abstract mixin class $PromotionCopyWith<$Res>  {
  factory $PromotionCopyWith(Promotion value, $Res Function(Promotion) _then) = _$PromotionCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description,@TimestampConverter() Timestamp expirationDate,@DocumentReferenceConverter() DocumentReference? businessRef, Business? business
});


$BusinessCopyWith<$Res>? get business;

}
/// @nodoc
class _$PromotionCopyWithImpl<$Res>
    implements $PromotionCopyWith<$Res> {
  _$PromotionCopyWithImpl(this._self, this._then);

  final Promotion _self;
  final $Res Function(Promotion) _then;

/// Create a copy of Promotion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? expirationDate = null,Object? businessRef = freezed,Object? business = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as Timestamp,businessRef: freezed == businessRef ? _self.businessRef : businessRef // ignore: cast_nullable_to_non_nullable
as DocumentReference?,business: freezed == business ? _self.business : business // ignore: cast_nullable_to_non_nullable
as Business?,
  ));
}
/// Create a copy of Promotion
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

class _Promotion with DiagnosticableTreeMixin implements Promotion {
   _Promotion({required this.id, required this.title, this.description, @TimestampConverter() required this.expirationDate, @DocumentReferenceConverter() this.businessRef, this.business});
  factory _Promotion.fromJson(Map<String, dynamic> json) => _$PromotionFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@TimestampConverter() final  Timestamp expirationDate;
@override@DocumentReferenceConverter() final  DocumentReference? businessRef;
@override final  Business? business;

/// Create a copy of Promotion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromotionCopyWith<_Promotion> get copyWith => __$PromotionCopyWithImpl<_Promotion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromotionToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Promotion'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('expirationDate', expirationDate))..add(DiagnosticsProperty('businessRef', businessRef))..add(DiagnosticsProperty('business', business));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Promotion&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.businessRef, businessRef) || other.businessRef == businessRef)&&(identical(other.business, business) || other.business == business));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,expirationDate,businessRef,business);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Promotion(id: $id, title: $title, description: $description, expirationDate: $expirationDate, businessRef: $businessRef, business: $business)';
}


}

/// @nodoc
abstract mixin class _$PromotionCopyWith<$Res> implements $PromotionCopyWith<$Res> {
  factory _$PromotionCopyWith(_Promotion value, $Res Function(_Promotion) _then) = __$PromotionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description,@TimestampConverter() Timestamp expirationDate,@DocumentReferenceConverter() DocumentReference? businessRef, Business? business
});


@override $BusinessCopyWith<$Res>? get business;

}
/// @nodoc
class __$PromotionCopyWithImpl<$Res>
    implements _$PromotionCopyWith<$Res> {
  __$PromotionCopyWithImpl(this._self, this._then);

  final _Promotion _self;
  final $Res Function(_Promotion) _then;

/// Create a copy of Promotion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? expirationDate = null,Object? businessRef = freezed,Object? business = freezed,}) {
  return _then(_Promotion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as Timestamp,businessRef: freezed == businessRef ? _self.businessRef : businessRef // ignore: cast_nullable_to_non_nullable
as DocumentReference?,business: freezed == business ? _self.business : business // ignore: cast_nullable_to_non_nullable
as Business?,
  ));
}

/// Create a copy of Promotion
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

// dart format on
