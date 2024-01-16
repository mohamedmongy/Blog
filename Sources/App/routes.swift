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

    app.get("mongy") { req async -> Response in
        req.templates.renderHtml(
            WebIndexTemplate(
                WebIndexContext(
                    title: "Home",
                    message: "Hi there, welcome to my page!"
                )
            )
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
