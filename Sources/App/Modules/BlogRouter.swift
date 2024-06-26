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
    let categoryApiController = BlogCategoryApiController()
    
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
        
        let postId = posts.grouped(":postId")
        postId.get(use: postAdminController.detailView)
        
        // Create Post
        posts.get("create", use: postAdminController.createView)
        posts.post("create", use: postAdminController.createAction)
        
        // Update Post
        postId.get("update", use: postAdminController.updateView)
        postId.post("update", use: postAdminController.updateAction)
        
        // Delete Post
        postId.get("delete", use: postAdminController.deleteView)
        postId.post("delete", use: postAdminController.deleteAction)
        
        let blogApi = routes.grouped("api", "blog")
        let categoriesApi = blogApi.grouped("categories")
        categoriesApi.get(use: categoryApiController.listApi)
        
        let categoryApiId = categoriesApi.grouped(":categoryId")
        categoryApiId.get(use: categoryApiController.detailApi)
        categoriesApi.post(use: categoryApiController.createApi)
        categoryApiId.put(use: categoryApiController.updateApi)
        categoryApiId.patch(use: categoryApiController.patchApi)
        categoryApiId.delete(use: categoryApiController.deleteApi)
    }
}
