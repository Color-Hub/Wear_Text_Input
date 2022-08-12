import 'package:flutter/services.dart';

import 'wear_text_input_platform_interface.dart';

class MethodChannelWearTextInput extends WearTextInputPlatform {
  final methodChannel = const MethodChannel('SELECT_INPUT_TYPE');

  @override
  Future<String?> getUserInput() async {
    final String? userInput = await methodChannel.invokeMethod('selectInputType');
    return userInput;
  }
}
