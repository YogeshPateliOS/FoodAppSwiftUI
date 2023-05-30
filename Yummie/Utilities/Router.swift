//
//  Router.swift
//  Yummie
//
//  Created by Yogesh Patel on 30/05/23.
//

import UIKit
import SwiftUI

final class Router {

    //MARK: Main flow.
    public static func showMain(window: UIWindow? = nil) {
        Router.setRootView(view: HomeView(), window: window)
    }

    //MARK: private
    private static func setRootView<T: View>(view: T, window: UIWindow? = nil) {
        if window != nil {
            window?.rootViewController = UIHostingController(rootView: view)
            UIView.transition(with: window!,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
            return
        }else {
            UIApplication.shared.keyWindow?.rootViewController = UIHostingController(rootView: view)
            UIView.transition(with: UIApplication.shared.keyWindow!,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
    }

}

extension UIApplication {

    var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }

}
