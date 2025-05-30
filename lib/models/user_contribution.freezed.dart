// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_contribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserContribution implements DiagnosticableTreeMixin {

 String get id; String get userId; String get type;// "event_submission", "event_rsvp", etc.
 String get title; String get description;@TimestampConverter() Timestamp get createdAt;
/// Create a copy of UserContribution
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserContributionCopyWith<UserContribution> get copyWith => _$UserContributionCopyWithImpl<UserContribution>(this as UserContribution, _$identity);

  /// Serializes this UserContribution to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserContribution'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserContribution&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,title,description,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserContribution(id: $id, userId: $userId, type: $type, title: $title, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserContributionCopyWith<$Res>  {
  factory $UserContributionCopyWith(UserContribution value, $Res Function(UserContribution) _then) = _$UserContributionCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String type, String title, String description,@TimestampConverter() Timestamp createdAt
});




}
/// @nodoc
class _$UserContributionCopyWithImpl<$Res>
    implements $UserContributionCopyWith<$Res> {
  _$UserContributionCopyWithImpl(this._self, this._then);

  final UserContribution _self;
  final $Res Function(UserContribution) _then;

/// Create a copy of UserContribution
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? title = null,Object? description = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserContribution with DiagnosticableTreeMixin implements UserContribution {
   _UserContribution({required this.id, required this.userId, required this.type, required this.title, required this.description, @TimestampConverter() required this.createdAt});
  factory _UserContribution.fromJson(Map<String, dynamic> json) => _$UserContributionFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String type;
// "event_submission", "event_rsvp", etc.
@override final  String title;
@override final  String description;
@override@TimestampConverter() final  Timestamp createdAt;

/// Create a copy of UserContribution
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserContributionCopyWith<_UserContribution> get copyWith => __$UserContributionCopyWithImpl<_UserContribution>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserContributionToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserContribution'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserContribution&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,type,title,description,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserContribution(id: $id, userId: $userId, type: $type, title: $title, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserContributionCopyWith<$Res> implements $UserContributionCopyWith<$Res> {
  factory _$UserContributionCopyWith(_UserContribution value, $Res Function(_UserContribution) _then) = __$UserContributionCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String type, String title, String description,@TimestampConverter() Timestamp createdAt
});




}
/// @nodoc
class __$UserContributionCopyWithImpl<$Res>
    implements _$UserContributionCopyWith<$Res> {
  __$UserContributionCopyWithImpl(this._self, this._then);

  final _UserContribution _self;
  final $Res Function(_UserContribution) _then;

/// Create a copy of UserContribution
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? type = null,Object? title = null,Object? description = null,Object? createdAt = null,}) {
  return _then(_UserContribution(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}


}

// dart format on
