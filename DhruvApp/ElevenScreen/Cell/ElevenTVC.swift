//
//  ElevenTVC.swift
//  DhruvApp
//
//  Created by STTL on 18/04/24.
//

import UIKit

class ElevenTVC: UITableViewCell {

    //Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDob: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var imgViewStudent: UIImageView!
    @IBOutlet weak var viewLogo: UIView!
    
    //Main Action
    override func awakeFromNib() {
        super.awakeFromNib()
        let cornerRad = viewLogo.frame.width / 2
        BorderFactory.addBorder(to: imgViewStudent, cornerRadius: cornerRad, borderColor: UIColor.red, borderWidth: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //Cell Configuration Action
    func configCell(data:StudentModel){
        lblName.text = data.name
        lblDob.text = data.dob
        lblDepartment.text = data.department
        imgViewStudent.image = UIImage(named: data.img)
    }
    
}
