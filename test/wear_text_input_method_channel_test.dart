import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wear_text_input/wear_text_input_method_channel.dart';

void main() {
  MethodChannelWearTextInput platform = MethodChannelWearTextInput();
  const MethodChannel channel = MethodChannel('SELECT_INPUT_TYPE');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'User text';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getUserInput', () async {
    expect(await platform.getUserInput(), 'User text');
  });
}
