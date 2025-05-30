// lib/repositories/user_profile.dart
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/city_picks.dart';
import 'package:trible/models/loyalty_program.dart';
import 'package:trible/models/saved_event.dart';
import 'package:trible/models/user_contribution.dart';
import 'package:trible/models/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile.g.dart';

@riverpod
UserProfileRepository userProfileRepo(ref) => UserProfileRepository();

final _userProfileKey = 'userProfileKey';
final _cityPicksKey = 'cityPicksKey';
final _loyaltyProgramsKey = 'loyaltyProgramsKey';
final _savedEventsKey = 'savedEventsKey';
final _userContributionsKey = 'userContributionsKey';

class UserProfileRepository {
  UserProfileRepository();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userCollection = 'users';
  final String _cityPicksCollection = 'cityPicks';
  final String _loyaltyProgramsCollection = 'loyaltyPrograms';

  Future<UserProfile> getUserProfile(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String? userProfileJson = prefs.getString(_userProfileKey);
      if (userProfileJson == null) {
        // Return mock data for now
        final userProfile = _getMockUserProfile();
        await saveUserProfile(userProfile);
        return userProfile;
      }
      final Map<String, dynamic> userProfileMap = jsonDecode(userProfileJson);
      return UserProfile.fromJson(userProfileMap);
    } catch (err) {
      print('Error getting user profile: $err');
      return _getMockUserProfile();
    }
  }

  Future<List<CityPicks>> getCityPicksList(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> cityPicksJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_cityPicksKey) ?? '[]'),
          );
      if (cityPicksJsonList.isEmpty) {
        final cityPicks = _getMockCityPicks();
        await saveCityPicksList(cityPicks);
        return cityPicks;
      }
      return cityPicksJsonList.map((json) => CityPicks.fromJson(json)).toList();
    } catch (err) {
      print('Error getting city picks: $err');
      return _getMockCityPicks();
    }
  }

  Future<List<LoyaltyProgram>> getLoyaltyPrograms(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> loyaltyProgramsJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_loyaltyProgramsKey) ?? '[]'),
          );
      if (loyaltyProgramsJsonList.isEmpty) {
        final loyaltyPrograms = _getMockLoyaltyPrograms();
        await saveLoyaltyPrograms(loyaltyPrograms);
        return loyaltyPrograms;
      }
      return loyaltyProgramsJsonList
          .map((json) => LoyaltyProgram.fromJson(json))
          .toList();
    } catch (err) {
      print('Error getting loyalty programs: $err');
      return _getMockLoyaltyPrograms();
    }
  }

  Future<List<SavedEvent>> getSavedEvents(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> savedEventsJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_savedEventsKey) ?? '[]'),
          );
      if (savedEventsJsonList.isEmpty) {
        final savedEvents = _getMockSavedEvents();
        await saveSavedEvents(savedEvents);
        return savedEvents;
      }
      return savedEventsJsonList
          .map((json) => SavedEvent.fromJson(json))
          .toList();
    } catch (err) {
      print('Error getting saved events: $err');
      return _getMockSavedEvents();
    }
  }

  Future<List<UserContribution>> getUserContributions(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> contributionsJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_userContributionsKey) ?? '[]'),
          );
      if (contributionsJsonList.isEmpty) {
        final contributions = _getMockUserContributions();
        await saveUserContributions(contributions);
        return contributions;
      }
      return contributionsJsonList
          .map((json) => UserContribution.fromJson(json))
          .toList();
    } catch (err) {
      print('Error getting user contributions: $err');
      return _getMockUserContributions();
    }
  }

  Future<void> saveUserProfile(UserProfile userProfile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userProfileKey, jsonEncode(userProfile.toJson()));
  }

  Future<void> saveCityPicksList(List<CityPicks> cityPicksList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _cityPicksKey,
      jsonEncode(cityPicksList.map((cp) => cp.toJson()).toList()),
    );
  }

  Future<void> saveLoyaltyPrograms(List<LoyaltyProgram> loyaltyPrograms) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _loyaltyProgramsKey,
      jsonEncode(loyaltyPrograms.map((lp) => lp.toJson()).toList()),
    );
  }

  Future<void> saveSavedEvents(List<SavedEvent> savedEvents) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _savedEventsKey,
      jsonEncode(savedEvents.map((se) => se.toJson()).toList()),
    );
  }

  Future<void> saveUserContributions(
    List<UserContribution> contributions,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _userContributionsKey,
      jsonEncode(contributions.map((uc) => uc.toJson()).toList()),
    );
  }

  UserProfile _getMockUserProfile() {
    final now = Timestamp.now();
    return UserProfile(
      id: 'user123',
      firstName: 'John',
      lastName: 'M.',
      email: 'john.m@example.com',
      membershipLevel: 'Pillar',
      qrCode: 'USER123QR',
      createdAt: now,
    );
  }

  List<CityPicks> _getMockCityPicks() {
    final now = Timestamp.now();
    return [
      CityPicks(
        id: 'georgetown_picks',
        userId: 'user123',
        cityName: 'Georgetown',
        cityImageUrl: 'assets/images/georgetown.png',
        businessIds: ['business1', 'business2', 'business3', 'business4'],
        createdAt: now,
      ),
      CityPicks(
        id: 'austin_picks',
        userId: 'user123',
        cityName: 'Austin',
        cityImageUrl: 'assets/images/austin.png',
        businessIds: ['business5', 'business6'],
        createdAt: now,
      ),
    ];
  }

  List<LoyaltyProgram> _getMockLoyaltyPrograms() {
    final now = Timestamp.now();
    return [
      LoyaltyProgram(
        id: 'loyalty2',
        businessId: 'business2',
        businessName: 'Mary\'s Southside Bakery',
        businessLogoUrl: 'assets/images/candle_logo.png',
        programType: 'punch_card',
        description: '2 punches left',
        currentPunches: 4,
        totalPunchesNeeded: 6,
        createdAt: now,
      ),
      LoyaltyProgram(
        id: 'loyalty2',
        businessId: 'business2',
        businessName: 'Rust & Reverie',
        businessLogoUrl: 'assets/images/candle_logo.png',
        programType: 'percentage_off',
        description: '10% off candle coupon',
        discountPercentage: 10.0,
        createdAt: now,
      ),
    ];
  }

  List<SavedEvent> _getMockSavedEvents() {
    final now = Timestamp.now();
    return [
      SavedEvent(
        id: 'saved1',
        eventId: 'event1',
        userId: 'user123',
        eventTitle: 'Trivia Night at BrewHaus',
        eventLocation: 'BrewHaus',
        status: 'saved',
        createdAt: now,
      ),
      SavedEvent(
        id: 'saved2',
        eventId: 'event2',
        userId: 'user123',
        eventTitle: 'First Friday Art Walk',
        eventLocation: 'Georgetown Square',
        status: 'added_to_calendar',
        createdAt: now,
      ),
    ];
  }

  List<UserContribution> _getMockUserContributions() {
    final now = Timestamp.now();
    return [
      UserContribution(
        id: 'contribution1',
        userId: 'user123',
        type: 'event_submission',
        title: 'Coffee & Cars this Saturday',
        description: 'RSVP\'d to: First Friday Art Walk',
        createdAt: now,
      ),
    ];
  }
}
