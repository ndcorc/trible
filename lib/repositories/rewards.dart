import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trible/models/reward.dart';
import 'package:trible/repositories/businesses.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rewards.g.dart';

@riverpod
RewardsRepository rewardsRepo(ref) => RewardsRepository();

final _rewardListKey = 'rewardListKey';
final _userRewardListKey = 'userRewardListKey';

class RewardsRepository {
  RewardsRepository();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'rewards';
  final String _userRewardsCollection = 'userRewards';

  Future<List<Reward>> getRewardList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> rewardsJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_rewardListKey) ?? '[]'),
          );
      if (rewardsJsonList.isEmpty) {
        // Return mock data for now
        final rewards = _getMockRewards();
        await saveRewardList(rewards);
        return rewards;
      }
      return rewardsJsonList.map((json) => Reward.fromJson(json)).toList();
    } catch (err) {
      print('Error processing reward docs: $err');
      return _getMockRewards();
    }
  }

  Future<List<UserReward>> getUserRewardList(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final List<Map<String, dynamic>> userRewardsJsonList =
          List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_userRewardListKey) ?? '[]'),
          );
      if (userRewardsJsonList.isEmpty) {
        // Return mock data for now
        final userRewards = _getMockUserRewards(userId);
        await saveUserRewardList(userRewards);
        return userRewards;
      }
      return userRewardsJsonList
          .map((json) => UserReward.fromJson(json))
          .toList();
    } catch (err) {
      print('Error processing user reward docs: $err');
      return _getMockUserRewards(userId);
    }
  }

  Future<void> saveRewardList(List<Reward> rewardList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _rewardListKey,
      jsonEncode(rewardList.map((reward) => reward.toJson()).toList()),
    );
  }

  Future<void> saveUserRewardList(List<UserReward> userRewardList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _userRewardListKey,
      jsonEncode(userRewardList.map((reward) => reward.toJson()).toList()),
    );
  }

  Future<UserReward> applyReward(UserReward userReward) async {
    final appliedReward = userReward.copyWith(
      isApplied: true,
      appliedAt: Timestamp.now(),
      qrCode: _generateQRCode(),
    );

    // Update the list
    final userRewards = await getUserRewardList(userReward.userId);
    final updatedRewards =
        userRewards
            .map((r) => r.id == userReward.id ? appliedReward : r)
            .toList();
    await saveUserRewardList(updatedRewards);

    return appliedReward;
  }

  Future<void> removeRewardFromCart(String userRewardId, String userId) async {
    final userRewards = await getUserRewardList(userId);
    final updatedRewards =
        userRewards.where((r) => r.id != userRewardId).toList();
    await saveUserRewardList(updatedRewards);
  }

  String _generateQRCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        6,
        (_) => chars.codeUnitAt(random.nextInt(chars.length)),
      ),
    );
  }

  List<Reward> _getMockRewards() {
    final now = Timestamp.now();
    final tomorrow = Timestamp.fromDate(DateTime.now().add(Duration(days: 1)));
    final nextWeek = Timestamp.fromDate(DateTime.now().add(Duration(days: 7)));

    return [
      Reward(
        id: 'reward1',
        title: 'Free Drip Coffee',
        description: '\$1 drip coffee with in-app offer',
        expiresAt: Timestamp.fromDate(DateTime(2025, 5, 2)),
        isActive: true,
        requiredMembershipLevel: 'Pillar',
        createdAt: now,
      ),
      Reward(
        id: 'reward2',
        title: '\$15 Off Wood Delivery',
        description: 'Save on your next wood delivery order',
        expiresAt: Timestamp.fromDate(DateTime(2025, 5, 1)),
        isActive: true,
        requiredMembershipLevel: 'Pillar',
        createdAt: now,
      ),
      Reward(
        id: 'reward3',
        title: '\$5 Beard Trim',
        description: 'Discount on beard trimming service',
        expiresAt: nextWeek,
        isActive: true,
        requiredMembershipLevel: 'Pillar',
        createdAt: now,
      ),
      Reward(
        id: 'reward4',
        title: '\$10 off next purchase',
        description: 'General discount on next purchase',
        expiresAt: nextWeek,
        isActive: true,
        requiredMembershipLevel: 'Pillar',
        createdAt: now,
      ),
    ];
  }

  List<UserReward> _getMockUserRewards(String userId) {
    final now = Timestamp.now();

    return [
      UserReward(
        id: 'userReward1',
        rewardId: 'reward1',
        userId: userId,
        isInCart: true,
        isApplied: false,
        createdAt: now,
      ),
      UserReward(
        id: 'userReward2',
        rewardId: 'reward2',
        userId: userId,
        isInCart: true,
        isApplied: false,
        createdAt: now,
      ),
    ];
  }
}
