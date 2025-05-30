// lib/providers/user_contributions.dart
import 'package:trible/models/user_contribution.dart';
import 'package:trible/repositories/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_contributions.g.dart';

@riverpod
class UserContributionsNotifier extends _$UserContributionsNotifier {
  static const String _mockUserId = 'user123'; // Mock user ID

  Future<List<UserContribution>> _fetchUserContributions() async {
    return await ref
        .watch(userProfileRepoProvider)
        .getUserContributions(_mockUserId);
  }

  @override
  Future<List<UserContribution>> build() async {
    return await _fetchUserContributions();
  }
}
