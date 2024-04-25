//
//  ThirteenTVC.swift
//  DhruvApp
//
//  Created by STTL on 22/04/24.
//

import UIKit

class ThirteenTVC: UITableViewCell {

    //Outlets
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    //Main Action
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //Configure Cell
    func configCell(data: TodoModel){
        txtField.text = ""
        txtField.placeholder = "Enter Value"
        lblText.text = data.title
        if data.isEditing{
            lblText.isHidden = true
            btnDelete.isHidden = true
            txtField.isHidden = false
            btnAdd.isHidden = false
        }else{
            txtField.isHidden = true
            btnAdd.isHidden = true
            lblText.isHidden = false
            btnDelete.isHidden = false
        }
    }
}
