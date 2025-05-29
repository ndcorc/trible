import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/models/reward.dart';
import 'package:trible/screens/rewards/widgets/active_reward_card.dart';
import 'package:trible/screens/rewards/widgets/available_reward_card.dart';

class CartContent extends HookConsumerWidget {
  const CartContent({
    super.key,
    required this.userRewards,
    required this.rewards,
  });

  final List<UserReward> userRewards;
  final List<Reward> rewards;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartRewards = userRewards.where((ur) => ur.isInCart).toList();
    final availableRewards =
        rewards
            .where(
              (r) =>
                  !userRewards.any((ur) => ur.rewardId == r.id && ur.isInCart),
            )
            .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Active Rewards in Cart
          if (cartRewards.isNotEmpty) ...[
            const Text(
              'Active Rewards in Cart',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...cartRewards.map((userReward) {
              final reward = rewards.firstWhere(
                (r) => r.id == userReward.rewardId,
                orElse:
                    () => Reward(
                      id: '',
                      title: 'Unknown Reward',
                      description: '',
                      expiresAt: Timestamp.now(),
                      isActive: false,
                      requiredMembershipLevel: '',
                      createdAt: Timestamp.now(),
                    ),
              );
              return ActiveRewardCard(
                key: ValueKey(userReward.id),
                userReward: userReward,
                reward: reward,
              );
            }),
            const SizedBox(height: 8),
          ],

          // Available Rewards
          const Text(
            'Available',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tap to add these to your cart',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ...availableRewards.map(
            (reward) =>
                AvailableRewardCard(key: ValueKey(reward.id), reward: reward),
          ),
        ],
      ),
    );
  }
}
