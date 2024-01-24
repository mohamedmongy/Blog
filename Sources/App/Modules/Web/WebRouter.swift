//
//  File.swift
//  
//
//  Created by Mongy on 18/01/2024.
//

import Vapor

struct WebRouter: RouteCollection {
    let frontendController = WebFrontendController()
    func boot(
        routes: RoutesBuilder
    ) throws {
        routes.get(use: frontendController.homeView)
    }
}
