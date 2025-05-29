// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appliedRewardHash() => r'976526b877889bb361a1d2a80724f5dcc8e0a24b';

/// See also [appliedReward].
@ProviderFor(appliedReward)
final appliedRewardProvider = AutoDisposeFutureProvider<UserReward?>.internal(
  appliedReward,
  name: r'appliedRewardProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$appliedRewardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppliedRewardRef = AutoDisposeFutureProviderRef<UserReward?>;
String _$rewardsHash() => r'e3b8058503678e6cfb535d2731e95bb57696dc0c';

/// See also [Rewards].
@ProviderFor(Rewards)
final rewardsProvider =
    AutoDisposeAsyncNotifierProvider<Rewards, List<Reward>>.internal(
      Rewards.new,
      name: r'rewardsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$rewardsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Rewards = AutoDisposeAsyncNotifier<List<Reward>>;
String _$userRewardsHash() => r'a992add6361b75d12ec402e2c2bd1f7b9d080744';

/// See also [UserRewards].
@ProviderFor(UserRewards)
final userRewardsProvider =
    AutoDisposeAsyncNotifierProvider<UserRewards, List<UserReward>>.internal(
      UserRewards.new,
      name: r'userRewardsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$userRewardsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UserRewards = AutoDisposeAsyncNotifier<List<UserReward>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
