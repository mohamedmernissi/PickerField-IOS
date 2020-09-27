//
//  PickerTextField.swift
//  PickerField
//
//  Created by Mohamed Mernissi on 9/25/20.
//  Copyright © 2020 mohamedmernissi. All rights reserved.
//

import UIKit

@objc protocol PickerTextFieldDelegate {
    @objc optional func didSelectDone()
}

class PickerTextField : UITextField {
    
    var pickerdelegate : PickerTextFieldDelegate?
    private var picker = Picker<String>()

    var barButtonTint = UIColor.blue
    var barButtonText = "Ok"
    var data = [String]()
    var selectedValue : String?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)!
    }
    
    func setup(){
        self.tintColor = .clear
        self.picker.data = [self.data]
        picker.source.delegate = self
        self.setPicker(picker)
    }
    
    
    func setPicker(_ inputView : UIView){
        let textField = self
        textField.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)

        textField.inputView = inputView
        if #available(iOS 12.0, *) {
            textField.textContentType = .oneTimeCode
        } else {
            // Fallback on earlier versions
        }

        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = barButtonTint
        toolBar.sizeToFit()

        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: barButtonText, style: .done, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }

    @objc func doneClick() {
        self.endEditing()
    }
    
    func endEditing(){
        if let delegate = pickerdelegate{
            delegate.didSelectDone!()
        }
        else{
            self.endEditing(true)
        }
    }
}

extension PickerTextField : PickerSourceDelegate{
    func didSelectItem(item: String) {
        self.text = item
        self.selectedValue = item
    }
}
