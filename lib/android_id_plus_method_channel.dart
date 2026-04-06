import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_id_plus_platform_interface.dart';

/// An implementation of [AndroidIdPlusPlatform] that uses method channels.
class MethodChannelAndroidIdPlus extends AndroidIdPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_id_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
