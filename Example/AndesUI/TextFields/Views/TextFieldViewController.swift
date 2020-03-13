//
//  TextFieldViewController.swift
//  AndesUI-demoapp
//
//  Created by Martin Damico on 13/03/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import Foundation
import AndesUI

protocol TextFieldView: NSObject {

}

class TextFieldViewController: UIViewController, TextFieldView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textFieldView: AndesTextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var configView: UIView!
    @IBOutlet weak var configToggleButton: AndesButton!
    @IBOutlet weak var updateConfig: AndesButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var primaryActionTextField: UITextField!
    @IBOutlet weak var secondaryActionTextField: UITextField!
    @IBOutlet weak var dismissibleSwitch: UISwitch!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var showAgainBtn: AndesButton!

    var typePicker: UIPickerView = UIPickerView()
    var statePicker: UIPickerView = UIPickerView()
    var type: AndesTextFieldType = .singleLine
    var state: AndesTextFieldState = .idle

    fileprivate func setupCnfigView() {
        configView.isHidden = true
        [titleTextField,
         descTextView].forEach({
            $0!.layer.borderColor = UIColor.lightGray.cgColor
            $0!.layer.borderWidth = 1
         })
    }

    fileprivate func setupBaseMessage() {
        textFieldView.setTitle("message.default.title".localized)
            .setBody("message.default.body".localized)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCnfigView()
        createPickerViews()

        setupBaseMessage()
    }

    func didPressButton() {
        let alert = UIAlertController(title: "message.actions.pressedMsg".localized, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func createPickerViews() {
        stateField.inputView = typePicker
        typePicker.delegate = self
        typePicker.dataSource = self

        typeField.inputView = statePicker
        statePicker.delegate = self
        statePicker.dataSource = self
    }

    @IBAction func showConfigTapped(_ sender: Any) {
        if !self.configView.isHidden {
            self.configToggleButton.setText("message.button.changeConfig".localized)
                .setHierarchy(.quiet)

        } else {
            self.configToggleButton.setText("message.button.hideConfig".localized)
                .setHierarchy(.transparent)
            self.titleTextField.text = textFieldView.title
            self.descTextView.text = textFieldView.body
        }

        UIView.transition(with: configView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.configView.isHidden = !self.configView.isHidden

        }, completion: { _ in

            if self.configView.isHidden {
                self.scrollView.setContentOffset(.zero, animated: true)
            } else {
                self.scrollView.scrollRectToVisible(self.configView.frame, animated: true)
            }
        })
    }

    func validate(body: String, primary: String, secondary: String) -> String? {
        guard !body.isEmpty else {
            return "message.error.emptyBody".localized
        }
        guard secondary.isEmpty || !primary.isEmpty else {
            return "message.error.primaryNotSet".localized
        }
        return nil
    }

    @IBAction func showMsg(_ sender: Any) {
        textFieldView.isHidden = false
        showAgainBtn.isHidden = true
    }

    @IBAction func updateTapped(_ sender: Any) {
        let title = titleTextField.text!
        let body = descTextView.text!
        let primary = primaryActionTextField.text!
        let secondary = secondaryActionTextField.text!
        if let err = validate(body: body, primary: primary, secondary: secondary) {
            errorLabel.text = err
            errorLabel.isHidden = false
            return
        }

        errorLabel.isHidden = true
        textFieldView.isHidden = false
        textFieldView.setTitle(title)
            .setBody(body)
        showConfigTapped(sender)
    }
}

extension TextFieldViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == typePicker {
           stateField.resignFirstResponder()
            self.state = AndesTextFieldState.init(rawValue: row)!
            stateField.text = state.toString()
        }
        if pickerView == statePicker {
            typeField.resignFirstResponder()
            self.type = AndesTextFieldType.init(rawValue: row)!
            typeField.text = type.toString()

        }
    }
}

extension TextFieldViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == typePicker {
            return 2
        }
        if pickerView == statePicker {
            return 4
        }
        return 0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if pickerView == typePicker {
            let type = AndesMessageHierarchy.init(rawValue: row)!
            return type.toString()
        }
        if pickerView == statePicker {
             let state = AndesMessageType.init(rawValue: row)!
            return state.toString()
        }
        return ""
    }
}

extension AndesTextFieldType {
    func toString() -> String {
        switch self {
        case .singleLine:
            return "SingleLine"
        case .multiLine:
            return "MultiLine"
        }
    }
}

extension AndesTextFieldState {
    func toString() -> String {
        switch self {
        case .idle:
            return "Idle"
        case .disabled:
            return "Disabled"
        case .error:
            return "Error"
        case .readOnly:
            return "Read Only"
        }
    }
}
