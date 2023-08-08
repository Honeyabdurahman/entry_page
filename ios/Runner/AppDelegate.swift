import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIkey("AIzaSyA1oxNzhOVD_XG4wguWTHMr9RuhtqOvhQk")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

