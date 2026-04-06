import 'package:flutter_test/flutter_test.dart';
import 'package:android_id_plus/android_id_plus.dart';
import 'package:android_id_plus/android_id_plus_platform_interface.dart';
import 'package:android_id_plus/android_id_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidIdPlusPlatform
    with MockPlatformInterfaceMixin
    implements AndroidIdPlusPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidIdPlusPlatform initialPlatform = AndroidIdPlusPlatform.instance;

  test('$MethodChannelAndroidIdPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidIdPlus>());
  });

  test('getPlatformVersion', () async {
    AndroidIdPlus androidIdPlusPlugin = AndroidIdPlus();
    MockAndroidIdPlusPlatform fakePlatform = MockAndroidIdPlusPlatform();
    AndroidIdPlusPlatform.instance = fakePlatform;

    expect(await androidIdPlusPlugin.getPlatformVersion(), '42');
  });
}
