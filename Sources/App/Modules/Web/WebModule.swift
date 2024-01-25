//
//  File.swift
//  
//
//  Created by Mongy on 25/01/2024.
//

import Vapor

struct WebModule: ModuleInterface {
    let router = WebRouter()
    func boot(
        _ app: Application) throws {
            try router.boot(routes: app.routes)
        }
}
