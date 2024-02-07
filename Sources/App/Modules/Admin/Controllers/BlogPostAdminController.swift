//
//  File.swift
//  
//
//  Created by Mongy on 07/02/2024.
//

import Vapor

struct BlogPostAdminController {
    func find(
        _ req: Request) async throws -> BlogPostModel {
            guard
                let id = req.parameters.get("postId"),
                let uuid = UUID(uuidString: id),
                let post = try await BlogPostModel
                    .query(on: req.db)
                    .filter(\.$id, .equal, uuid)
                    .with(\.$category)
                    .first()
            else {
                throw Abort(.notFound)
            }
            return post
        }
    func listView(
        _ req: Request) async throws -> Response {
            let posts = try await BlogPostModel.query(on: req.db).all()
            let api = BlogPostApiController()
            let list = posts.map { api.mapList($0) }
            let template = BlogPostAdminListTemplate(
                .init(
                    title: "Posts",
                    list: list
                )
            )
            return req.templates.renderHtml(template)
        }
    
    func detailView(
        _ req: Request) async throws -> Response {
            let post = try await find(req)
            let detail = BlogPostApiController().mapDetail(post)
            let template = BlogPostAdminDetailTemplate(
                .init(
                    title: "Post details",
                    detail: detail
                )
            )
            return req.templates.renderHtml(template)
        }
    
}
