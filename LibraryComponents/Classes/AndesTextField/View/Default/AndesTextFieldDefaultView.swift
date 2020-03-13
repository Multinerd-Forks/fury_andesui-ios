//
//  AndesTextFieldDefaultView.swift
//  AndesUI
//
//  Created by Martin Damico on 10/03/2020.
//

import Foundation

class AndesTextFieldDefaultView: AndesTextFieldAbstractView {
    override func loadNib() {
        let bundle = AndesBundle.bundle()
        bundle.loadNibNamed("AndesMessageDefaultView", owner: self, options: nil)
    }
}
