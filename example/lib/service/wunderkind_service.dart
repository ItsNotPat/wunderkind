import 'package:flutter/material.dart';
import 'package:wunderkind/models/log_level.dart';
import 'package:wunderkind/models/screen_type.dart';
import 'package:wunderkind/models/wunderkind_category.dart';
import 'package:wunderkind/models/wunderkind_customer.dart';
import 'package:wunderkind/wunderkind.dart';

class WunderkindService {
  static final _wunderkindPlugin = Wunderkind();

  static Future<void> trackScreenView(String url, ScreenType screen) async {
    try {
      await _wunderkindPlugin.trackScreenView(url: url, screen: screen);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> trackEmptyCart() async {
    try {
      await _wunderkindPlugin.trackEmptyCart();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> trackViewItem(String itemId, String groupId) async {
    try {
      await _wunderkindPlugin.trackViewItem(itemId: itemId, groupId: groupId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> trackSelectSku(String feedId, String groupId) async {
    try {
      await _wunderkindPlugin.trackSelectSku(groupId: groupId, feedId: feedId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> addToCart(String itemId) async {
    try {
      await _wunderkindPlugin.trackAddToCart(itemId: itemId);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> trackViewCategory(WunderkindCategory category) async {
    try {
      await _wunderkindPlugin.trackViewCategory(category: category);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> trackViewSearch(WunderkindCategory category) async {
    try {
      await _wunderkindPlugin.trackViewSearch(searchCategory: category);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> trackLoggedIn(WunderkindCustomer customer) async {
    try {
      await _wunderkindPlugin.trackLoggedIn(customer);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> trackLoggedOut() async {
    try {
      await _wunderkindPlugin.trackLoggedOut();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> trackTextOptIn(String phone) async {
    try {
      await _wunderkindPlugin.trackTextOptIn(phone: phone);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // static Future<void> trackPurchase() async {
  //   try {
  //     await _wunderkindPlugin.trackPurchase();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  static Future<void> setLogLevel(LogLevel level) async {
    try {
      await _wunderkindPlugin.setLogLevel(level);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
