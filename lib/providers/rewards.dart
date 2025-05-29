import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/models/reward.dart';
import 'package:trible/repositories/rewards.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rewards.g.dart';

@riverpod
class Rewards extends _$Rewards {
  Future<List<Reward>> _fetchRewards() async {
    return await ref.watch(rewardsRepoProvider).getRewardList();
  }

  @override
  Future<List<Reward>> build() async {
    return await _fetchRewards();
  }
}

@riverpod
class UserRewards extends _$UserRewards {
  static const String _mockUserId = 'user123'; // Mock user ID

  Future<List<UserReward>> _fetchUserRewards() async {
    return await ref.watch(rewardsRepoProvider).getUserRewardList(_mockUserId);
  }

  @override
  Future<List<UserReward>> build() async {
    return await _fetchUserRewards();
  }

  Future<void> applyReward(UserReward userReward) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.watch(rewardsRepoProvider).applyReward(userReward);
      return _fetchUserRewards();
    });
  }

  Future<void> removeRewardFromCart(String userRewardId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .watch(rewardsRepoProvider)
          .removeRewardFromCart(userRewardId, _mockUserId);
      return _fetchUserRewards();
    });
  }
}

@riverpod
Future<UserReward?> appliedReward(Ref ref) async {
  final userRewards = await ref.watch(userRewardsProvider.future);
  return userRewards.firstWhere(
    (reward) => reward.isApplied && reward.qrCode != null,
    orElse: () => throw Exception('No applied reward found'),
  );
}
