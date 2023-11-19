//import 'dart:io' show Platform;

class CrashLogUtil {
  String getDebugInfo() {
    return "";
    //return """
    //  App version: ${BuildConfig.VERSION_NAME} (${BuildConfig.FLAVOR}, ${BuildConfig.COMMIT_SHA}, ${BuildConfig.VERSION_CODE}, ${BuildConfig.BUILD_TIME})
    //  Android version: ${Build.VERSION.RELEASE} (SDK ${Build.VERSION.SDK_INT})
    //  Android build ID: ${Build.DISPLAY}
    //  Device brand: ${Build.BRAND}
    //  Device manufacturer: ${Build.MANUFACTURER}
    //  Device name: ${Build.DEVICE}
    //  Device model: ${Build.MODEL}
    //  Device product name: ${Build.PRODUCT}
    //  WebView user agent: ${WebViewUtil.getInferredUserAgent(context)}
    //""".trimIndent()
  }
}
