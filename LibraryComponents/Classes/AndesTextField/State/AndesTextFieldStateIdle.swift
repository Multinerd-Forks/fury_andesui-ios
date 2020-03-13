//
//  AndesTextFieldStateIdle.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation
struct AndesTextFieldStateIdle: AndesTextFieldStateProtocol {

    var textColor: UIColor = AndesStyleSheetManager.styleSheet.textColorWhite

    var backgroundColor: UIColor

    var pipeColor: UIColor

    var accentColor: UIColor

    init(type: AndesTextFieldTypeProtocol) {
        backgroundColor = type.primaryColor
        pipeColor = type.primaryColor
        accentColor = type.secondaryColor
    }
}
