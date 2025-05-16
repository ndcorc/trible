import 'package:trible/models/business.dart';
import 'package:trible/providers/sort.dart';
import 'package:trible/repositories/businesses.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'businesses.g.dart';

@riverpod
class Businesses extends _$Businesses {
  Future<List<Business>> _fetchBusinesses() async {
    return await ref.watch(businessesRepoProvider).getBusinessList();
  }

  @override
  Future<List<Business>> build() async {
    final businesses = await _fetchBusinesses();
    //final filter = ref.watch(filterProvider);
    final sort = ref.watch(sortProvider);

    /* final filtered = switch (filter) {
      Filter.none => businesses,
      Filter.completed =>
        businesses.where((business) => business.completed).toList(),
      Filter.uncompleted =>
        businesses.where((business) => !business.completed).toList(),
    }; */

    return switch (sort) {
      SortOrder.ASC => businesses..sort((a, b) => a.id.compareTo(b.id)),
      SortOrder.DESC => businesses..sort((a, b) => b.id.compareTo(a.id)),
    };
  }

  // Let's allow the UI to add Businesses.
  Future<void> addBusiness(Business business) async {
    state = const AsyncValue.loading();
    final newBusinesses = [...?state.value, business];
    state = await AsyncValue.guard(() async {
      await ref.watch(businessesRepoProvider).saveBusinessList(newBusinesses);
      return _fetchBusinesses();
    });
  }

  // Let's allow removing Businesses
  Future<void> removeBusiness(String businessId) async {
    state = const AsyncValue.loading();
    final newBusinesses = [
      for (final business in state.value!)
        if (business.id != businessId) business,
    ];
    state = await AsyncValue.guard(() async {
      await ref.watch(businessesRepoProvider).saveBusinessList(newBusinesses);
      return _fetchBusinesses();
    });
  }
}
