// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedEvent implements DiagnosticableTreeMixin {

 String get id; String get eventId; String get userId; String get eventTitle; String get eventLocation; String get status;// "saved", "added_to_calendar"
@TimestampConverter() Timestamp get createdAt;
/// Create a copy of SavedEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedEventCopyWith<SavedEvent> get copyWith => _$SavedEventCopyWithImpl<SavedEvent>(this as SavedEvent, _$identity);

  /// Serializes this SavedEvent to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SavedEvent'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('eventId', eventId))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('eventTitle', eventTitle))..add(DiagnosticsProperty('eventLocation', eventLocation))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.eventTitle, eventTitle) || other.eventTitle == eventTitle)&&(identical(other.eventLocation, eventLocation) || other.eventLocation == eventLocation)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,eventId,userId,eventTitle,eventLocation,status,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SavedEvent(id: $id, eventId: $eventId, userId: $userId, eventTitle: $eventTitle, eventLocation: $eventLocation, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SavedEventCopyWith<$Res>  {
  factory $SavedEventCopyWith(SavedEvent value, $Res Function(SavedEvent) _then) = _$SavedEventCopyWithImpl;
@useResult
$Res call({
 String id, String eventId, String userId, String eventTitle, String eventLocation, String status,@TimestampConverter() Timestamp createdAt
});




}
/// @nodoc
class _$SavedEventCopyWithImpl<$Res>
    implements $SavedEventCopyWith<$Res> {
  _$SavedEventCopyWithImpl(this._self, this._then);

  final SavedEvent _self;
  final $Res Function(SavedEvent) _then;

/// Create a copy of SavedEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? eventId = null,Object? userId = null,Object? eventTitle = null,Object? eventLocation = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,eventTitle: null == eventTitle ? _self.eventTitle : eventTitle // ignore: cast_nullable_to_non_nullable
as String,eventLocation: null == eventLocation ? _self.eventLocation : eventLocation // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SavedEvent with DiagnosticableTreeMixin implements SavedEvent {
   _SavedEvent({required this.id, required this.eventId, required this.userId, required this.eventTitle, required this.eventLocation, required this.status, @TimestampConverter() required this.createdAt});
  factory _SavedEvent.fromJson(Map<String, dynamic> json) => _$SavedEventFromJson(json);

@override final  String id;
@override final  String eventId;
@override final  String userId;
@override final  String eventTitle;
@override final  String eventLocation;
@override final  String status;
// "saved", "added_to_calendar"
@override@TimestampConverter() final  Timestamp createdAt;

/// Create a copy of SavedEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedEventCopyWith<_SavedEvent> get copyWith => __$SavedEventCopyWithImpl<_SavedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedEventToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SavedEvent'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('eventId', eventId))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('eventTitle', eventTitle))..add(DiagnosticsProperty('eventLocation', eventLocation))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.eventTitle, eventTitle) || other.eventTitle == eventTitle)&&(identical(other.eventLocation, eventLocation) || other.eventLocation == eventLocation)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,eventId,userId,eventTitle,eventLocation,status,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SavedEvent(id: $id, eventId: $eventId, userId: $userId, eventTitle: $eventTitle, eventLocation: $eventLocation, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SavedEventCopyWith<$Res> implements $SavedEventCopyWith<$Res> {
  factory _$SavedEventCopyWith(_SavedEvent value, $Res Function(_SavedEvent) _then) = __$SavedEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String eventId, String userId, String eventTitle, String eventLocation, String status,@TimestampConverter() Timestamp createdAt
});




}
/// @nodoc
class __$SavedEventCopyWithImpl<$Res>
    implements _$SavedEventCopyWith<$Res> {
  __$SavedEventCopyWithImpl(this._self, this._then);

  final _SavedEvent _self;
  final $Res Function(_SavedEvent) _then;

/// Create a copy of SavedEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? eventId = null,Object? userId = null,Object? eventTitle = null,Object? eventLocation = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_SavedEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,eventTitle: null == eventTitle ? _self.eventTitle : eventTitle // ignore: cast_nullable_to_non_nullable
as String,eventLocation: null == eventLocation ? _self.eventLocation : eventLocation // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp,
  ));
}


}

// dart format on
