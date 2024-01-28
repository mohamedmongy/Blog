//
//  File.swift
//  
//
//  Created by Mongy on 28/01/2024.
//

import Vapor
import Fluent

struct UserCredentialsAuthenticator: AsyncCredentialsAuthenticator {
    
    struct Credentials: Content {
        let email: String
        let password: String
    }
    
    func authenticate(
        credentials: Credentials,
        for req: Request
    ) async throws {
        guard
            let user = try await UserAccountModel
                .query(on: req.db)
                .filter(\.$email == credentials.email)
                .first()
        else {
            return
        }
        do {
            guard try Bcrypt.verify(
                credentials.password,
                created: user.password
            ) else {
                return
            }
        
            req.auth.login(
                // all the route handlers will have access to this object if nil mean the user not logged in
                AuthenticatedUser(
                    id: user.id!,
                    email: user.email
                )
            )
        }
        catch {
            // do nothing...
        }
    }
}
