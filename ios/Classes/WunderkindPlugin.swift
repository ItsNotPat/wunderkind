import Flutter
import UIKit
import WunderkindKit

public class WunderkindPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "wunderkind", binaryMessenger: registrar.messenger())
    let instance = WunderkindPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "initialize":
      guard let args = call.arguments as? [String : Any] else {return}
      let websiteId = args["webId"] as? String
      let isDebugMode = args["isDebugMode"] as? Bool

      Wunderkind.shared.initialize(websiteId: Int64(websiteId!)!, isDebugMode:isDebugMode ?? true)
    case "setIsContextInfoTrackingEnabled":
      guard let args = call.arguments as? [String : Any] else {return}
      let enabled = args["enabled"] as? Bool

      Wunderkind.shared.isContextInfoTrackingEnabled = enabled ?? true
    case "trackScreenView":
      guard let args = call.arguments as? [String : Any] else {return}
      let urlStr = args["url"] as? String
      let screenStr = args["screen"] as? String

      let screenType = WunderkindKit.ScreenType(rawStringValue: screenStr ?? "")

      Wunderkind.shared.trackScreenView(url: URL(string: urlStr ?? "")!, type: screenType ?? .home)
    case "trackEmptyCart":
      Wunderkind.shared.trackEmptyCart()
    case "trackViewItem":
      guard let args = call.arguments as? [String : Any] else {return}
      let itemId = args["itemId"] as? String
      let groupId = args["groupId"] as? String

      Wunderkind.shared.trackViewItem(itemId: itemId ?? "", groupId: groupId ?? "") 
    case "trackSelectSku":
      guard let args = call.arguments as? [String : Any] else {return}
      let groupId = args["groupId"] as? String
      let feedId = args["feedId"] as? String

      Wunderkind.shared.trackSelectSKU(groupId: groupId ?? "", feedId: feedId ?? "")
    case "trackAddToCart":
      guard let args = call.arguments as? [String : Any] else {return}
      let itemId = args["itemId"] as? String

      Wunderkind.shared.trackAddToCart(itemId: itemId ?? "") 
    case "trackViewCategory":
      guard let args = call.arguments as? [String : Any] else {return}
      let categoryName = args["categoryName"] as? String
      let urlStr = args["url"] as? String
      let ids = args["itemIds"] as? Array<String>

      var category = WunderkindKit.ProductCategory(title: categoryName ?? "", url: URL(string: urlStr ?? "")!, itemIds: ["test_id"])
      
      Wunderkind.shared.trackViewCategory(category: category)
    case "trackViewSearch":
      guard let args = call.arguments as? [String : Any] else {return}
      let categoryName = args["categoryName"] as? String
      let urlStr = args["url"] as? String
      let ids = args["itemIds"] as? Array<String>

      var category = WunderkindKit.ProductCategory(title: categoryName ?? "", url: URL(string: urlStr ?? "")!, itemIds: ["test_id"])
      
      Wunderkind.shared.trackViewSearch(category: category) 
    case "trackLoggedIn":
      guard let args = call.arguments as? [String : Any] else {return}
      let phone = args["phone"] as? String
      let email = args["email"] as? String

      Wunderkind.shared.trackLoggedIn(email: email ?? "", phone: phone ?? "") 
    case "trackLoggedOut":

      Wunderkind.shared.trackLoggedOut()
    case "trackTextOptIn":
      guard let args = call.arguments as? [String : Any] else {return}
      let phone = args["phone"] as? String

      Wunderkind.shared.trackTextOptIn(phoneNumber: phone ?? "", languageCode: nil) 
    case "trackPurchase":
      guard let args = call.arguments as? [String : Any] else {return}
      let orderId = args["orderId"] as? String
      guard let productsMap = args["products"] as? Array<[String : Any]> else {return}
      guard let invoiceMap = args["invoice"] as? [String : Any] else {return}
      let paymentMethod = args["paymentMethod"] as? String
      guard let customerMap = args["customer"] as? [String : Any] else {return}
      let coupons = args["coupons"] as? Array<String>
      let goal = args["goal"] as? String
      let currency = invoiceMap["currency"] as? String

      let currencyType = WunderkindKit.Currency(rawValue: Int(currency ?? "0") ?? 0)
      let invoice = WunderkindKit.Invoice(
          amount: invoiceMap["amount"] as? Decimal ?? 0.0,
          tax: invoiceMap["tax"] as? Decimal ?? 0.0,
          shipping: invoiceMap["shipping"] as? Decimal ?? 0.0,
          totalDiscount: invoiceMap["totalDiscount"] as? Decimal ?? 0.0,
          currency: currencyType ?? .USD
      )
      let customer = WunderkindKit.Customer(
          email: customerMap["email"] as? String ?? "",
          phone: customerMap["phone"] as? String ?? ""
      )
      var products = [WunderkindKit.Product]()
      for product in productsMap {
        products.append(
          WunderkindKit.Product(
              productId: product["productId"] as? String ?? "",
              skuId: product["sku"] as? String ?? "",
              price: product["price"] as? Decimal ?? 0.0,
              quantity: product["quantity"] as? Int64 ?? 0
          )
        )
      }
      let order = WunderkindKit.Order(
          orderId: orderId ?? "",
          invoice: invoice,
          paymentMethod: paymentMethod ?? "",
          products: products,
          customer: customer,
          coupons: coupons,
          goal: goal ?? ""
      );

      Wunderkind.shared.trackPurchase(order: order)
    case "setLogLevel":
      guard let args = call.arguments as? [String : Any] else {return}
      let level = args["level"] as? String

      let screenType = WunderkindKit.LogLevel(rawStringValue: level ?? "")
      
      Wunderkind.shared.logLevel = .debug 
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
