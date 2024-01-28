//
//  File.swift
//  
//
//  Created by Mongy on 23/01/2024.
//

import Vapor

struct BlogPostsContext {
    let icon: String
    let title: String
    let message: String
    let posts: [Blog.Post.List]
}
