//
//  File.swift
//  
//
//  Created by Mongy on 29/01/2024.
//

import Vapor

public struct FormContext {
    public var action: FormAction
    public var fields: [TemplateRepresentable]
    public var error: String?
    public var submit: String?
}
