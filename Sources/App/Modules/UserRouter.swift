//
//  File.swift
//  
//
//  Created by Mongy on 28/01/2024.
//

import Vapor

struct UserRouter: RouteCollection {
    let frontendController = UserFrontendController()
    
    func boot(
        routes: RoutesBuilder
    ) throws {
        routes.get("sign-in", use: frontendController.signInView)
        // req -> UserCredentialsAuthenticator -> frontendController.signInAction
        routes
            .grouped(
                UserCredentialsAuthenticator()
            )
            .post("sign-in", use: frontendController.signInAction) // request -> middleware -> route handlers
        
        
         routes.get("sign-out", use: frontendController.signOut)
    }
}
