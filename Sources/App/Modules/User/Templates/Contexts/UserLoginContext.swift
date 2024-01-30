//
//  File.swift
//  
//
//  Created by Mongy on 28/01/2024.
//

import Vapor

struct UserLoginContext {
    let icon: String
    let title: String
    let message: String
    let form: TemplateRepresentable
    
    init(
        icon: String,
        title: String,
        message: String,
        form: TemplateRepresentable
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.form = form
    }
}
