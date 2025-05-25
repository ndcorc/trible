// Custom JSON converters for Firestore types
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

class DocumentReferenceConverter
    implements JsonConverter<DocumentReference?, dynamic> {
  const DocumentReferenceConverter();

  @override
  DocumentReference? fromJson(dynamic json) {
    if (json is DocumentReference) return json;
    if (json == null) return null;
    if (json is Map<String, dynamic>) {
      if (json.containsKey('path')) {
        return FirebaseFirestore.instance.doc(json['path'] as String);
      }
    }
    if (json is String) return FirebaseFirestore.instance.doc(json);
    return null;
  }

  @override
  Map<String, dynamic>? toJson(DocumentReference? docRef) {
    if (docRef == null) return null;
    return {'path': docRef.path};
  }
}

class TimestampConverter implements JsonConverter<Timestamp, dynamic> {
  const TimestampConverter();

  @override
  Timestamp fromJson(dynamic json) {
    if (json is Timestamp) return json;
    if (json is int) return Timestamp.fromMillisecondsSinceEpoch(json);
    if (json is Map<String, dynamic>) {
      if (json.containsKey('seconds') && json.containsKey('nanoseconds')) {
        return Timestamp(json['seconds'] as int, json['nanoseconds'] as int);
      }
    }
    return Timestamp.now();
  }

  @override
  dynamic toJson(Timestamp timestamp) {
    return {'seconds': timestamp.seconds, 'nanoseconds': timestamp.nanoseconds};
  }
}

class GeoPointConverter implements JsonConverter<GeoPoint, dynamic> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(dynamic json) {
    if (json is GeoPoint) {
      return json;
    }

    if (json is Map<String, dynamic>) {
      return GeoPoint(
        (json['latitude'] as num).toDouble(),
        (json['longitude'] as num).toDouble(),
      );
    }

    return const GeoPoint(0, 0);
  }

  @override
  Map<String, dynamic> toJson(GeoPoint geoPoint) {
    return {'latitude': geoPoint.latitude, 'longitude': geoPoint.longitude};
  }
}
