import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SortOrder { ASC, DESC }

final sortProvider = StateProvider<SortOrder>((ref) => SortOrder.ASC);
