//
//  File.swift
//  
//
//  Created by Mongy on 31/01/2024.
//

import Vapor

public struct ValidationErrorDetail: Codable {
    public var key: String
    public var message: String
    public init(
        key: String,
        message: String
    ) {
        self.key = key
        self.message = message
    }
}
extension ValidationErrorDetail: Content {}
