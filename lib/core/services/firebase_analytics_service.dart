import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static FirebaseAnalytics get instance => FirebaseAnalytics.instance;
  static Future<void> init() async {
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

    FirebaseAnalytics.instance.logEvent(
      name: 'init_firebase_analytics',
      parameters: <String, dynamic>{
        'start_time': DateTime.now().toLocal().toString(),
      },
    );
  }

  static FirebaseAnalyticsObserver get observer {
    return FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);
  }
}
