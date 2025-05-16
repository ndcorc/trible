import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/business_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'business_categories.g.dart';

@riverpod
BusinessCategoriesRepository businessCategoriesRepo(ref) =>
    BusinessCategoriesRepository();

final _businessCategoryListKey = 'businessCategoryListKey';

class BusinessCategoriesRepository {
  BusinessCategoriesRepository();

  Future<List<BusinessCategory>> getBusinessCategoryList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.clear();
    try {
      final List<Map<String, dynamic>> businessCategoriesJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_businessCategoryListKey) ?? '[]'),
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
      _businessCategoryListKey,
      jsonEncode(businessList.map((business) => business.toJson()).toList()),
    );
  }
}

List<BusinessCategory> defaultBusinessCategories = [
  BusinessCategory(
    title: 'Brewery',
    distance: '0.5 Miles',
    imageUrl: 'assets/images/brewery.png',
  ),
  BusinessCategory(
    title: 'Barber',
    distance: '1.2 Miles',
    imageUrl: 'assets/images/barber.png',
  ),
  BusinessCategory(
    title: 'Automotive',
    distance: '2.7 Miles',
    imageUrl: 'assets/images/automotive.png',
  ),
  BusinessCategory(
    title: 'Photography',
    distance: '3.1 Miles',
    imageUrl: 'assets/images/photography.png',
  ),
  BusinessCategory(
    title: 'Bakery',
    distance: '0.3 Miles',
    imageUrl: 'assets/images/bakery.png',
  ),
  BusinessCategory(
    title: 'Hardware',
    distance: '3.5 Miles',
    imageUrl: 'assets/images/hardware.png',
  ),
  BusinessCategory(
    title: 'Home',
    distance: '2.5 Miles',
    imageUrl: 'assets/images/home.png',
  ),
  BusinessCategory(
    title: 'Paint',
    distance: '6.8 Miles',
    imageUrl: 'assets/images/paint.png',
  ),
  BusinessCategory(
    title: 'Landscaping',
    distance: '4.3 Miles',
    imageUrl: 'assets/images/landscaping.png',
  ),
  // Add more businessCategories as needed
];
