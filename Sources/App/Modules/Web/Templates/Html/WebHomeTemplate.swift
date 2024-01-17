//
//  File.swift
//  
//
//  Created by Mongy on 17/01/2024.
//

import Vapor
import SwiftHtml

struct WebHomeTemplate: TemplateRepresentable {
    var context: WebHomeContext
    init(
        _
        context: WebHomeContext
    ) {
        self.context = context
    }
    
    @TagBuilder
    func render(
        _ req: Request
    ) -> Tag {
        WebIndexTemplate(
            .init(
                title: context.title
            )
        ) {
            Div {
                Section {
                    H1(context.title)
                    P(context.message)
                }
                .class("lead")
            }
            .id("home")
            .class("container")
        }
        .render(req)
    }
}
