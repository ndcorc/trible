import 'dart:convert';
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

  // New method: getBusinessById
  Future<Business> getBusinessById(String id) async {
    final businessList = await getBusinessList();
    return businessList.firstWhere(
      (business) => business.id == id,
      orElse: () => throw Exception('Business not found for id $id'),
    );
  }
}

List<Business> defaultBusinesses = [
  Business(
    id: '1',
    name: 'Woodchuck Delivery',
    tagline: 'The wood is good.',
    imageUrl: 'assets/images/wood_delivery.png',
    distance: '1.5 miles',
    category: 'Services',
  ),
  Business(
    id: '2',
    name: 'Anthem Botique',
    tagline: 'Style With A Purpose',
    imageUrl: 'assets/images/anthem_boutique.png',
    distance: '0.8 miles',
    category: 'Shopping',
  ),
  Business(
    id: '3',
    name: 'Blue Corn Harvest',
    tagline: 'Authentic Southwestern cuisine',
    imageUrl: 'assets/images/blue_corn_harvest.png',
    distance: '2.1 miles',
    category: 'Food',
  ),
  Business(
    id: '4',
    name: 'Georgetown Barbershop',
    tagline: 'Just simple old-fashioned haircuts and shaves!',
    imageUrl: 'assets/images/georgetown_barbershop.png',
    distance: '2.1 miles',
    category: 'Barber',
  ),
  // Add more businesses as needed
];
