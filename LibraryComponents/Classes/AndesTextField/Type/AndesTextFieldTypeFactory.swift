//
//  AndesTextFieldTypeFactory.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation
class AndesTextFieldTypeFactory {
    static func provide(_ type: AndesTextFieldType) -> AndesTextFieldTypeProtocol {
        switch type {
        case .singleLine:
            return AndesTextFieldTypeSingleLine()
        case .multiLine:
            return AndesTextFieldTypeSingleLine()
        }
    }
}
