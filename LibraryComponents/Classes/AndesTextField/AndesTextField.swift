//
//  AndesTextField.swift
//  AndesUI
//
//  Created by Martin Damico on 10/03/2020.
//

import UIKit

@objc public class AndesTextField: UIView {
    internal var contentView: AndesTextFieldDefaultView!
    /// returns the current state
     public private(set) var state: AndesTextFieldState = .idle

    /// returns the current type
     public private(set) var type: AndesTextFieldType = .singleLine

    /// returns the current title
    public private(set) var title: String?

    /// returns the current message body
    public private(set) var body: String = ""

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @objc public init(state: AndesTextFieldState, type: AndesTextFieldType, title: String, body: String) {
        super.init(frame: .zero)
        self.title = title
        self.body = body
        self.state = state
        self.type = type
        setup()
    }

    private func drawContentView(with newView: AndesTextFieldDefaultView) {
        self.contentView = newView
        contentView.delegate = self
        addSubview(contentView)
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        }
        updateContentView()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        drawContentView(with: provideView())
    }

    private func updateContentView() {
        let config = AndesTextFieldViewConfigFactory.provideConfig(state: self.state, type: self.type, title: self.title, body: self.body)
        contentView.update(withConfig: config)
    }

    /// Sets the title of the AndesMessage
    /// - Parameter title: string
    @objc @discardableResult public func setTitle(_ title: String?) -> AndesTextField {
        self.title = title
        updateContentView()
        return self
    }

    /// Sets the body of the AndesMessage
    /// - Parameter body: message body
    @objc @discardableResult public func setBody(_ body: String) -> AndesTextField {
        self.body = body
        updateContentView()
        return self
    }

    /// Sets the style of the message
    /// - Parameter hierarchy: options defined in AndesMessageHierarchy
    @objc @discardableResult public func setHierarchy(_ state: AndesTextFieldState) -> AndesTextField {
        self.state = state
        updateContentView()
        return self
    }

    /// Sets the colors/icon of the message
    /// - Parameter type: defined in AndesMessageType
    @objc @discardableResult public func setType(_ type: AndesTextFieldType) -> AndesTextField {
        self.type = type
        updateContentView()
        return self
    }

    /// Should return a view depending on which textfield variant is selected
    private func provideView() -> AndesTextFieldDefaultView {
        let config = AndesTextFieldViewConfigFactory.provideConfig(state: self.state, type: self.type, title: self.title, body: self.body)

        if true {
            return AndesTextFieldDefaultView(withConfig: config)
        } else if true {
            return AndesTextFieldDefaultView(withConfig: config)
        } else if true {
            return AndesTextFieldDefaultView(withConfig: config)
        }
    }
}

extension AndesTextField: AndesTextFieldViewDelegate {
}
