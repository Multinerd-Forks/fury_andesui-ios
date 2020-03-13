//
//  AndesTextFieldView.swift
//  AndesUI
//
//  Created by Martin Damico on 12/03/2020.
//

import Foundation

internal protocol AndesTextFieldView: UIView {
    // expose behaviour to AndesMessage common to all Message Views
    var delegate: AndesTextFieldViewDelegate? { get set }
    func update(withConfig config: AndesTextFieldViewConfig)
}
