import 'package:trible/models/announcement.dart';
import 'package:trible/providers/sort.dart';
import 'package:trible/repositories/announcements.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'announcements.g.dart';

@riverpod
class Announcements extends _$Announcements {
  Future<List<Announcement>> _fetchAnnouncements() async {
    return await ref.watch(announcementsRepoProvider).getAnnouncementList();
  }

  @override
  Future<List<Announcement>> build() async {
    final announcements = await _fetchAnnouncements();
    final sort = ref.watch(sortProvider);

    return switch (sort) {
      SortOrder.ASC =>
        announcements..sort((a, b) {
          final priorityComparison = a.priority.compareTo(b.priority);
          if (priorityComparison != 0) return priorityComparison;
          return a.createdAt.compareTo(b.createdAt);
        }),
      SortOrder.DESC =>
        announcements..sort((a, b) {
          final priorityComparison = b.priority.compareTo(a.priority);
          if (priorityComparison != 0) return priorityComparison;
          return b.createdAt.compareTo(a.createdAt);
        }),
    };
  }

  // Let's allow the UI to add Announcements.
  Future<void> addAnnouncement(Announcement announcement) async {
    state = const AsyncValue.loading();
    final newAnnouncements = [...?state.value, announcement];
    state = await AsyncValue.guard(() async {
      await ref
          .watch(announcementsRepoProvider)
          .saveAnnouncementList(newAnnouncements);
      return _fetchAnnouncements();
    });
  }

  // Let's allow removing Announcements
  Future<void> removeAnnouncement(String announcementId) async {
    state = const AsyncValue.loading();
    final newAnnouncements = [
      for (final announcement in state.value!)
        if (announcement.id != announcementId) announcement,
    ];
    state = await AsyncValue.guard(() async {
      await ref
          .watch(announcementsRepoProvider)
          .saveAnnouncementList(newAnnouncements);
      return _fetchAnnouncements();
    });
  }
}
