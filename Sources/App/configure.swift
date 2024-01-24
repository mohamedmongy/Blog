import NIOSSL
import Fluent
import FluentPostgresDriver
import Leaf
import Vapor



 // https://theswiftdev.com/beginners-guide-to-server-side-swift-using-vapor-4/

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    //    print(app.directory.workingDirectory)
    //    print(app.directory.publicDirectory)
    //    print(app.directory.resourcesDirectory)
    //    print(app.directory.viewsDirectory)
    //
    //    print("===============")
    //    let variable = Environment.get("EXAMPLE") ?? "undefined"
    //       print(variable)
    //       print(app.environment.name)
    //       print(app.environment.arguments)
    //       print(app.environment.commandInput)
    //
    //       if app.environment.isRelease {
    //           print("production mode")
    //       }
    
    print("===============")
    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database",
        tls: .prefer(try .init(configuration: .clientDefault)))
    ), as: .psql)
    
    app.migrations.add(CreateTodo())
    
    app.views.use(.leaf)
    
    app.middleware.use(
        FileMiddleware(publicDirectory: app.directory.publicDirectory)
    )
    
    app.middleware.use(ExtendPathMiddleware())
    
    // Register the web routes to the App Route
    let routers: [RouteCollection] = [
        WebRouter(),
        BlogRouter(),
    ]
    for router in routers {
        try router.boot(routes: app.routes)
    }
}
