//
//  File.swift
//  
//
//  Created by Mongy on 23/01/2024.
//

import Vapor

struct BlogRouter: RouteCollection {
    let controller = BlogFrontendController()
    func boot(
        routes: RoutesBuilder
    ) throws {
        routes.get("blog", use: controller.blogView(req:)) // http://127.0.0.1:8080/blog
        routes.get(.anything, use: controller.postView(req:)) // http://127.0.0.1:8080/sample-post-5/
    }
}
