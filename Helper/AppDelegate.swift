//
//  AppDelegate.swift
//  Helper
//
//  Created by TørK on 25/07/2018.
//  Copyright © 2018 Tørk Egeberg. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppContext {

    var window: UIWindow?
    var state: State?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        self.changeState(state: CreateLogin())
        return true
    }

    func present(view: ViewProvider) {
        self.setRootViewController(viewController: view.getViewController())
    }
    
    func changeState(state: State) {
        print("Entering: \(state)")
        self.state = state
        state.enterState(context: self)
    }
    
    func setupWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func setRootViewController(viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        self.window?.rootViewController = navigationController
    }

}

