package com.example.wunderkind

import android.content.Context
import android.widget.Toast
import androidx.annotation.NonNull
import java.net.URL

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import co.wunderkind.sdk.Wunderkind
import co.wunderkind.sdk.ProductCategory
import co.wunderkind.sdk.ScreenType
//import co.wunderkind.sdk.LogLevel
import co.wunderkind.sdk.Currency

/** WunderkindPlugin */
class WunderkindPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context : Context


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wunderkind")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
      "initialize" -> handleCall(result) {
        val webId = call.argument<String>("webId")!!
        val isDebugMode = call.argument<Boolean>("isDebugMode")!!
        Wunderkind.getInstance().initialize(context, webId.toLong(), isDebugMode)
      }
      "setIsContextInfoTrackingEnabled" -> handleCall(result) {
        val enabled = call.argument<Boolean>("enabled")!!
        Wunderkind.getInstance().setIsContextInfoTrackingEnabled(enabled)
      }
      "trackScreenView" -> handleCall(result) {
        val urlStr = call.argument<String>("url")!!
        val screenStr = call.argument<String>("screen")!!

        val url = URL(urlStr);
        val screen: ScreenType = ScreenType.valueOf(screenStr.uppercase())
        Wunderkind.getInstance().trackScreenView(url, screen)
      }
      "trackEmptyCart" -> handleCall(result) {
        Wunderkind.getInstance().trackEmptyCart()
      }
      "trackViewItem" -> handleCall(result) {
        val itemId = call.argument<String>("itemId")!!
        val groupId = call.argument<String>("groupId")!!
        Wunderkind.getInstance().trackViewItem(itemId, groupId)
      }
      "trackSelectSku" -> handleCall(result) {
        val groupId = call.argument<String>("groupId")!!
        val feedId = call.argument<String>("feedId")!!
        Wunderkind.getInstance().trackSelectSku(groupId, feedId)
      }
      "trackAddToCart" -> handleCall(result) {
        val itemId = call.argument<String>("itemId")!!
        Wunderkind.getInstance().trackAddToCart(itemId)
      }
      "trackViewCategory" -> handleCall(result) {
        val categoryName = call.argument<String>("categoryName")!!
        val urlStr = call.argument<String>("url")!!
        val ids = call.argument<List<String>>("itemIds")!!

        val url = URL(urlStr);

        val category: ProductCategory = ProductCategory(categoryName, url, ids)
        Wunderkind.getInstance().trackViewCategory(category)
      }
      "trackViewSearch" -> handleCall(result) {
        val searchInput = call.argument<String>("categoryName")!!
        val searchUrlStr = call.argument<String>("url")
        val itemIds = call.argument<List<String>>("itemIds")!!

        val searchUrl = URL(searchUrlStr);
        val searchResults: ProductCategory = ProductCategory(searchInput, searchUrl, itemIds)
        Wunderkind.getInstance().trackViewSearch(searchResults)
      }
      "trackLoggedIn" -> handleCall(result) {
        val phone = call.argument<String>("phone")!!
        val email = call.argument<String>("email")!!
        Wunderkind.getInstance().trackLoggedIn(phone, email)
      }
      "trackLoggedOut" -> handleCall(result) { Wunderkind.getInstance().trackLoggedOut() }
      "trackTextOptIn" -> handleCall(result) {
        val phone = call.argument<String>("phone")!!
        Wunderkind.getInstance().trackTextOptIn(phone)
      }
      "trackPurchase" -> handleCall(result) {
        val orderId = call.argument<String>("orderId")!!
        val items = call.argument<List<Map<String, String>>>("items")!!
        // ... rest of trackPurchase logic
      }
      "setLogLevel" -> handleCall(result) {
        val levelStr = call.argument<String>("level")!!
//        val level: LogLevel = LogLevel.valueOf(levelStr.uppercase())
//
//        Wunderkind.getInstance().setLogLevel(level)
      }

      else -> result.notImplemented()
    }
  }


  private inline fun handleCall(result: Result, block: () -> Unit) {
    try {
      block()
      result.success(true)
    } catch (e: Exception) {
      result.error("WDK Plugin Error", "[WDK Plugin Error] ${e.toString()}", null)
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
