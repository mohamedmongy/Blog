import Fluent
import Vapor
import SwiftHtml

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }

    app.get("blog") { req async -> Response in
        req.templates.renderHtml(
            WebIndexTemplate(WebIndexContext(title: "blog"), {
                P("Hi there, welcome to blog page!")
            })
        )
    }
    
    app.get("home") { req async -> Response in
        req.templates.renderHtml(
            WebHomeTemplate(WebHomeContext(title: "home", message: "Hi there, welcome to home page!"))
        )
    }
    

    
    
    try app.register(collection: TodoController())
}


struct MyTemplate: TemplateRepresentable {
    let title: String
    func render(
        _ req: Request) -> Tag {
            Html {
                Head {
                    Title(title)
                }
                Body {
                    H1(title)
                }
            }
        }
}
