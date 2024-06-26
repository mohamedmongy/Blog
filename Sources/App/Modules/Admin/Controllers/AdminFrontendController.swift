//
//  File.swift
//  
//
//  Created by Mongy on 06/02/2024.
//

import Vapor

struct AdminFrontendController {
    func dashboardView(
        req: Request
    ) throws -> Response {
        let user = try req.auth.require(AuthenticatedUser.self)
        let template = AdminDashboardTemplate(
            .init(
                icon: "👋",
                title: "Dashboard",
                message: "Hello \(user.email), welcome to the CMS."
            )
        )
        return req.templates.renderHtml(template)
    }
}
