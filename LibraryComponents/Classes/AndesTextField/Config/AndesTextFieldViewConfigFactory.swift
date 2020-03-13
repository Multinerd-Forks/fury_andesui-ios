//
//  AndesTextFieldViewConfigFactory.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation
internal class AndesTextFieldViewConfigFactory {
    static func provideConfig(state: AndesTextFieldState, type: AndesTextFieldType, title: String?, body: String) -> AndesTextFieldViewConfig {
        let typeIns = AndesTextFieldTypeFactory.provide(type)
        let stateIns = AndesTextFieldStateFactory.provide(state, forType: typeIns)

        let config = AndesTextFieldViewConfig(backgroundColor: stateIns.backgroundColor,
                                              pipeColor: stateIns.pipeColor,
                                              textColor: stateIns.textColor,
                                              titleText: title,
                                              bodyText: body,
                                              iconBackgroundColor: stateIns.accentColor)

        return config
    }
}
