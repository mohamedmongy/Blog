//
//  File.swift
//  
//
//  Created by Mongy on 31/01/2024.
//

import Vapor

@resultBuilder
public enum AsyncValidatorBuilder {
    public static func buildBlock(
        _ components: AsyncValidator...
    ) -> [AsyncValidator] {
        components
    }
}
