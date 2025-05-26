//
//  HomeRouter.swift
//  SocialNetworkDemo
//
//  Created by SOTSYS061 on 24/05/25.
//

import Foundation
import UIKit

class BaseRouter {
    weak var controller: UIViewController?
    
    func setViewController(controller: UIViewController) {
        self.controller = controller
    }
}

class HomeRouter: BaseRouter {
    static func create() -> HomeViewController {        
        let router = HomeRouter()
        let interactor = DefaultHomeInteractor()
        let model:HomePresentor = DefaultHomePresentor(interactor: interactor, router: router)
        let controller = HomeViewController(model: model)
        router.setViewController(controller: controller)
        return controller
    }
    
    func openCreatePost() {
        let controller = DefaultCreatePostRouter.create()
        self.controller?.navigationController?.pushViewController(controller, animated: true)
    }
}
