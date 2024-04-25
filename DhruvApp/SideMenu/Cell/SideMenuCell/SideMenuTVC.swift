//
//  SideMenuTVC.swift
//  DhruvApp
//
//  Created by STTL on 23/04/24.
//

import UIKit

class SideMenuTVC: UITableViewCell {

    //Outlets
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbltxtCell: UILabel!
    @IBOutlet weak var viewSeperator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //Configuration Cell Function
    func configCell(data : SideMenuModel){
        lbltxtCell.text = data.name
    }
}
