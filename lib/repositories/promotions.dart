import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/promotion.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'promotions.g.dart';

@riverpod
PromotionsRepository promotionsRepo(ref) => PromotionsRepository();

final _promotionListKey = 'promotionListKey';

class PromotionsRepository {
  PromotionsRepository();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'promotions';

  Future<List<Promotion>> getPromotionList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    try {
      final List<Map<String, dynamic>> promotionsJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_promotionListKey) ?? '[]'),
          );
      if (promotionsJsonList.isEmpty) {
        final snapshot = await _firestore.collection(_collection).get();
        final promotions =
            snapshot.docs.map((doc) {
              final data = doc.data();
              data['id'] = doc.id;
              return Promotion.fromJson(data);
            }).toList();
        await savePromotionList(promotions);
        return promotions;
      }
      return promotionsJsonList
          .map((json) => Promotion.fromJson(json))
          .toList();
    } catch (err) {
      print('Error processing promotion docs: $err');
      prefs.clear();
      return [];
    }
  }

  Future<void> savePromotionList(List<Promotion> promotionList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _promotionListKey,
      jsonEncode(promotionList.map((promotion) => promotion.toJson()).toList()),
    );
  }
}

/* List<Promotion> defaultPromotions = [
  Promotion(
    id: '1',
    businessId: 'wCAFsYl7IIQiUWk0NNJu',
    title: '15 off wood delivery until 1/1',
    description:
        'Now until May 1st, you can use this offer via the Woodchuck Delivery site.\nRedeem to receive the code!',
    category: 'Services',
  ),
  Promotion(
    id: '2',
    businessId: 'wCAFsYl7IIQiUWk0NNJu',
    title: '\$25 off with purchase of \$50 or more',
    category: 'Shopping',
  ),
  Promotion(
    id: '3',
    businessId: 'wCAFsYl7IIQiUWk0NNJu',
    title: 'Kids Under 10 Eat Free, 1/5',
    category: 'Food',
  ),
  Promotion(
    id: '4',
    businessId: 'wCAFsYl7IIQiUWk0NNJu',
    title: '\$10 off haircut and shave',
    category: 'Barber',
  ),
  // Add more promotions as needed
]; */
