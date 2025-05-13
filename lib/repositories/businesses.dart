import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/business.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'businesses.g.dart';

@riverpod
BusinessesRepository businessesRepo(ref) => BusinessesRepository();

final _businessListKey = 'businessListKey';

class BusinessesRepository {
  BusinessesRepository();

  Future<List<Business>> getBusinessList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> businessesJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_businessListKey) ?? '[]'),
          );
      if (businessesJsonList.isEmpty) {
        await saveBusinessList(defaultBusinesses);
        return defaultBusinesses;
      }
      return businessesJsonList.map((json) => Business.fromJson(json)).toList();
    } catch (err) {
      prefs.clear();
      return [];
    }
  }

  Future<void> saveBusinessList(List<Business> businessList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _businessListKey,
      jsonEncode(businessList.map((business) => business.toJson()).toList()),
    );
  }
}

List<Business> defaultBusinesses = [
  Business(
    id: '1',
    name: 'Woodchuck Delivery',
    description: '\$15 off wood delivery until 1/1',
    imageUrl: 'assets/wood_delivery.jpg',
    distance: '1.5 miles',
    category: 'Services',
  ),
  Business(
    id: '2',
    name: 'Anthem Botique',
    description: '\$25 off with purchase of \$50 or more',
    imageUrl: 'assets/boutique.jpg',
    distance: '0.8 miles',
    category: 'Shopping',
  ),
  Business(
    id: '3',
    name: 'Harvest Bakery',
    description: 'Kids Under 10 Eat Free, 1/5',
    imageUrl: 'assets/burger.jpg',
    distance: '2.1 miles',
    category: 'Food',
  ),
  // Add more businesses as needed
];
