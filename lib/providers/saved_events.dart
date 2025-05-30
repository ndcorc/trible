// lib/providers/saved_events.dart
import 'package:trible/models/saved_event.dart';
import 'package:trible/repositories/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_events.g.dart';

@riverpod
class SavedEventsNotifier extends _$SavedEventsNotifier {
  static const String _mockUserId = 'user123'; // Mock user ID

  Future<List<SavedEvent>> _fetchSavedEvents() async {
    return await ref.watch(userProfileRepoProvider).getSavedEvents(_mockUserId);
  }

  @override
  Future<List<SavedEvent>> build() async {
    return await _fetchSavedEvents();
  }
}
