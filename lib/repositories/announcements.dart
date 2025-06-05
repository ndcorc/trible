import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/announcement.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'announcements.g.dart';

@riverpod
AnnouncementsRepository announcementsRepo(ref) => AnnouncementsRepository();

final _announcementListKey = 'announcementListKey';

class AnnouncementsRepository {
  AnnouncementsRepository();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'announcements';

  Future<List<Announcement>> getAnnouncementList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    try {
      final List<Map<String, dynamic>> announcementsJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_announcementListKey) ?? '[]'),
          );
      if (announcementsJsonList.isEmpty) {
        final snapshot =
            await _firestore
                .collection(_collection)
                .where('isActive', isEqualTo: true)
                .orderBy('priority', descending: true)
                .orderBy('createdAt', descending: true)
                .get();
        List<Announcement> announcements =
            snapshot.docs.map((doc) {
              final data = doc.data();
              data['id'] = doc.id;
              return Announcement.fromJson(data);
            }).toList();
        announcements =
            announcements.isEmpty ? _getMockAnnouncements() : announcements;
        await saveAnnouncementList(announcements);
        return announcements;
      }
      return announcementsJsonList
          .map((json) => Announcement.fromJson(json))
          .toList();
    } catch (err) {
      print('Error processing announcement docs: $err');
      prefs.clear();
      return _getMockAnnouncements();
    }
  }

  Future<void> saveAnnouncementList(List<Announcement> announcementList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _announcementListKey,
      jsonEncode(
        announcementList.map((announcement) => announcement.toJson()).toList(),
      ),
    );
  }

  Future<Announcement> addAnnouncement(Announcement announcement) async {
    final docRef = await _firestore
        .collection(_collection)
        .add(announcement.toJson());
    return announcement.copyWith(id: docRef.id);
  }

  Future<void> updateAnnouncement(Announcement announcement) async {
    await _firestore
        .collection(_collection)
        .doc(announcement.id)
        .update(announcement.toJson());
  }

  Future<void> deleteAnnouncement(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  // Mock announcements for fallback
  List<Announcement> _getMockAnnouncements() {
    final now = Timestamp.now();

    return [
      Announcement(
        id: 'mock1',
        title: 'Now Hiring at Copper Moon Café!',
        description: 'Seeking part-time baristas and weekend bakers',
        isActive: true,
        priority: 3,
        createdAt: now,
      ),
      Announcement(
        id: 'mock2',
        title: 'New Boutique Opening: Hazel & Pine',
        description: 'Ribbon-cutting this Saturday at 10 AM on Main Street',
        isActive: true,
        priority: 2,
        createdAt: now,
      ),
      Announcement(
        id: 'mock3',
        title: 'Georgetown High School Choir Wins State',
        description: 'Big congrats to the Eagle Voices — first place!',
        isActive: true,
        priority: 1,
        createdAt: now,
      ),
      Announcement(
        id: 'mock4',
        title: 'Road Closure on Rock Street (Apr 22–24)',
        description: 'City maintenance will detour traffic via Austin Ave',
        isActive: true,
        priority: 4,
        createdAt: now,
      ),
      Announcement(
        id: 'mock5',
        title: 'New Splash Pad Coming to River Park',
        description:
            'Construction begins next month, opening planned for summer',
        isActive: true,
        priority: 1,
        createdAt: now,
      ),
    ];
  }
}
