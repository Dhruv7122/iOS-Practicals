//
//  JsonTVC.swift
//  TableView
//
//  Created by STTL on 16/04/24.
//

import UIKit

class JsonTVC: UITableViewCell {

    //Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDob: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var lblLogo: UILabel!
    @IBOutlet weak var viewLogo: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BorderFactory.addBorder(to: lblLogo, cornerRadius: 35.0, borderColor: UIColor.red, borderWidth: 1.0)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //Configuration of Cell
    func configCell(data:EmployeeModel){
        lblName.text = data.name
        lblDob.text = data.dob
        lblDepartment.text = data.department
        lblLogo.text = String(data.name.first!)
    }
}
