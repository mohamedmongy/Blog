//
//  File.swift
//  
//
//  Created by Mongy on 16/01/2024.
//

import Vapor
import SwiftHtml
import SwiftSvg

public struct WebIndexTemplate: TemplateRepresentable {
    public var context: WebIndexContext
    var body: Tag
    public init(
        _
        context: WebIndexContext,
        @TagBuilder _ builder: () -> Tag
    ) {
        self.context = context
        self.body = builder()
    }
    @TagBuilder
    public func render(
        _ req: Request
    ) -> Tag {
        Html {
            Head {
                Meta()
                    .charset("utf-8")
                Meta()
                    .name(.viewport)
                    .content("width=device-width, initial-scale=1")
                Link(rel: .shortcutIcon)
                    .href("/img/favicon.ico")
                    .type("image/x-icon")
                Link(rel: .stylesheet)
                    .href("https://cdn.jsdelivr.net/gh/feathercms/feather-core@1.0.0-beta.44/feather.min.css")
                Link(rel: .stylesheet)
                    .href("/css/web.css")
                Title(context.title)
            }
            Body {
                Header {
                    Div {
                        A {
                            Img(src: "/img/logo.png", alt: "Logo")
                        }
                        .id("site-logo")
                        .href("/")
                        Nav {
                            Input()
                                .type(.checkbox)
                                .id("primary-menu-button")
                                .name("menu-button")
                                .class("menu-button")
                            Label {
                                Svg.menuIcon()
                            }
                            .for("primary-menu-button")
                            Div {
                                A("Home")
                                    .href("/home")
                                    .class("selected", req.url.path == "/home")
                                A("Blog")
                                    .href("/blog")
                                    .class("selected", req.url.path == "/blog/")
                                A("About")
                                    .href("/about")
                                    .onClick("javascript:about();")
                                // Calling the about function in the web.js
                                
                                if req.auth.has(AuthenticatedUser.self) {
                                    A("Sign out")
                                        .href("/sign-out/")
                                    A("Admin")
                                        .href("/admin/")
                                } else {
                                    A("Sign in")
                                        .href("/sign-in/")
                                }
                            }
                            .class("menu-items")
                        }
                        .id("primary-menu")
                    }
                    .id("navigation")
                }
                Main {
                    body
                }
                Footer {
                    Section {
                        P {
                            Text("This site is powered by ")
                            A("Swift")
                                .href("https://swift.org")
                                .target(.blank)
                            Text(" & ")
                            A("Vapor")
                                .href("https://vapor.codes")
                                .target(.blank)
                            Text(".")
                        }
                        P("myPage &copy; 2020-2022")
                    }
                }
                Script()
                    .type(.javascript)
                    .src("/js/web.js")
            }
        }
        .lang("en-US")
    }
}
