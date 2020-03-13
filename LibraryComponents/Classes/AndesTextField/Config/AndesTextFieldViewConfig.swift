//
//  AndesTextFieldViewConfig.swift
//  AndesUI
//
//  Created by Martin Damico on 11/03/2020.
//

import Foundation

/// used to define the ui of internal AndesTextField views
internal struct AndesTextFieldViewConfig {
    var backgroundColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor
    var pipeColor: UIColor = AndesStyleSheetManager.styleSheet.accentColor
    var titleText: String?
    var titleStyle: AndesFontStyle = getTitleStyle(AndesStyleSheetManager.styleSheet.textColorWhite)
    var bodyStyle: AndesFontStyle = getBodyStyle(AndesStyleSheetManager.styleSheet.textColorWhite)
    var bodyText: String?

    init(backgroundColor: UIColor,
         pipeColor: UIColor,
         textColor: UIColor,
         titleText: String?,
         bodyText: String,
         iconBackgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.pipeColor = pipeColor

        titleStyle = AndesTextFieldViewConfig.getTitleStyle(textColor)
        bodyStyle = AndesTextFieldViewConfig.getBodyStyle(textColor)

        self.titleText = titleText
        self.bodyText = bodyText
    }

    init() {

    }

    private static func getTitleStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.semiboldSystemFontOfSize(size: 16), sketchLineHeight: 20)
    }

    private static func getBodyStyle(_ color: UIColor) -> AndesFontStyle {
        return AndesFontStyle(textColor: color, font: AndesStyleSheetManager.styleSheet.regularSystemFont(size: 14), sketchLineHeight: 20)
    }
}
