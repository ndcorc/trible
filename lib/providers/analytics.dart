import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trible/services/analytics_service.dart';

part 'analytics.g.dart';

@riverpod
AnalyticsService analytics(ref) => AnalyticsService();
