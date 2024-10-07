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
import co.wunderkind.sdk.Order
import co.wunderkind.sdk.Invoice
import co.wunderkind.sdk.Customer
import co.wunderkind.sdk.Product
import co.wunderkind.sdk.ScreenType
import co.wunderkind.sdk.other.log.LogLevel
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

        var phoneStr = phone;

        if(phoneStr.startsWith("+")) {
          phoneStr = phone.drop(1)
        }

        val phoneLong = phoneStr.toLong()
        Wunderkind.getInstance().trackLoggedIn(email, phoneLong)
      }
      "trackLoggedOut" -> handleCall(result) {
        Wunderkind.getInstance().trackLoggedOut()
      }
      "trackTextOptIn" -> handleCall(result) {
        val phone = call.argument<String>("phone")!!

        
        var phoneStr = phone;

        if(phoneStr.startsWith("+")){
          phoneStr = phone.drop(1)
        }

        val phoneLong = phoneStr.toLong()
        Wunderkind.getInstance().trackTextOptIn(phoneLong)
      }
      "trackPurchase" -> handleCall(result) {
        val orderId = call.argument<String>("orderId")!!
        val productsMap = call.argument<List<Map<String, Any>>>("products")!!
        val invoiceMap = call.argument<Map<String, Any>>("invoice")!!
        val paymentMethod = call.argument<String>("paymentMethod")!!
        val customerMap = call.argument<Map<String, Any>>("customer")!!
        val coupons = call.argument<List<String>>("coupons")
        val goal = call.argument<String>("goal")!!

        val currency = invoiceMap["currency"] as String

        val invoice : Invoice = Invoice(
            invoiceMap["amount"] as Double,
            invoiceMap["tax"] as Double,
            invoiceMap["shipping"] as Double,
            invoiceMap["totalDiscount"] as Double?,
            Currency.valueOf(currency.uppercase()),
        );

        var phoneStr = customerMap["phone"] as String;

        if(phoneStr.startsWith("+")) {
          phoneStr = phone.drop(1)
        }

        val phoneLong = phoneStr.toLong()


        val customer : Customer = Customer(
            customerMap["email"] as String,
            phoneLong,
        );

          val products = productsMap.map { map : Map<String, Any> ->
              Product(
                  map["productId"] as String,
                  map["sku"] as String,
                  map["price"] as Double,
                  (map["quantity"] as Int).toLong(),
              )
          }


        val order : Order = Order(
            orderId,
            invoice,
            paymentMethod,
            products,
            customer,
            coupons,
            goal,
        );

        Wunderkind.getInstance().trackPurchase(order)
      }
      "setLogLevel" -> handleCall(result) {
        val levelStr = call.argument<String>("level")!!
        val level: LogLevel = LogLevel.valueOf(levelStr.uppercase())

        Wunderkind.getInstance().setLogLevel(level)
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
