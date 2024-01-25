import NIOSSL
import Fluent
import FluentPostgresDriver
import FluentSQLiteDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // https://theswiftdev.com/beginners-guide-to-server-side-swift-using-vapor-4/
    
//    app.databases.use(DatabaseConfigurationFactory.postgres(configuration: .init(
//        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
//        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? SQLPostgresConfiguration.ianaPortNumber,
//        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
//        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
//        database: Environment.get("DATABASE_NAME") ?? "vapor_database",
//        tls: .prefer(try .init(configuration: .clientDefault)))
//    ), as: .psql)
    
    let dbPath = app.directory.resourcesDirectory + "db.sqlite"
    app.databases.use(.sqlite(.file(dbPath)), as: .sqlite)
        
    app.middleware.use(
        FileMiddleware(publicDirectory: app.directory.publicDirectory)
    )
    
    app.middleware.use(ExtendPathMiddleware())
    ///
    /// Register  routes to the App Route
    /// Register the  db migration
    ///
    let modules: [ModuleInterface] = [
        WebModule(),
        BlogModule(),
    ]
    for module in modules {
        try module.boot(app)
    }
    
    /// run the migration after app start
    try await app.autoMigrate().get()
}
