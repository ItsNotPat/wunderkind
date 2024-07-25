import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:wunderkind/models/log_level.dart';
import 'package:wunderkind/models/screen_type.dart';
import 'package:wunderkind/models/wunderkind_category.dart';
import 'package:wunderkind/models/wunderkind_customer.dart';
import 'package:wunderkind/models/wunderkind_order.dart';
import 'package:wunderkind/wunderkind.dart';
import 'package:wunderkind/wunderkind_method_channel.dart';
import 'package:wunderkind/wunderkind_platform_interface.dart';

class MockWunderkindPlatform
    with MockPlatformInterfaceMixin
    implements WunderkindPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> initialize({required String webId, required bool isDebugMode}) {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<void> setIsContextInfoTrackingEnabled(bool enabled) {
    // TODO: implement setIsContextInfoTrackingEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setLogLevel(LogLevel level) {
    // TODO: implement setLogLevel
    throw UnimplementedError();
  }

  @override
  Future<void> trackAddToCart({required String itemId}) {
    // TODO: implement trackAddToCart
    throw UnimplementedError();
  }

  @override
  Future<void> trackEmptyCart() {
    // TODO: implement trackEmptyCart
    throw UnimplementedError();
  }

  @override
  Future<void> trackLoggedIn(WunderkindCustomer customer) {
    // TODO: implement trackLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> trackLoggedOut() {
    // TODO: implement trackLoggedOut
    throw UnimplementedError();
  }

  @override
  Future<void> trackPurchase(WunderkindOrder order) {
    // TODO: implement trackPurchase
    throw UnimplementedError();
  }

  @override
  Future<void> trackScreenView(
      {required String url, required ScreenType screen}) {
    // TODO: implement trackScreenView
    throw UnimplementedError();
  }

  @override
  Future<void> trackSelectSku(
      {required String groupId, required String feedId}) {
    // TODO: implement trackSelectSku
    throw UnimplementedError();
  }

  @override
  Future<void> trackTextOptIn({required String phone}) {
    // TODO: implement trackTextOptIn
    throw UnimplementedError();
  }

  @override
  Future<void> trackViewCategory({required WunderkindCategory category}) {
    // TODO: implement trackViewCategory
    throw UnimplementedError();
  }

  @override
  Future<void> trackViewItem(
      {required String itemId, required String groupId}) {
    // TODO: implement trackViewItem
    throw UnimplementedError();
  }

  @override
  Future<void> trackViewSearch({
    required WunderkindCategory searchCategory,
  }) {
    // TODO: implement trackViewSearch
    throw UnimplementedError();
  }
}

void main() {
  final WunderkindPlatform initialPlatform = WunderkindPlatform.instance;

  test('$MethodChannelWunderkind is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWunderkind>());
  });

  test('getPlatformVersion', () async {
    Wunderkind wunderkindPlugin = Wunderkind();
    MockWunderkindPlatform fakePlatform = MockWunderkindPlatform();
    WunderkindPlatform.instance = fakePlatform;
  });
}
