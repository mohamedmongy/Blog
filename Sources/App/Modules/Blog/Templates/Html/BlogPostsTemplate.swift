//
//  File.swift
//  
//
//  Created by Mongy on 23/01/2024.
//

import Vapor
import SwiftHtml

struct BlogPostsTemplate: TemplateRepresentable {
    var context: BlogPostsContext
    init(
        _
        context: BlogPostsContext
    ) {
        self.context = context
    }
    
    @TagBuilder
    func render(
        _ req: Request
    ) -> Tag {
        WebIndexTemplate(
            .init(title: context.title)
        ) {
            Div {
                Section {
                    P(context.icon)
                    H1(context.title)
                    P(context.message)
                }
                .class("lead")
                Div {
                    for post in context.posts {
                        Article {
                            A {
                                Img(src: post.image, alt: post.title)
                                H2(post.title)
                                P(post.excerpt)
                            }
                            .href("/\(post.slug)/")
                        }
                    }
                }
                .class("grid-221")
            }
            .id("blog")
        }
        .render(req)
    }
}
