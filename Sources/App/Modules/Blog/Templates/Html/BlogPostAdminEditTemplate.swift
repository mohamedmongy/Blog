//
//  File.swift
//  
//
//  Created by Mongy on 09/02/2024.
//

import Foundation

import Vapor
import SwiftHtml

struct BlogPostAdminEditTemplate: TemplateRepresentable {
    var context: BlogPostAdminEditContext
    init(
        _
        context: BlogPostAdminEditContext
    ) {
        self.context = context
    }
    @TagBuilder
    func render(
        _ req: Request
    ) -> Tag {
        AdminIndexTemplate(
            .init(title: context.title)
        ) {
            Div {
                Section {
                    H1(context.title)
                }
                .class("lead")
                context.form.render(req)
            }
            .id("edit")
            .class("container")
        }
        .render(req)
    }
}
