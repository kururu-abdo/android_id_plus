import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_id_plus_method_channel.dart';

abstract class AndroidIdPlusPlatform extends PlatformInterface {
  /// Constructs a AndroidIdPlusPlatform.
  AndroidIdPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidIdPlusPlatform _instance = MethodChannelAndroidIdPlus();

  /// The default instance of [AndroidIdPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidIdPlus].
  static AndroidIdPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidIdPlusPlatform] when
  /// they register themselves.
  static set instance(AndroidIdPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
