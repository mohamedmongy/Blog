//
//  File.swift
//  
//
//  Created by Mongy on 16/01/2024.
//

import Vapor
import SwiftSgml

public protocol TemplateRepresentable {
    @TagBuilder
    func render(
        _ req: Request) -> Tag
}
