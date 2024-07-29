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
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "initialize":
      guard let args = call.arguments as? [String : Any] else {return}
      let websiteId = args["webId"] as? String
      let isDebugMode = args["isDebugMode"] as? Bool
      Wunderkind.shared.initialize(websiteId: Int64(websiteId!)!, isDebugMode:isDebugMode ?? true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
