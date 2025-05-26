//
//  CreatePostWireframe.swift
//  SwiftDemos
//
//  Created by SOTSYS009 on 20/01/24.
//

import Foundation


protocol CreatePostRouter {
    func goBack()
}

class DefaultCreatePostRouter:BaseRouter {
    static func create() -> CreatePostViewController {
        let router = DefaultCreatePostRouter()
        let interactor = DefaultCreatePostInteractor()
        let viewModel = DefaultCreatePostPresentor(interactor: interactor, router: router)
        let controller = CreatePostViewController(model: viewModel)
        router.setViewController(controller: controller)
        return controller
    }
}

extension DefaultCreatePostRouter: CreatePostRouter {
    func goBack() {
        self.controller?.navigationController?.popViewController(animated: true)
    }
}
