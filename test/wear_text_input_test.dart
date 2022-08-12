import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:wear_text_input/wear_text_input.dart';
import 'package:wear_text_input/wear_text_input_method_channel.dart';
import 'package:wear_text_input/wear_text_input_platform_interface.dart';

class MockWearTextInputPlatform with MockPlatformInterfaceMixin implements WearTextInputPlatform {
  @override
  Future<String?> getUserInput() => Future.value('User text');
}

void main() {
  final WearTextInputPlatform initialWear = WearTextInputPlatform.instance;

  test('$MethodChannelWearTextInput is the default instance', () {
    expect(initialWear, isInstanceOf<MethodChannelWearTextInput>());
  });

  test('getPlatformVersion', () async {
    WearTextInput wearTextInputPlugin = WearTextInput();
    MockWearTextInputPlatform fakeWear = MockWearTextInputPlatform();
    WearTextInputPlatform.instance = fakeWear;

    expect(await wearTextInputPlugin.getUserInput(), 'User text');
  });
}
