
import 'wear_text_input_platform_interface.dart';

class WearTextInput {
  Future<String?> getUserInput() {
    return WearTextInputPlatform.instance.getUserInput();
  }
}
