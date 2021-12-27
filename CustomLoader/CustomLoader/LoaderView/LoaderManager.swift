//
//  LoaderManager.swift
//  CustomLoader
//
//  Created by Intuz on 27/12/21.
//

import Foundation
import UIKit
import SwiftUI

class LoaderManager: NSObject {
    static let shared = LoaderManager()
    
    public override init() {
        super.init()
    }
}

extension LoaderManager {
    func showGlobalLoader(animating : Bool) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            let loader = ActivityIndicatorView(ringColor: Color.black, backgroundColor: Color.white)
            let hostVC = UIHostingController(rootView: loader)
            hostVC.modalPresentationStyle = .overCurrentContext
            hostVC.view.backgroundColor = .clear
            if animating {
                window.rootViewController?.present(hostVC, animated: false, completion: nil)
            }
            else {
                window.rootViewController?.dismiss(animated: false, completion: nil)
            }
        }
    }
}

extension UIApplication {
    var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
}

