//
//  PickerField.swift
//  PickerField
//
//  Created by mohamedmernissi on 9/27/20.
//

import UIKit

class PickerField: UIView {
    
    @IBOutlet var imgDropDown : UIImageView!
    @IBOutlet var txtEdit : PickerTextField!

    @IBInspectable var imageDropDown: UIImage
    {
        get {
            let defaultImage = UIImage(named: "Triangle")
            return imgDropDown.image ?? defaultImage!
        }
        set {
            imgDropDown.image = newValue
        }
    }
    
    @IBInspectable var Placeholder: String
    {
        get {
            return txtEdit.placeholder ?? ""
        }
        set {
            txtEdit.placeholder = newValue
        }
    }
    
    @IBInspectable var barButtonTitle: String
    {
        get {
            return txtEdit.barButtonText
        }
        set {
            txtEdit.barButtonText = newValue
        }
    }
    
    var data = [String]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        txtEdit.data = self.data
    }
    
}
