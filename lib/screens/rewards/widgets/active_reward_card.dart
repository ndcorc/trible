import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trible/models/reward.dart';
import 'package:trible/providers/rewards.dart';
import 'package:trible/screens/rewards/qr_screen.dart';
import 'package:trible/services/analytics_service.dart';

class ActiveRewardCard extends HookConsumerWidget {
  const ActiveRewardCard({
    super.key,
    required this.userReward,
    required this.reward,
  });

  final UserReward userReward;
  final Reward reward;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFFB800), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.card_giftcard,
                color: Color(0xFFFFB800),
                size: 48,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _getBusinessName(reward.id),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(reward.title, style: const TextStyle(fontSize: 16)),
                    Text(
                      'Expires ${_formatDate(reward.expiresAt)}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              if (userReward.isApplied)
                const Row(
                  children: [
                    Icon(Icons.check, color: Colors.green, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Applied',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              else
                TextButton(
                  onPressed: () => _showQRCode(context, ref),
                  child: const Text(
                    'Apply Now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              const Spacer(),
              TextButton(
                onPressed: () => _removeFromCart(ref),
                child: const Text(
                  'Remove',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showQRCode(BuildContext context, WidgetRef ref) async {
    // Track foot traffic when QR code is shown
    await AnalyticsService.trackFootTraffic(
      businessId: _getBusinessId(reward.id),
      businessName: _getBusinessName(reward.id),
      rewardId: reward.id,
      rewardTitle: reward.title,
    );

    // Apply the reward first
    await ref.read(userRewardsProvider.notifier).applyReward(userReward);

    // Get the updated user reward with QR code
    final updatedUserRewards = await ref.refresh(userRewardsProvider.future);
    final appliedReward = updatedUserRewards.firstWhere(
      (ur) => ur.id == userReward.id,
    );

    if (context.mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder:
            (context) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: QRScreen(userReward: appliedReward, reward: reward),
            ),
      );
    }
  }

  Future<void> _removeFromCart(WidgetRef ref) async {
    await ref
        .read(userRewardsProvider.notifier)
        .removeRewardFromCart(userReward.id);
  }

  String _getBusinessName(String rewardId) {
    switch (rewardId) {
      case 'reward1':
        return "Mary's Southside Bakery";
      case 'reward2':
        return "Woodchuck Delivery";
      case 'reward3':
        return "Georgetown Barbershop";
      case 'reward4':
        return "Good Earth Market";
      default:
        return "Local Business";
    }
  }

  String _getBusinessId(String rewardId) {
    switch (rewardId) {
      case 'reward1':
        return "business1";
      case 'reward2':
        return "business2";
      case 'reward3':
        return "business3";
      case 'reward4':
        return "business4";
      default:
        return "unknown_business";
    }
  }

  String _formatDate(Timestamp timestamp) {
    final date = timestamp.toDate();
    return DateFormat('MMM d').format(date);
  }
}
