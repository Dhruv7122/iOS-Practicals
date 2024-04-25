//
//  TwelveTVC.swift
//  DhruvApp
//
//  Created by STTL on 19/04/24.
//

import UIKit

class TwelveTVC: UITableViewCell {

    //Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var lblLogo: UILabel!
    
    //Main Action
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BorderFactory.addBorder(to: lblLogo, cornerRadius: 40.0, borderColor: UIColor.red, borderWidth: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //Configure Cell Action
    func configCell(name:String,dob:String,department:String,logo:String?) {
        lblName.text = name 
        lblDOB.text = dob
        lblDepartment.text = department
        lblLogo.text = logo
    }

}
