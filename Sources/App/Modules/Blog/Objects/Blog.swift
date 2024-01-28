//
//  File.swift
//  
//
//  Created by Mongy on 26/01/2024.
//

import Foundation

enum Blog {
    enum Post {
    }
    enum Category {
    }
}

extension Blog.Post {
    struct List: Codable {
        let id: UUID
        let title: String
        let slug: String
        let image: String
        let excerpt: String
        let date: Date
    }
    
    struct Detail: Codable {
        let id: UUID
        let title: String
        let slug: String
        let image: String
        let excerpt: String
        let date: Date
        let category: Blog.Category.List
        let content: String
    }
}

extension Blog.Category {
    struct List: Codable {
        let id: UUID
        let title: String
    }
}
