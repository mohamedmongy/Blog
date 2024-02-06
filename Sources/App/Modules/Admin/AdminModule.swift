//
//  File.swift
//  
//
//  Created by Mongy on 06/02/2024.
//

import Vapor

struct AdminModule: ModuleInterface {
    let router = AdminRouter()
    
    func boot(
        _ app: Application) throws {
            try router.boot(routes: app.routes)
        }
}
