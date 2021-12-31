import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_ocr_plugin/simple_ocr_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('simple_ocr_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await SimpleOcrPlugin.platformVersion, '42');
  // });
}
