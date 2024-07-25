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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  //Initialize Wunderkind
  //Get Web Id from wunderkind
  Future<void> initialize({
    required String webId,
    required bool isDebugMode,
  }) async {
    return await _instance.initialize(webId: webId, isDebugMode: isDebugMode);
  }

  Future<void> setIsContextInfoTrackingEnabled(bool enabled) async {
    return await _instance.setIsContextInfoTrackingEnabled(enabled);
  }

  Future<void> trackScreenView({
    required String url,
    required ScreenType screen,
  }) async {
    return await _instance.trackScreenView(url: url, screen: screen);
  }

  Future<void> trackEmptyCart() async {
    return await _instance.trackEmptyCart();
  }

  Future<void> trackViewItem({
    required String itemId,
    required String groupId,
  }) async {
    return await _instance.trackViewItem(itemId: itemId, groupId: groupId);
  }

  Future<void> trackSelectSku({
    required String groupId,
    required String feedId,
  }) async {
    return await _instance.trackSelectSku(groupId: groupId, feedId: feedId);
  }

  Future<void> trackAddToCart({required String itemId}) async {
    return await _instance.trackAddToCart(itemId: itemId);
  }

  Future<void> trackViewCategory({required WunderkindCategory category}) async {
    return await _instance.trackViewCategory(category: category);
  }

  Future<void> trackViewSearch({
    required WunderkindCategory searchCategory,
  }) async {
    return await _instance.trackViewSearch(searchCategory: searchCategory);
  }

  Future<void> trackLoggedIn(WunderkindCustomer customer) async {
    return await _instance.trackLoggedIn(customer);
  }

  Future<void> trackLoggedOut() async {
    return await _instance.trackLoggedOut();
  }

  Future<void> trackTextOptIn({required String phone}) async {
    return await _instance.trackTextOptIn(phone: phone);
  }

  Future<void> trackPurchase(WunderkindOrder order) async {
    return await _instance.trackPurchase(order);
  }

  Future<void> setLogLevel(LogLevel level) async {
    return await _instance.setLogLevel(level);
  }
}
