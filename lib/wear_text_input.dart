
import 'wear_text_input_platform_interface.dart';

class WearTextInput {
  Future<String?> getPlatformVersion() {
    return WearTextInputPlatform.instance.getPlatformVersion();
  }
}
