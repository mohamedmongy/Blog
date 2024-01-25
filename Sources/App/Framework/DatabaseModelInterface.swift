//
//  File.swift
//  
//
//  Created by Mongy on 25/01/2024.
//

import Vapor
import Fluent

public protocol DatabaseModelInterface: Fluent.Model
where Self.IDValue == UUID {
    associatedtype Module: ModuleInterface
    static var identifier: String { get }
}

public extension DatabaseModelInterface {
    static var schema: String {
        Module.identifier + "_" + identifier //  blog_post
    }
    static var identifier: String {
        // Blog - Post - Model
        String(describing: self)
            .dropFirst(Module.identifier.count) // Blog
            .dropLast(5) // Model
            .lowercased() + "s"
        // result -> post , category
    }
}
