//
//  FourteenTVC.swift
//  DhruvApp
//
//  Created by STTL on 29/04/24.
//

import UIKit

class FourteenTVC: UITableViewCell {

    //Outlets
    @IBOutlet weak var lblKey: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var viewSeparator: UIView!
    @IBOutlet weak var constraintWidthCell: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        constraintWidthCell.constant = self.frame.width / 3 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Cell Configuration Action
    func configCell(data:DetailModel){
        lblKey.text = data.key
        lblValue.text = data.value as? String
    }
    
}
