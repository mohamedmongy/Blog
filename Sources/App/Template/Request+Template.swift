//
//  File.swift
//  
//
//  Created by Mongy on 16/01/2024.
//

import Vapor

public extension Request {
    var templates: TemplateRenderer { .init(self) }
}
