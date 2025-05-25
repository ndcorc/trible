import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Filter { none, completed, uncompleted }

final filterProvider = StateProvider<Filter>((ref) => Filter.none);
