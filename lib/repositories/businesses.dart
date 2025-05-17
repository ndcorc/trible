import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/business.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'businesses.g.dart';

@riverpod
BusinessesRepository businessesRepo(ref) => BusinessesRepository();

final _businessListKey = 'businessListKey';

class BusinessesRepository {
  BusinessesRepository();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final String _collection = 'businesses';
  final String _coverImages = 'businesses/coverImages';
  final String _logoImages = 'businesses/logos';

  final Map<String, String> _urlCache = {};

  Future<List<Business>> getBusinessList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    try {
      final List<Map<String, dynamic>> businessesJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_businessListKey) ?? '[]'),
          );
      if (businessesJsonList.isEmpty) {
        final snapshot = await _firestore.collection(_collection).get();
        final businesses = await _processBusinessDocs(snapshot.docs);

        await saveBusinessList(businesses);
        return businesses;
      }
      return businessesJsonList.map((json) => Business.fromJson(json)).toList();
    } catch (err) {
      print("err ${err}");
      prefs.clear();
      return [];
    }
  }

  Future<void> saveBusinessList(List<Business> businessList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await prefs.setString(
      _businessListKey,
      jsonEncode(businessList.map((business) => business.toJson()).toList()),
    );
  }

  Future<Business> addBusiness(Business business) async {
    final docRef = await _firestore
        .collection(_collection)
        .add(business.toJson());
    return business.copyWith(id: docRef.id);
  }

  // Update a business
  Future<void> updateBusiness(Business business) async {
    await _firestore
        .collection(_collection)
        .doc(business.id)
        .update(business.toJson());
  }

  // Delete a business
  Future<void> deleteBusiness(String id) async {
    await _firestore.collection(_collection).doc(id).delete();
  }

  // New method: getBusinessById
  Future<Business> getBusinessById(String id) async {
    final businessList = await getBusinessList();
    Business? business = businessList.firstWhereOrNull(
      (business) => business.id == id,
    );
    if (business != null) return business;
    try {
      final doc = await _firestore.collection(_collection).doc(id).get();
      if (!doc.exists) {
        throw Exception('Business not found for id $id');
      }
      final business = Business.fromJson({...doc.data()!, 'id': doc.id});
      final logoUrl =
          business.logoUrl.startsWith('gs://')
              ? await _getDownloadURL(business.logoUrl)
              : business.logoUrl;
      final coverImageUrl =
          business.coverImageUrl.startsWith('gs://')
              ? await _getDownloadURL(business.coverImageUrl)
              : business.coverImageUrl;
      return business.copyWith(logoUrl: logoUrl, coverImageUrl: coverImageUrl);
    } catch (err) {
      print('Error fetching business: $err');
      throw Exception('Failed to load business: $err');
    }
  }

  // Helper to process business documents with download URLs
  Future<List<Business>> _processBusinessDocs(
    List<QueryDocumentSnapshot> docs,
  ) async {
    final businesses = <Business>[];

    for (final doc in docs) {
      try {
        final data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        final business = Business.fromJson(data);
        final logoUrl = await _getDownloadURL(
          '$_logoImages/${business.logoUrl}',
        );
        final coverImageUrl = await _getDownloadURL(
          '$_coverImages/${business.coverImageUrl}',
        );
        businesses.add(
          business.copyWith(logoUrl: logoUrl, coverImageUrl: coverImageUrl),
        );
      } catch (e) {
        print('Error processing doc ${doc.id}: $e');
        businesses.add(Business.fromJson(doc.data() as Map<String, dynamic>));
      }
    }

    return businesses;
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

/* List<Business> defaultBusinesses = [
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
 */
