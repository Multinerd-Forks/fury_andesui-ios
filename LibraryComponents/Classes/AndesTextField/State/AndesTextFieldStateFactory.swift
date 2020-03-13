//
//  AndesTextFieldStateFactory.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

internal class AndesTextFieldStateFactory {
    static func provide(_ state: AndesTextFieldState, forType type: AndesTextFieldTypeProtocol) -> AndesTextFieldStateProtocol {
        switch state {
        case .idle:
            return AndesTextFieldStateIdle(type: type)
        case .error:
            return AndesTextFieldStateIdle(type: type)
        case .disabled:
            return AndesTextFieldStateIdle(type: type)
        case .readOnly:
            return AndesTextFieldStateIdle(type: type)
        }
    }
}
