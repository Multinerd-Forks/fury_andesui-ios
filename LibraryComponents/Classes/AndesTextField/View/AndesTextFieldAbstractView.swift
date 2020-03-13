//
//  AndesTextFieldAbstractView.swift
//  AndesUI
//
//  Created by Martin Damico on 12/03/2020.
//

import Foundation

class AndesTextFieldAbstractView: UIView, AndesTextFieldView {
    weak var delegate: AndesTextFieldViewDelegate?

    @IBOutlet var textFieldView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var iconContainerView: UIView!
    @IBOutlet weak var leftPipeView: UIView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var titleToDismissConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleToSafeAreaConstraint: NSLayoutConstraint!

    var config: AndesTextFieldViewConfig
    init(withConfig config: AndesTextFieldViewConfig) {
        self.config = config
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        config = AndesTextFieldViewConfig()
        super.init(coder: coder)
        setup()
    }

    internal func loadNib() {
        fatalError("This should be overriden by a subclass")
    }

    func update(withConfig config: AndesTextFieldViewConfig) {
        self.config = config
        updateView()
    }

    func pinXibViewToSelf() {
        addSubview(textFieldView)
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: textFieldView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: textFieldView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: textFieldView.bottomAnchor).isActive = true
    }

    func setup() {
        loadNib()
        translatesAutoresizingMaskIntoConstraints = false
        pinXibViewToSelf()
        updateView()

        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        textFieldView.clipsToBounds = true
    }

    /// Override this method on each Message View to setup its unique components
    func updateView() {
        self.backgroundColor = config.backgroundColor
        self.leftPipeView.backgroundColor = config.pipeColor

        self.bodyLabel.setAndesStyle(style: config.bodyStyle)
        self.bodyLabel.text = config.bodyText

        self.titleLabel.text = config.titleText

        if config.titleText == nil || config.titleText!.isEmpty {
            titleLabel.isHidden = true
        } else {
            self.titleLabel.setAndesStyle(style: config.titleStyle)
            self.titleLabel.text = config.titleText
            self.titleLabel.isHidden = false
        }

    }
}
