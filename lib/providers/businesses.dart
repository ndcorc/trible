import 'package:trible/models/business.dart';
import 'package:trible/providers/sort.dart';
//import 'package:trible/providers/filter.dart';
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

  /* // Let's mark a business as completed
  Future<void> toggle(String businessId) async {
    state = const AsyncValue.loading();
    final newBusinesses = [
      for (final business in state.value!)
        if (business.id == businessId)
          business.copyWith(completed: !business.completed)
        else
          business,
    ];
    state = await AsyncValue.guard(() async {
      await ref.watch(businessesRepoProvider).saveBusinessList(newBusinesses);
      return _fetchBusinesses();
    });
  } */
}
/* 
@riverpod
List<Business>? filteredBusinesses(ref) {
  final Businesses = ref.watch(businessesProvider);
  final Filter filter = ref.watch(filterProvider);

  switch (filter) {
    case Filter.none:
      return Businesses;
    case Filter.completed:
      return Businesses.where((business) => business.completed).toList();
    case Filter.uncompleted:
      return Businesses.where((business) => !business.completed).toList();
  }
}

@riverpod
List<Business>? sortedBusinesses(ref) {
  final List<Business> filteredBusinesses = ref.watch(filteredBusinessesProvider);
  final SortOrder sort = ref.watch(sortProvider);

  switch (sort) {
    case SortOrder.ASC:
      return filteredBusinesses
        ..sort((a, b) => a.description.compareTo(b.description));
    case SortOrder.DESC:
      return filteredBusinesses
        ..sort((a, b) => b.description.compareTo(a.description));
  }
}
 */
// This will generates a Notifier and NotifierProvider.
// The Notifier class that will be passed to our NotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
// Finally, we are using businessesProvider(NotifierProvider) to allow the UI to
// interact with our Businesses class.