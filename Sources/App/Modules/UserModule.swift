//
//  File.swift
//  
//
//  Created by Mongy on 27/01/2024.
//

import Vapor

struct UserModule: ModuleInterface {
    let router = UserRouter()
    
    func boot(
        _ app: Application) throws {
            
            app.migrations.add(UserMigrations.v1())
            app.migrations.add(UserMigrations.seed())
            
            app.middleware.use(UserSessionAuthenticator())
            
            try router.boot(routes: app.routes)
        }
}
