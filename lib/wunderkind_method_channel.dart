import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wunderkind/models/log_level.dart';
import 'package:wunderkind/models/screen_type.dart';
import 'package:wunderkind/models/wunderkind_category.dart';
import 'package:wunderkind/models/wunderkind_customer.dart';
import 'package:wunderkind/models/wunderkind_order.dart';

import 'wunderkind_platform_interface.dart';

/// An implementation of [WunderkindPlatform] that uses method channels.
class MethodChannelWunderkind extends WunderkindPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wunderkind');

  @override
  Future<void> initialize({
    required String webId,
    required bool isDebugMode,
  }) async {
    debugPrint('[WDK Plugin] WebId: $webId, isDebugMode: $isDebugMode');
    await methodChannel.invokeMethod<void>('initialize', {
      "webId": webId,
      "isDebugMode": isDebugMode,
    });
  }

  @override
  Future<void> setIsContextInfoTrackingEnabled(bool enabled) async {
    debugPrint('[WDK Plugin] Info Tracking: $enabled');
    await methodChannel.invokeMethod<void>('setIsContextInfoTrackingEnabled', {
      "enabled": enabled,
    });
  }

  @override
  Future<void> trackScreenView({
    required String url,
    required ScreenType screen,
  }) async {
    debugPrint('[WDK Plugin] url: $url, screen: ${screen.toString()}');
    await methodChannel.invokeMethod<void>('trackScreenView', {
      "url": url,
      "screen": screen.toScreenTypeString(),
    });
  }

  @override
  Future<void> trackEmptyCart() async {
    debugPrint('[WDK Plugin] Cart Emptied');
    await methodChannel.invokeMethod<void>('trackEmptyCart');
  }

  @override
  Future<void> trackViewItem({
    required String itemId,
    required String groupId,
  }) async {
    debugPrint('[WDK Plugin] itemId: $itemId, groupId: $groupId');
    await methodChannel.invokeMethod<void>('trackViewItem', {
      "itemId": itemId,
      "groupId": groupId,
    });
  }

  @override
  Future<void> trackSelectSku({
    required String groupId,
    required String feedId,
  }) async {
    debugPrint('[WDK Plugin] groupId: $groupId, feedId: $feedId');
    await methodChannel.invokeMethod<void>('trackSelectSku', {
      "groupId": groupId,
      "feedId": feedId,
    });
  }

  @override
  Future<void> trackAddToCart({required String itemId}) async {
    debugPrint('[WDK Plugin] itemId: $itemId');
    await methodChannel
        .invokeMethod<void>('trackAddToCart', {"itemId": itemId});
  }

  @override
  Future<void> trackViewCategory({required WunderkindCategory category}) async {
    debugPrint('[WDK Plugin] category: ${category.toMap()}');
    await methodChannel.invokeMethod<void>(
        'trackViewCategory', category.toMap());
  }

  @override
  Future<void> trackViewSearch({
    required WunderkindCategory searchCategory,
  }) async {
    debugPrint('[WDK Plugin] searchCategory: ${searchCategory.toMap()}');
    await methodChannel.invokeMethod<void>(
      'trackViewSearch',
      searchCategory.toMap(),
    );
  }

  @override
  Future<void> trackLoggedIn(WunderkindCustomer customer) async {
    debugPrint('[WDK Plugin] customer: ${customer.toMap()}');
    await methodChannel.invokeMethod<void>('trackLoggedIn', customer.toMap());
  }

  @override
  Future<void> trackLoggedOut() async {
    debugPrint('[WDK Plugin] User logged out');
    await methodChannel.invokeMethod<void>('trackLoggedOut');
  }

  @override
  Future<void> trackTextOptIn({required String phone}) async {
    debugPrint('[WDK Plugin] OptInPhoneNumber: phone');
    await methodChannel.invokeMethod<void>('trackTextOptIn', {'phone': phone});
  }

  @override
  Future<void> trackPurchase(WunderkindOrder order) async {
    debugPrint('[WDK Plugin] order: ${order.toMap()}');
    await methodChannel.invokeMethod<void>('trackPurchase', order.toMap());
  }

  @override
  Future<void> setLogLevel(LogLevel level) async {
    debugPrint('[WDK Plugin] LogLevel: ${level.toString()}');
    await methodChannel.invokeMethod<void>(
      'setLogLevel',
      {'level': level.toLogLevelString()},
    );
  }
}
