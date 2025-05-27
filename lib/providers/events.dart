import 'package:trible/models/event.dart';
import 'package:trible/providers/sort.dart';
import 'package:trible/repositories/events.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'events.g.dart';

@riverpod
class Events extends _$Events {
  Future<List<Event>> _fetchEvents() async {
    return await ref.watch(eventsRepoProvider).getEventList();
  }

  @override
  Future<List<Event>> build() async {
    final events = await _fetchEvents();
    final sort = ref.watch(sortProvider);

    return switch (sort) {
      SortOrder.ASC =>
        events..sort((a, b) => a.startTime.compareTo(b.startTime)),
      SortOrder.DESC =>
        events..sort((a, b) => b.startTime.compareTo(a.startTime)),
    };
  }

  // Let's allow the UI to add Events.
  Future<void> addEvent(Event event) async {
    state = const AsyncValue.loading();
    final newEvents = [...?state.value, event];
    state = await AsyncValue.guard(() async {
      await ref.watch(eventsRepoProvider).saveEventList(newEvents);
      return _fetchEvents();
    });
  }

  // Let's allow removing Events
  Future<void> removeEvent(String eventId) async {
    state = const AsyncValue.loading();
    final newEvents = [
      for (final event in state.value!)
        if (event.id != eventId) event,
    ];
    state = await AsyncValue.guard(() async {
      await ref.watch(eventsRepoProvider).saveEventList(newEvents);
      return _fetchEvents();
    });
  }
}
