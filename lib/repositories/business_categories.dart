import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final String _collection = 'businessCategories';
  final String _imagesPath = 'categories';

  // URL cache to avoid repeated storage calls
  final Map<String, String> _urlCache = {};

  Future<List<BusinessCategory>> getBusinessCategoryList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    try {
      final List<Map<String, dynamic>> businessCategoriesJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_businessCategoryListKey) ?? '[]'),
          );
      if (businessCategoriesJsonList.isEmpty) {
        final snapshot = await _firestore.collection(_collection).get();
        final businessCategories = await _processBusinessCategoryDocs(
          snapshot.docs,
        );

        await saveBusinessCategoryList(businessCategories);
        return businessCategories;
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

  // Helper to process business documents with download URLs
  Future<List<BusinessCategory>> _processBusinessCategoryDocs(
    List<QueryDocumentSnapshot> docs,
  ) async {
    final businessCategories = <BusinessCategory>[];

    for (final doc in docs) {
      try {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        final businessCategory = BusinessCategory.fromJson(data);
        final imageUrl = await _getDownloadURL(
          '$_imagesPath/${businessCategory.imageUrl}',
        );
        businessCategories.add(businessCategory.copyWith(imageUrl: imageUrl));
      } catch (e) {
        print('Error processing doc ${doc.id}: $e');
        businessCategories.add(
          BusinessCategory.fromJson(doc.data() as Map<String, dynamic>),
        );
      }
    }

    return businessCategories;
  }

  // Get a download URL from a storage path
  Future<String> _getDownloadURL(String storagePath) async {
    if (_urlCache.containsKey(storagePath)) {
      return _urlCache[storagePath]!;
    }

    try {
      final ref = _storage.ref(storagePath);
      final url = await ref.getDownloadURL();
      _urlCache[storagePath] = url;
      return url;
    } catch (e) {
      print('Error getting download URL: $e');
      return ''; // Return empty string if failed
    }
  }
}

/* List<BusinessCategory> defaultBusinessCategories = [
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
]; */
