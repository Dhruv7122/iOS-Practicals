//
//  TestTVCTableViewCell.swift
//  TableView
//
//  Created by STTL on 15/04/24.
//

import UIKit

class TestTVC: UITableViewCell {

    //Outlets
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Set Value to Label
    func configCell(data:String){
        lblName.text = data
    }

}
