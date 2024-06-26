//
//  File.swift
//  
//
//  Created by Mongy on 28/01/2024.
//

import Vapor

struct UserFrontendController {
    
    private func renderSignInView(
    _ req: Request,
    _ form: UserLoginForm
    ) -> Response {
        let template = UserLoginTemplate(
            .init(
                icon: "⬇",
                title: "Sign in",
                message: "Please log in with your existing account",
                form: form.render(req: req)
            )
        )
        return req.templates.renderHtml(template)
    }
    
    func signInView(
    _ req: Request
    ) async throws -> Response {
        renderSignInView(req, .init())
    }
    
    func signInAction(
    _ req: Request
    ) async throws -> Response {
        /// the user is authenticated, we can store the user data inside the session too
        if let user = req.auth.get(AuthenticatedUser.self) {
            req.session.authenticate(user)
            return req.redirect(to: "/")
        }
        let form = UserLoginForm()
        try await form.process(req: req)
        let isValid = try await form.validate(req: req)
        if !isValid {
            form.error = "Invalid email or password."
        }
        form.error = "Invalid email or password."
        return renderSignInView(req, form)
    }
    
    func signOut(
    _ req: Request
    ) throws -> Response {
        req.auth.logout(AuthenticatedUser.self)
        req.session.unauthenticate(AuthenticatedUser.self)
        return req.redirect(to: "/")
    }
}
