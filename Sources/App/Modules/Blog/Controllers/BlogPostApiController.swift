//
//  File.swift
//  
//
//  Created by Mongy on 07/02/2024.
//

import Vapor

struct BlogPostApiController {
    func mapList(
        _
        model: BlogPostModel) -> Blog.Post.List {
            .init(
                id: model.id!,
                title: model.title,
                slug: model.slug,
                image: model.imageKey,
                excerpt: model.excerpt,
                date: model.date
            )
        }
    
    func mapDetail(
        _
        model: BlogPostModel) -> Blog.Post.Detail {
            .init(
                id: model.id!,
                title: model.title,
                slug: model.slug,
                image: model.imageKey,
                excerpt: model.excerpt,
                date: model.date,
                category: .init(
                    id: model.category.id!,
                    title: model.category.title
                ),
                content: model.content
            )
        }
}
