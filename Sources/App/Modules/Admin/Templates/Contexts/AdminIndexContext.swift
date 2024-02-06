//
//  File.swift
//  
//
//  Created by Mongy on 06/02/2024.
//

import Vapor

public struct AdminIndexContext {
    public let title: String
    public init(
        title: String
    ) {
        self.title = title
    }
}

