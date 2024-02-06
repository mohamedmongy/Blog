//
//  File.swift
//  
//
//  Created by Mongy on 04/02/2024.
//

import Foundation

import Vapor
public extension ByteBuffer {
    var data: Data? {
        getData(at: 0, length: readableBytes)
    }
}
