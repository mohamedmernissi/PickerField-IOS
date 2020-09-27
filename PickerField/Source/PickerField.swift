//
//  PickerField.swift
//  PickerField
//
//  Created by mohamedmernissi on 9/27/20.
//

import UIKit

class PickerField: UIView {
    
    @IBOutlet var imgDropDown : UIImageView!
    @IBOutlet var txtPicker : PickerTextField!

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
            return txtPicker.placeholder ?? ""
        }
        set {
            txtPicker.placeholder = newValue
        }
    }
    
    @IBInspectable var barButtonTitle: String
    {
        get {
            return txtPicker.barButtonText
        }
        set {
            txtPicker.barButtonText = newValue
        }
    }
    
    var selectedValue : String?{
        get{
            return self.txtPicker.selectedValue
        }
    }
    
    
    var data = [String]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        txtPicker.data = self.data
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
}
