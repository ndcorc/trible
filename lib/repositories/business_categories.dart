import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/business_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_categories.g.dart';

@riverpod
BusinessCategoriesRepository businessCategoriesRepo(ref) =>
    BusinessCategoriesRepository();

final _businessListKey = 'businessListKey';

class BusinessCategoriesRepository {
  BusinessCategoriesRepository();

  Future<List<BusinessCategory>> getBusinessCategoryList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> businessCategoriesJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_businessListKey) ?? '[]'),
          );
      if (businessCategoriesJsonList.isEmpty) {
        await saveBusinessCategoryList(defaultBusinessCategories);
        return defaultBusinessCategories;
      }
      return businessCategoriesJsonList
          .map((json) => BusinessCategory.fromJson(json))
          .toList();
    } catch (err) {
      prefs.clear();
      return [];
    }
  }

  Future<void> saveBusinessCategoryList(
    List<BusinessCategory> businessList,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _businessListKey,
      jsonEncode(businessList.map((business) => business.toJson()).toList()),
    );
  }
}

List<BusinessCategory> defaultBusinessCategories = [
  BusinessCategory(
    title: 'Brewery',
    distance: '0.5 Miles',
    imageUrl: 'assets/brewery.jpg',
  ),
  BusinessCategory(
    title: 'Barber',
    distance: '1.2 Miles',
    imageUrl: 'assets/barber.jpg',
  ),
  BusinessCategory(
    title: 'Automotive',
    distance: '2.7 Miles',
    imageUrl: 'assets/automotive.jpg',
  ),
  BusinessCategory(
    title: 'Photography',
    distance: '3.1 Miles',
    imageUrl: 'assets/photography.jpg',
  ),
  BusinessCategory(
    title: 'Bakery',
    distance: '0.3 Miles',
    imageUrl: 'assets/bakery.jpg',
  ),
  BusinessCategory(
    title: 'Hardware',
    distance: '3.5 Miles',
    imageUrl: 'assets/hardware.jpg',
  ),
  BusinessCategory(
    title: 'Home',
    distance: '2.5 Miles',
    imageUrl: 'assets/home.jpg',
  ),
  BusinessCategory(
    title: 'Paint',
    distance: '6.8 Miles',
    imageUrl: 'assets/paint.jpg',
  ),
  BusinessCategory(
    title: 'Landscaping',
    distance: '4.3 Miles',
    imageUrl: 'assets/landscaping.jpg',
  ),
  // Add more businessCategories as needed
];
