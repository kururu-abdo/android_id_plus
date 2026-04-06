import 'dart:io';
import 'package:flutter/services.dart';

class AndroidIdPlus {
  /// تعريف القناة الخاصة بالمكتبة
  static const MethodChannel _channel = MethodChannel('android_id_plus');

  /// جلب معرّف الأندرويد
  static Future<String?> get androidId async {
    if (Platform.isAndroid) {
      try {
        final String? id = await _channel.invokeMethod('getAndroidId');
        return id;
      } on PlatformException catch (e) {
        print("AndroidIdPlus Error: '${e.message}'.");
        return null;
      }
    }
    // يمكنك لاحقاً إضافة دعم لـ iOS إذا أردت (مثل identifierForVendor)
    return null; 
  }
}