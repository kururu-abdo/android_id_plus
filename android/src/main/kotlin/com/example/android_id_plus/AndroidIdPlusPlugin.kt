package com.example.android_id_plus
package com.example.android_id_plus // تأكد أن هذا يطابق مسار المجلد عندك

import android.provider.Settings
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class AndroidIdPlusPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private var contentResolver: android.content.ContentResolver? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_id_plus")
    channel.setMethodCallHandler(this)
    // حفظ الـ ContentResolver لاستخدامه لاحقاً في جلب الـ ID
    contentResolver = flutterPluginBinding.applicationContext.contentResolver
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getAndroidId") {
      val androidId = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
      if (androidId != null) {
        result.success(androidId)
      } else {
        result.error("UNAVAILABLE", "Android ID not available.", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}