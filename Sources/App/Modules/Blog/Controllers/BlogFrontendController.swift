//
//  File.swift
//  
//
//  Created by Mongy on 23/01/2024.
//

import Vapor
struct BlogFrontendController {
   
    func blogView(
        req: Request
    ) async throws -> Response {
        let postModels = try await BlogPostModel
            .query(on: req.db)
            .sort(\.$date, .descending)
            .all()
        
        let api = BlogPostApiController()
        let list = postModels.map { api.mapList($0) }
        
        let ctx = BlogPostsContext(
            icon: "🔥",
            title: "Blog",
            message: "Hot news and stories about everything.",
            posts: list
        )
        
        return req.templates.renderHtml(
            BlogPostsTemplate(ctx)
        )
    }
    
    func postView(
    req: Request
    ) async throws -> Response {
        let slug = req.url.path.trimmingCharacters(
            in: .init(charactersIn: "/")
        )
        guard
            let post = try await BlogPostModel
                .query(on: req.db)
                .filter(\.$slug, .equal, slug)
                .with(\.$category) // eager load post category
                .first()
        else {
            return req.redirect(to: "/")
        }
        
        let api = BlogPostApiController()
        let ctx = BlogPostContext(post: api.mapDetail(post))
        
        return req.templates.renderHtml(
            BlogPostTemplate(ctx)
        )
    }
    
}
