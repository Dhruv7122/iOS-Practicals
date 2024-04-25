//
//  MainTVC.swift
//  DhruvApp
//
//  Created by STTL on 18/04/24.
//

import UIKit

class MainTVC: UITableViewCell {

    //OUtlets
    @IBOutlet weak var lblPrac: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        BorderFactory.addBorder(to: lblPrac, cornerRadius: 15.0, borderColor: nil, borderWidth: 0.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Configure Cell Action
    func cellConfig(data:MainModel){
        lblPrac.text = data.name
    }
}
