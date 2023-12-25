//
//  VIPERAppRouter.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 3.12.2023.
//

import UIKit

final class AppRouter {
    
    var window = UIWindow()

    func start ( windowScene: UIWindowScene) {
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = .blue
//        viewController.title = "Replace Me"
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.windowScene = windowScene
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

    }
    
}
