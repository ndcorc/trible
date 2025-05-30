// lib/providers/loyalty_programs.dart
import 'package:trible/models/loyalty_program.dart';
import 'package:trible/repositories/user_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loyalty_programs.g.dart';

@riverpod
class LoyaltyProgramsNotifier extends _$LoyaltyProgramsNotifier {
  static const String _mockUserId = 'user123'; // Mock user ID

  Future<List<LoyaltyProgram>> _fetchLoyaltyPrograms() async {
    return await ref
        .watch(userProfileRepoProvider)
        .getLoyaltyPrograms(_mockUserId);
  }

  @override
  Future<List<LoyaltyProgram>> build() async {
    return await _fetchLoyaltyPrograms();
  }
}
