//
//  SceneDelegate.swift
//  ListView
//
//  Created by yongik on 11/19/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = scene as? UIWindowScene else {return}
                self.window = UIWindow(windowScene: windowScene)

                let rootViewController = ViewController() // RootView로 설정할 ViewController 클래스
                let rootNavigationController = UINavigationController(rootViewController: rootViewController)

                self.window?.rootViewController = rootNavigationController
                self.window?.makeKeyAndVisible()
        }
}
