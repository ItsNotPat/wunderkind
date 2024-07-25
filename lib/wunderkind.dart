import 'package:flutter/foundation.dart';

import 'models/log_level.dart';
import 'models/screen_type.dart';
import 'models/wunderkind_category.dart';
import 'models/wunderkind_customer.dart';
import 'models/wunderkind_order.dart';
import 'wunderkind_platform_interface.dart';

class Wunderkind {
  static Future<void> initialize({
    required String webId,
    bool? isDebugMode,
  }) async {
    return WunderkindPlatform.instance.initialize(
      webId: webId,
      isDebugMode: isDebugMode ?? kDebugMode,
    );
  }

  static Future<void> setIsContextInfoTrackingEnabled(bool enabled) async {
    return await WunderkindPlatform.instance
        .setIsContextInfoTrackingEnabled(enabled);
  }

  static Future<void> trackScreenView({
    required String url,
    required ScreenType screen,
  }) async {
    return await WunderkindPlatform.instance
        .trackScreenView(url: url, screen: screen);
  }

  static Future<void> trackEmptyCart() async {
    return await WunderkindPlatform.instance.trackEmptyCart();
  }

  static Future<void> trackViewItem({
    required String itemId,
    required String groupId,
  }) async {
    return await WunderkindPlatform.instance
        .trackViewItem(itemId: itemId, groupId: groupId);
  }

  static Future<void> trackSelectSku({
    required String groupId,
    required String feedId,
  }) async {
    return await WunderkindPlatform.instance
        .trackSelectSku(groupId: groupId, feedId: feedId);
  }

  static Future<void> trackAddToCart({required String itemId}) async {
    return await WunderkindPlatform.instance.trackAddToCart(itemId: itemId);
  }

  static Future<void> trackViewCategory(
      {required WunderkindCategory category}) async {
    return await WunderkindPlatform.instance
        .trackViewCategory(category: category);
  }

  static Future<void> trackViewSearch({
    required WunderkindCategory searchCategory,
  }) async {
    return await WunderkindPlatform.instance.trackViewSearch(
      searchCategory: searchCategory,
    );
  }

  static Future<void> trackLoggedIn(WunderkindCustomer customer) async {
    return await WunderkindPlatform.instance.trackLoggedIn(customer);
  }

  static Future<void> trackLoggedOut() async {
    return await WunderkindPlatform.instance.trackLoggedOut();
  }

  static Future<void> trackTextOptIn({required String phone}) async {
    return await WunderkindPlatform.instance.trackTextOptIn(phone: phone);
  }

  static Future<void> trackPurchase(WunderkindOrder order) async {
    return await WunderkindPlatform.instance.trackPurchase(order);
  }

  static Future<void> setLogLevel(LogLevel level) async {
    return await WunderkindPlatform.instance.setLogLevel(level);
  }
}
