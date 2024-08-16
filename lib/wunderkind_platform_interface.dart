import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:wunderkind/models/log_level.dart';
import 'package:wunderkind/models/screen_type.dart';
import 'package:wunderkind/models/wunderkind_category.dart';
import 'package:wunderkind/models/wunderkind_customer.dart';
import 'package:wunderkind/models/wunderkind_order.dart';

import 'wunderkind_method_channel.dart';

abstract class WunderkindPlatform extends PlatformInterface {
  /// Constructs a WunderkindPlatform.
  WunderkindPlatform() : super(token: _token);

  static final Object _token = Object();

  static WunderkindPlatform _instance = MethodChannelWunderkind();

  /// The default instance of [WunderkindPlatform] to use.
  ///
  /// Defaults to [MethodChannelWunderkind].
  static WunderkindPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WunderkindPlatform] when
  /// they register themselves.
  static set instance(WunderkindPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  //Initialize Wunderkind
  //Get Web Id from wunderkind
  Future<void> initialize({
    required String webId,
    required bool isDebugMode,
  }) async {
    if (kDebugMode) {
      log('[WDK Plugin] WebId: $webId, isDebugMode: $isDebugMode');
    }
    return await _instance.initialize(webId: webId, isDebugMode: isDebugMode);
  }

  Future<void> setIsContextInfoTrackingEnabled(bool enabled) async {
    if (kDebugMode) {
      log('[WDK Plugin] Info Tracking: $enabled');
    }
    return await _instance.setIsContextInfoTrackingEnabled(enabled);
  }

  Future<void> trackScreenView({
    required String url,
    required ScreenType screen,
  }) async {
    if (kDebugMode) {
      log('[WDK Plugin] WebId: url: $url, screen: ${screen.toString()}');
    }
    return await _instance.trackScreenView(url: url, screen: screen);
  }

  Future<void> trackEmptyCart() async {
    if (kDebugMode) {
      log('[WDK Plugin] Cart Emptied');
    }
    return await _instance.trackEmptyCart();
  }

  Future<void> trackViewItem({
    required String itemId,
    required String groupId,
  }) async {
    if (kDebugMode) {
      log('[WDK Plugin] itemId: $itemId, groupId: $groupId');
    }
    return await _instance.trackViewItem(itemId: itemId, groupId: groupId);
  }

  Future<void> trackSelectSku({
    required String groupId,
    required String feedId,
  }) async {
    if (kDebugMode) {
      log('[WDK Plugin] groupId: $groupId, feedId: $feedId');
    }
    return await _instance.trackSelectSku(groupId: groupId, feedId: feedId);
  }

  Future<void> trackAddToCart({required String itemId}) async {
    if (kDebugMode) {
      log('[WDK Plugin] itemId: $itemId');
    }
    return await _instance.trackAddToCart(itemId: itemId);
  }

  Future<void> trackViewCategory({required WunderkindCategory category}) async {
    if (kDebugMode) {
      log('[WDK Plugin] category: ${category.toMap()}');
    }
    return await _instance.trackViewCategory(category: category);
  }

  Future<void> trackViewSearch({
    required WunderkindCategory searchCategory,
  }) async {
    if (kDebugMode) {
      log('[WDK Plugin] searchCategory: ${searchCategory.toMap()}');
    }
    return await _instance.trackViewSearch(searchCategory: searchCategory);
  }

  Future<void> trackLoggedIn(WunderkindCustomer customer) async {
    if (kDebugMode) {
      log('[WDK Plugin] customer: ${customer.toMap()}');
    }
    return await _instance.trackLoggedIn(customer);
  }

  Future<void> trackLoggedOut() async {
    if (kDebugMode) {
      log('[WDK Plugin] User logged out');
    }
    return await _instance.trackLoggedOut();
  }

  Future<void> trackTextOptIn({required String phone}) async {
    if (kDebugMode) {
      log('[WDK Plugin] OptInPhoneNumber: phone');
    }
    return await _instance.trackTextOptIn(phone: phone);
  }

  Future<void> trackPurchase(WunderkindOrder order) async {
    if (kDebugMode) {
      log('[WDK Plugin] order: ${order.toMap()}');
    }
    return await _instance.trackPurchase(order);
  }

  Future<void> setLogLevel(LogLevel level) async {
    if (kDebugMode) {
      log('[WDK Plugin] LogLevel: ${level.toString()}');
    }
    return await _instance.setLogLevel(level);
  }
}
