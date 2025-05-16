import 'package:trible/models/business_category.dart';
import 'package:trible/providers/sort.dart';
//import 'package:trible/providers/filter.dart';
import 'package:trible/repositories/business_categories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_categories.g.dart';

@riverpod
class BusinessCategories extends _$BusinessCategories {
  Future<List<BusinessCategory>> _fetchBusinessCategories() async {
    return await ref
        .watch(businessCategoriesRepoProvider)
        .getBusinessCategoryList();
  }

  @override
  Future<List<BusinessCategory>> build() async {
    final businessCategories = await _fetchBusinessCategories();
    //final filter = ref.watch(filterProvider);
    final sort = ref.watch(sortProvider);

    /* final filtered = switch (filter) {
      Filter.none => businessCategories,
      Filter.completed =>
        businessCategories.where((business) => business.completed).toList(),
      Filter.uncompleted =>
        businessCategories.where((business) => !business.completed).toList(),
    }; */

    return switch (sort) {
      SortOrder.ASC =>
        businessCategories..sort((a, b) => a.title.compareTo(b.title)),
      SortOrder.DESC =>
        businessCategories..sort((a, b) => b.title.compareTo(a.title)),
    };
  }

  // Let's allow the UI to add BusinessCategories.
  Future<void> addBusinessCategory(BusinessCategory business) async {
    state = const AsyncValue.loading();
    final newBusinessCategories = [...?state.value, business];
    state = await AsyncValue.guard(() async {
      await ref
          .watch(businessCategoriesRepoProvider)
          .saveBusinessCategoryList(newBusinessCategories);
      return _fetchBusinessCategories();
    });
  }

  // Let's allow removing BusinessCategories
  Future<void> removeBusinessCategory(String categoryTitle) async {
    state = const AsyncValue.loading();
    final newBusinessCategories = [
      for (final businessCategory in state.value!)
        if (businessCategory.title != categoryTitle) businessCategory,
    ];
    state = await AsyncValue.guard(() async {
      await ref
          .watch(businessCategoriesRepoProvider)
          .saveBusinessCategoryList(newBusinessCategories);
      return _fetchBusinessCategories();
    });
  }
}

// This will generates a Notifier and NotifierProvider.
// The Notifier class that will be passed to our NotifierProvider.
// This class should not expose state outside of its "state" property, which means
// no public getters/properties!
// The public methods on this class will be what allow the UI to modify the state.
// Finally, we are using businessCategoriesProvider(NotifierProvider) to allow the UI to
// interact with our BusinessCategories class.
