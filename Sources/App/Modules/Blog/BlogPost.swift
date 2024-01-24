//
//  File.swift
//  
//
//  Created by Mongy on 23/01/2024.
//

import Vapor

struct BlogPost: Codable {
    let title: String
    let slug: String
    let image: String
    let excerpt: String
    let date: Date
    let category: String?
    let content: String
}
