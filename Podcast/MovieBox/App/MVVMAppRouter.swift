//
//  MVVMAppRouter.swift
//  MovieBox
//
//  Created by Mahmud CIKRIK on 29.11.2023.
//

import UIKit

final class AppRouter {
    
    var window = UIWindow()

    func start ( windowScene: UIWindowScene) {

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.windowScene = windowScene
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

    }
    
}
