import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/event.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'events.g.dart';

@riverpod
EventsRepository eventsRepo(ref) => EventsRepository();

final _eventListKey = 'eventListKey';

class EventsRepository {
  EventsRepository();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'events';

  Future<List<Event>> getEventList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    try {
      final List<Map<String, dynamic>> eventsJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_eventListKey) ?? '[]'),
          );
      if (eventsJsonList.isEmpty) {
        final snapshot =
            await _firestore
                .collection(_collection)
                .where('isActive', isEqualTo: true)
                .orderBy('startTime')
                .get();
        List<Event> events =
            snapshot.docs.map((doc) {
              final data = doc.data();
              data['id'] = doc.id;
              return Event.fromJson(data);
            }).toList();
        events = events.isEmpty ? _getMockEvents() : events;
        await saveEventList(events);
        return events;
      }
      return eventsJsonList.map((json) => Event.fromJson(json)).toList();
    } catch (err) {
      print('Error processing event docs: $err');
      prefs.clear();
      return _getMockEvents();
    }
  }

  Future<void> saveEventList(List<Event> eventList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _eventListKey,
      jsonEncode(eventList.map((event) => event.toJson()).toList()),
    );
  }

  Future<Event> addEvent(Event event) async {
    final docRef = await _firestore.collection(_collection).add(event.toJson());
    return event.copyWith(id: docRef.id);
  }

  Future<void> updateEvent(Event event) async {
    await _firestore
        .collection(_collection)
        .doc(event.id)
        .update(event.toJson());
  }

  Future<void> deleteEvent(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  // Mock events for fallback
  List<Event> _getMockEvents() {
    final now = Timestamp.now();
    final today = DateTime.now();

    return [
      Event(
        id: 'mock1',
        title: "Local Maker's Market",
        location: 'Georgetown Square',
        description: 'Weekly market featuring local artisans and vendors',
        startTime: Timestamp.fromDate(
          today.add(Duration(days: 1)).copyWith(hour: 10, minute: 0),
        ),
        endTime: Timestamp.fromDate(
          today.add(Duration(days: 1)).copyWith(hour: 14, minute: 0),
        ),
        isActive: true,
        createdAt: now,
      ),
      Event(
        id: 'mock2',
        title: 'Trivia night at BrewHaus',
        location: '113 W Elm Street',
        description: 'Weekly trivia night with prizes and great beer',
        startTime: Timestamp.fromDate(
          today.add(Duration(days: 1)).copyWith(hour: 19, minute: 0),
        ),
        endTime: Timestamp.fromDate(
          today.add(Duration(days: 1)).copyWith(hour: 22, minute: 0),
        ),
        isActive: true,
        createdAt: now,
      ),
      Event(
        id: 'mock3',
        title: 'First Friday Art Walk',
        location: 'Georgetown Square',
        description: 'Monthly art walk featuring local galleries and artists',
        startTime: Timestamp.fromDate(
          today.add(Duration(days: 2)).copyWith(hour: 18, minute: 0),
        ),
        endTime: Timestamp.fromDate(
          today.add(Duration(days: 2)).copyWith(hour: 21, minute: 0),
        ),
        isActive: true,
        createdAt: now,
      ),
    ];
  }
}
