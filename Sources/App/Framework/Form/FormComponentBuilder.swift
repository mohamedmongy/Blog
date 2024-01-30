//
//  File.swift
//  
//
//  Created by Mongy on 29/01/2024.
//

import Vapor

@resultBuilder
public enum FormComponentBuilder {
    public static func buildBlock(
        _ components: FormComponent...
    ) -> [FormComponent] {
        components
    }
}
