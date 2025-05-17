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
