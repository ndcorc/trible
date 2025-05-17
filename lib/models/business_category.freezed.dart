// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessCategory implements DiagnosticableTreeMixin {

 String get name; String get imageUrl;
/// Create a copy of BusinessCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCategoryCopyWith<BusinessCategory> get copyWith => _$BusinessCategoryCopyWithImpl<BusinessCategory>(this as BusinessCategory, _$identity);

  /// Serializes this BusinessCategory to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BusinessCategory'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('imageUrl', imageUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,imageUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BusinessCategory(name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $BusinessCategoryCopyWith<$Res>  {
  factory $BusinessCategoryCopyWith(BusinessCategory value, $Res Function(BusinessCategory) _then) = _$BusinessCategoryCopyWithImpl;
@useResult
$Res call({
 String name, String imageUrl
});




}
/// @nodoc
class _$BusinessCategoryCopyWithImpl<$Res>
    implements $BusinessCategoryCopyWith<$Res> {
  _$BusinessCategoryCopyWithImpl(this._self, this._then);

  final BusinessCategory _self;
  final $Res Function(BusinessCategory) _then;

/// Create a copy of BusinessCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BusinessCategory with DiagnosticableTreeMixin implements BusinessCategory {
   _BusinessCategory({required this.name, required this.imageUrl});
  factory _BusinessCategory.fromJson(Map<String, dynamic> json) => _$BusinessCategoryFromJson(json);

@override final  String name;
@override final  String imageUrl;

/// Create a copy of BusinessCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCategoryCopyWith<_BusinessCategory> get copyWith => __$BusinessCategoryCopyWithImpl<_BusinessCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCategoryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BusinessCategory'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('imageUrl', imageUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCategory&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,imageUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BusinessCategory(name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$BusinessCategoryCopyWith<$Res> implements $BusinessCategoryCopyWith<$Res> {
  factory _$BusinessCategoryCopyWith(_BusinessCategory value, $Res Function(_BusinessCategory) _then) = __$BusinessCategoryCopyWithImpl;
@override @useResult
$Res call({
 String name, String imageUrl
});




}
/// @nodoc
class __$BusinessCategoryCopyWithImpl<$Res>
    implements _$BusinessCategoryCopyWith<$Res> {
  __$BusinessCategoryCopyWithImpl(this._self, this._then);

  final _BusinessCategory _self;
  final $Res Function(_BusinessCategory) _then;

/// Create a copy of BusinessCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? imageUrl = null,}) {
  return _then(_BusinessCategory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
