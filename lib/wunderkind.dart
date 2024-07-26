import 'package:flutter/foundation.dart';

import 'models/log_level.dart';
import 'models/screen_type.dart';
import 'models/wunderkind_category.dart';
import 'models/wunderkind_customer.dart';
import 'models/wunderkind_order.dart';
import 'wunderkind_platform_interface.dart';

class Wunderkind {
  /// Initialize SDK with your WEBSITE_ID (If you don't know your WEBSITE_ID,
  /// please contact wunderkind support team), and set a corresponding
  /// environment configuration isDebugMode (details below). The initialization
  /// is mandatory. Failure to do so will result in the SDK being unable to
  /// track events properly. In most cases, this should be done in main.dart
  static Future<void> initialize({
    required String webId,
    bool? isDebugMode,
  }) async {
    return WunderkindPlatform.instance.initialize(
      webId: webId,
      isDebugMode: isDebugMode ?? kDebugMode,
    );
  }

  /// This event should be triggered when a user navigates to a new screen, within the app.
  static Future<void> setIsContextInfoTrackingEnabled(bool enabled) async {
    return await WunderkindPlatform.instance
        .setIsContextInfoTrackingEnabled(enabled);
  }

  /// This event should be triggered when a user empties a cart.
  static Future<void> trackScreenView({
    required String url,
    required ScreenType screen,
  }) async {
    return await WunderkindPlatform.instance
        .trackScreenView(url: url, screen: screen);
  }

  /// This event should be triggered when a user empties a cart.
  static Future<void> trackEmptyCart() async {
    return await WunderkindPlatform.instance.trackEmptyCart();
  }

  /// This event should be triggered when a user views an item.
  static Future<void> trackViewItem({
    required String itemId,
    required String groupId,
  }) async {
    return await WunderkindPlatform.instance
        .trackViewItem(itemId: itemId, groupId: groupId);
  }

  /// This event is triggered when a user selects specific product attributes
  /// (e.g. color, size, etc...) and contains SKU details that were selected.
  static Future<void> trackSelectSku({
    required String groupId,
    required String feedId,
  }) async {
    return await WunderkindPlatform.instance
        .trackSelectSku(groupId: groupId, feedId: feedId);
  }

  /// This event is triggered when a user adds an item to their cart.
  static Future<void> trackAddToCart({required String itemId}) async {
    return await WunderkindPlatform.instance.trackAddToCart(itemId: itemId);
  }

  /// This event is triggered when a user views the category screen.
  static Future<void> trackViewCategory(
      {required WunderkindCategory category}) async {
    return await WunderkindPlatform.instance
        .trackViewCategory(category: category);
  }

  /// This event is triggered when a user views a search results screen.
  static Future<void> trackViewSearch({
    required WunderkindCategory searchCategory,
  }) async {
    return await WunderkindPlatform.instance.trackViewSearch(
      searchCategory: searchCategory,
    );
  }

  /// This event is triggered when a user explicitly successfully signed in to
  /// their app. This event is also triggered when a user signed up to their app.
  static Future<void> trackLoggedIn(WunderkindCustomer customer) async {
    return await WunderkindPlatform.instance.trackLoggedIn(customer);
  }

  /// This event is called when a user logs out of the application.
  static Future<void> trackLoggedOut() async {
    return await WunderkindPlatform.instance.trackLoggedOut();
  }

  /// This event is triggered when a user opts in to text messaging.
  static Future<void> trackTextOptIn({required String phone}) async {
    return await WunderkindPlatform.instance.trackTextOptIn(phone: phone);
  }

  /// This event is triggered when a user purchases an item and completes their order.
  static Future<void> trackPurchase(WunderkindOrder order) async {
    return await WunderkindPlatform.instance.trackPurchase(order);
  }

  /// This event is called when a user logs out of the application.
  static Future<void> setLogLevel(LogLevel level) async {
    return await WunderkindPlatform.instance.setLogLevel(level);
  }
}
