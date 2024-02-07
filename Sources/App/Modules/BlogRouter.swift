//
//  File.swift
//  
//
//  Created by Mongy on 23/01/2024.
//

import Vapor

struct BlogRouter: RouteCollection {
    let controller = BlogFrontendController()
    let postAdminController = BlogPostAdminController()
    
    func boot(
        routes: RoutesBuilder
    ) throws {
        routes.get("blog", use: controller.blogView(req:)) // http://127.0.0.1:8080/blog
        routes.get(.anything, use: controller.postView(req:)) // http://127.0.0.1:8080/sample-post-5/
        
        //        routes
        //        .grouped(AuthenticatedUser.redirectMiddleware(path: "/"))
        //        .grouped("admin", "blog") // http://127.0.0.1:8080/admin/blog/
        //        .get("posts", use: postAdminController.listView)  // http://127.0.0.1:8080/admin/blog/posts
        
        let posts = routes
            .grouped(AuthenticatedUser.redirectMiddleware(path: "/"))
            .grouped("admin", "blog", "posts")
        posts.get(use: postAdminController.listView)
        posts.get(":postId", use: postAdminController.detailView)
    }
}
