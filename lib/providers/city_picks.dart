// lib/providers/city_picks.dart
import 'package:trible/models/city_picks.dart';
import 'package:trible/repositories/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'city_picks.g.dart';

@riverpod
class CityPicksNotifier extends _$CityPicksNotifier {
  static const String _mockUserId = 'user123'; // Mock user ID

  Future<List<CityPicks>> _fetchCityPicks() async {
    return await ref
        .watch(userProfileRepoProvider)
        .getCityPicksList(_mockUserId);
  }

  @override
  Future<List<CityPicks>> build() async {
    return await _fetchCityPicks();
  }
}
