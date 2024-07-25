import 'package:flutter/foundation.dart';

import 'models/log_level.dart';
import 'models/screen_type.dart';
import 'models/wunderkind_category.dart';
import 'models/wunderkind_customer.dart';
import 'models/wunderkind_order.dart';
import 'wunderkind_platform_interface.dart';

class Wunderkind {
  Future<String?> getPlatformVersion() {
    return WunderkindPlatform.instance.getPlatformVersion();
  }

  static Future<void> initialize({
    required String webId,
    bool? isDebugMode,
  }) async {
    return WunderkindPlatform.instance.initialize(
      webId: webId,
      isDebugMode: isDebugMode ?? kDebugMode,
    );
  }

  Future<void> setIsContextInfoTrackingEnabled(bool enabled) async {
    return await WunderkindPlatform.instance
        .setIsContextInfoTrackingEnabled(enabled);
  }

  Future<void> trackScreenView({
    required String url,
    required ScreenType screen,
  }) async {
    return await WunderkindPlatform.instance
        .trackScreenView(url: url, screen: screen);
  }

  Future<void> trackEmptyCart() async {
    return await WunderkindPlatform.instance.trackEmptyCart();
  }

  Future<void> trackViewItem({
    required String itemId,
    required String groupId,
  }) async {
    return await WunderkindPlatform.instance
        .trackViewItem(itemId: itemId, groupId: groupId);
  }

  Future<void> trackSelectSku({
    required String groupId,
    required String feedId,
  }) async {
    return await WunderkindPlatform.instance
        .trackSelectSku(groupId: groupId, feedId: feedId);
  }

  Future<void> trackAddToCart({required String itemId}) async {
    return await WunderkindPlatform.instance.trackAddToCart(itemId: itemId);
  }

  Future<void> trackViewCategory({required WunderkindCategory category}) async {
    return await WunderkindPlatform.instance
        .trackViewCategory(category: category);
  }

  Future<void> trackViewSearch({
    required WunderkindCategory searchCategory,
  }) async {
    return await WunderkindPlatform.instance.trackViewSearch(
      searchCategory: searchCategory,
    );
  }

  Future<void> trackLoggedIn(WunderkindCustomer customer) async {
    return await WunderkindPlatform.instance.trackLoggedIn(customer);
  }

  Future<void> trackLoggedOut() async {
    return await WunderkindPlatform.instance.trackLoggedOut();
  }

  Future<void> trackTextOptIn({required String phone}) async {
    return await WunderkindPlatform.instance.trackTextOptIn(phone: phone);
  }

  Future<void> trackPurchase(WunderkindOrder order) async {
    return await WunderkindPlatform.instance.trackPurchase(order);
  }

  Future<void> setLogLevel(LogLevel level) async {
    return await WunderkindPlatform.instance.setLogLevel(level);
  }
}
