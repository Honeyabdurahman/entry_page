import UIKit
import Flutter
import GoogleMaps  // Add this import
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyDVBOdibEyEkPIJD7Ir4zvibiLP_Dh04Ws")
    GMSServices.provideAPIkey("AIzaSyA1oxNzhOVD_XG4wguWTHMr9RuhtqOvhQk")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

