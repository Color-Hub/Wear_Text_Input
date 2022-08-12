import 'package:flutter_test/flutter_test.dart';
import 'package:wear_text_input/wear_text_input.dart';
import 'package:wear_text_input/wear_text_input_platform_interface.dart';
import 'package:wear_text_input/wear_text_input_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWearTextInputPlatform 
    with MockPlatformInterfaceMixin
    implements WearTextInputPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WearTextInputPlatform initialPlatform = WearTextInputPlatform.instance;

  test('$MethodChannelWearTextInput is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWearTextInput>());
  });

  test('getPlatformVersion', () async {
    WearTextInput wearTextInputPlugin = WearTextInput();
    MockWearTextInputPlatform fakePlatform = MockWearTextInputPlatform();
    WearTextInputPlatform.instance = fakePlatform;
  
    expect(await wearTextInputPlugin.getPlatformVersion(), '42');
  });
}
