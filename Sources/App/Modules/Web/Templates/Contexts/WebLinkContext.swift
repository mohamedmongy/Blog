//
//  File.swift
//  
//
//  Created by Mongy on 22/01/2024.
//

import Foundation

public struct WebLinkContext {
    public let label: String
    public let url: String
    public init(
        label: String,
        url: String
    ) {
        self.label = label
        self.url = url
    }
}
