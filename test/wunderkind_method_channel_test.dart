import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wunderkind/wunderkind_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWunderkind platform = MethodChannelWunderkind();
  const MethodChannel channel = MethodChannel('wunderkind');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {});
}
