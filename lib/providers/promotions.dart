import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/models/business.dart';
import 'package:trible/models/promotion.dart';
import 'package:trible/providers/businesses.dart';
import 'package:trible/providers/sort.dart';
import 'package:trible/repositories/businesses.dart';
import 'package:trible/repositories/promotions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'promotions.g.dart';

@riverpod
class Promotions extends _$Promotions {
  Future<List<Promotion>> _fetchPromotions() async {
    final promotions =
        await ref.read(promotionsRepoProvider).getPromotionList();

    // Populate the business for each promotion
    final populatedPromotions = await Future.wait(
      promotions.map((promotion) async {
        if (promotion.businessRef == null) return promotion;

        try {
          final business = await ref
              .read(businessesRepoProvider)
              .getBusinessById(promotion.businessRef!.id);
          return promotion.copyWith(business: business);
        } catch (e) {
          print('Error fetching business for promotion ${promotion.id}: $e');
          return promotion;
        }
      }),
    );

    return populatedPromotions;
  }

  @override
  Future<List<Promotion>> build() async {
    final promotions = await _fetchPromotions();
    final sort = ref.watch(sortProvider);
    return switch (sort) {
      SortOrder.ASC =>
        promotions
          ..sort((a, b) => a.expirationDate.compareTo(b.expirationDate)),
      SortOrder.DESC =>
        promotions
          ..sort((a, b) => b.expirationDate.compareTo(a.expirationDate)),
    };
  }

  // Let's allow the UI to add Promotions.
  Future<void> addPromotion(Promotion promotion) async {
    state = const AsyncValue.loading();
    final newPromotions = [...?state.value, promotion];
    state = await AsyncValue.guard(() async {
      await ref.watch(promotionsRepoProvider).savePromotionList(newPromotions);
      return _fetchPromotions();
    });
  }

  // Let's allow removing Promotions
  Future<void> removePromotion(String promotionId) async {
    state = const AsyncValue.loading();
    final newPromotions = [
      for (final promotion in state.value!)
        if (promotion.id != promotionId) promotion,
    ];
    state = await AsyncValue.guard(() async {
      await ref.watch(promotionsRepoProvider).savePromotionList(newPromotions);
      return _fetchPromotions();
    });
  }
}

// New provider to get a single promotion along with its business.
@riverpod
Future<Promotion> promotion(Ref ref, String promotionId) async {
  // Get the list of promotions that we've already built.
  final promotionsList = await ref.watch(promotionsProvider.future);
  final promotion = promotionsList.firstWhere(
    (promo) => promo.id == promotionId,
    orElse: () => throw Exception('Promotion not found'),
  );

  // Attempt to retrieve business from the businessesProvider state.
  Business? business;
  final businessesAsync = ref.read(businessesProvider);
  if (businessesAsync is AsyncData<List<Business>>) {
    try {
      business = businessesAsync.value.firstWhere(
        (biz) => biz.id == promotion.businessRef?.id,
      );
    } catch (_) {
      business = null;
    }
  }

  // If the business isn't found in the state, fallback to the repo.
  if (business == null && promotion.businessRef?.id != null) {
    try {
      business = await ref
          .watch(businessesRepoProvider)
          .getBusinessById(promotion.businessRef!.id);
    } catch (e) {
      print('Error fetching business: $e');
      business = null;
    }
  }

  // Return a new promotion instance with the business injected.
  return promotion.copyWith(business: business);
}
