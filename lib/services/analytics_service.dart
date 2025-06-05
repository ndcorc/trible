import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Page View Tracking
  static Future<void> trackPageView({
    required String pageName,
    Map<String, String>? parameters,
  }) async {
    await _analytics.logScreenView(
      screenName: pageName,
      parameters: parameters,
    );
  }

  // Business Page View
  static Future<void> trackBusinessPageView({
    required String businessId,
    required String businessName,
  }) async {
    await _analytics.logEvent(
      name: 'business_page_view',
      parameters: {
        'business_id': businessId,
        'business_name': businessName,
        'page_type': 'business_details',
      },
    );
  }

  // Foot Traffic (QR Code Shows)
  static Future<void> trackFootTraffic({
    required String businessId,
    required String businessName,
    required String rewardId,
    required String rewardTitle,
  }) async {
    await _analytics.logEvent(
      name: 'foot_traffic',
      parameters: {
        'business_id': businessId,
        'business_name': businessName,
        'reward_id': rewardId,
        'reward_title': rewardTitle,
        'action': 'qr_code_shown',
      },
    );
  }

  // Bulletin Interactions
  static Future<void> trackBulletinInteraction({
    required String interactionType,
    String? eventId,
    String? eventTitle,
    String? businessId,
    String? businessName,
    String? announcementId,
    String? announcementTitle,
  }) async {
    final parameters = <String, String>{'interaction_type': interactionType};

    // Add optional parameters if they exist
    if (eventId != null) parameters['event_id'] = eventId;
    if (eventTitle != null) parameters['event_title'] = eventTitle;
    if (businessId != null) parameters['business_id'] = businessId;
    if (businessName != null) parameters['business_name'] = businessName;
    if (announcementId != null) parameters['announcement_id'] = announcementId;
    if (announcementTitle != null)
      parameters['announcement_title'] = announcementTitle;

    await _analytics.logEvent(
      name: 'bulletin_interaction',
      parameters: parameters,
    );
  }

  // Specific bulletin interaction methods
  static Future<void> trackSaveEvent({
    required String eventId,
    required String eventTitle,
  }) async {
    await trackBulletinInteraction(
      interactionType: 'save_eventt',
      eventId: eventId,
      eventTitle: eventTitle,
    );
  }

  static Future<void> trackGetDirections({
    required String eventId,
    required String eventTitle,
    required String location,
  }) async {
    await trackBulletinInteraction(
      interactionType: 'get_directions',
      eventId: eventId,
      eventTitle: eventTitle,
    );
  }

  static Future<void> trackAnnouncementTap({
    required String announcementId,
    required String announcementTitle,
  }) async {
    await trackBulletinInteraction(
      interactionType: 'announcement_tap',
      announcementId: announcementId,
      announcementTitle: announcementTitle,
    );
  }

  static Future<void> trackVisitBusiness({
    required String businessId,
    required String businessName,
  }) async {
    await trackBulletinInteraction(
      interactionType: 'visit_business',
      businessId: businessId,
      businessName: businessName,
    );
  }

  static Future<void> trackAddToCityPicks({
    required String businessId,
    required String businessName,
  }) async {
    await trackBulletinInteraction(
      interactionType: 'add_to_city_picks',
      businessId: businessId,
      businessName: businessName,
    );
  }
}
