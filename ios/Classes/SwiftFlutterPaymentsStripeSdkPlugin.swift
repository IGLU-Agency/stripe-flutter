import Flutter
import UIKit

public class SwiftFlutterPaymentsStripeSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_payments_stripe_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPaymentsStripeSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
