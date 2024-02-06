//
//  File.swift
//  
//
//  Created by Mongy on 06/02/2024.
//

import Vapor

struct AdminRouter: RouteCollection {
    let controller = AdminFrontendController()
    func boot(routes: RoutesBuilder) throws {
        routes
            .grouped(
                //We can use the redirectMiddleware function on an Authenticatable type which will return a
                //middleware that redirects every unauthenticated traffic to a specified path.
                AuthenticatedUser.redirectMiddleware(
                    path: "/sign-in/"
                )
            )
            .get("admin", use: controller.dashboardView)
    }
}
