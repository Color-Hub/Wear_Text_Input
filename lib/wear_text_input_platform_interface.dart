import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wear_text_input_method_channel.dart';

abstract class WearTextInputPlatform extends PlatformInterface {
  /// Constructs a WearTextInputPlatform.
  WearTextInputPlatform() : super(token: _token);

  static final Object _token = Object();

  static WearTextInputPlatform _instance = MethodChannelWearTextInput();

  /// The default instance of [WearTextInputPlatform] to use.
  ///
  /// Defaults to [MethodChannelWearTextInput].
  static WearTextInputPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WearTextInputPlatform] when
  /// they register themselves.
  static set instance(WearTextInputPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
