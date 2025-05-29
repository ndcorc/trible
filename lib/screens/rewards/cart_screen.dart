import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trible/providers/rewards.dart';
import 'package:trible/screens/rewards/widgets/cart_header.dart';
import 'package:trible/screens/rewards/widgets/cart_content.dart';
import 'package:trible/widgets/app_back_button.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRewards = ref.watch(rewardsProvider);
    final asyncUserRewards = ref.watch(userRewardsProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const CartHeader(),

            // Content
            Expanded(
              child: asyncUserRewards.when(
                data:
                    (userRewards) => asyncRewards.when(
                      data:
                          (rewards) => CartContent(
                            userRewards: userRewards,
                            rewards: rewards,
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, stack) =>
                              Center(child: Text('Error: $error')),
                    ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
