//
//  File.swift
//  
//
//  Created by Mongy on 29/01/2024.
//

import Vapor

public final class InputField: AbstractFormField<String,
                               InputFieldTemplate
> {
    public convenience init(_ key: String) {
        self.init(
            key: key,
            input: "",
            output: .init(
                .init(
                    key: key
                )
            )
        )
    }
}
