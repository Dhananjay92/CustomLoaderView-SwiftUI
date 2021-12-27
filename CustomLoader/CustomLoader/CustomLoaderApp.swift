//
//  CustomLoaderApp.swift
//  CustomLoader
//
//  Created by Intuz on 22/12/21.
//

import SwiftUI

@main
struct CustomLoaderApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            SplashView()
            .onChange(of: scenePhase) { phase in
                switch phase {
                case .active:
                    print("scene is now active!")
                case .inactive:
                    print("scene is now inactive!")
                case .background:
                    print("scene is now in the background!")
                @unknown default:
                    print("Apple must have added something new!")
                }
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("CustomLoaderApp application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
        _ = LoaderManager.shared
        return true
    }
}
