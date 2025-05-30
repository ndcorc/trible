// lib/providers/user_profile.dart
import 'package:trible/models/user_profile.dart';
import 'package:trible/repositories/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile.g.dart';

@riverpod
class UserProfileNotifier extends _$UserProfileNotifier {
  static const String _mockUserId = 'user123'; // Mock user ID

  Future<UserProfile> _fetchUserProfile() async {
    return await ref.watch(userProfileRepoProvider).getUserProfile(_mockUserId);
  }

  @override
  Future<UserProfile> build() async {
    return await _fetchUserProfile();
  }

  Future<void> updateUserProfile(UserProfile userProfile) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(userProfileRepoProvider).saveUserProfile(userProfile);
      return _fetchUserProfile();
    });
  }
}
