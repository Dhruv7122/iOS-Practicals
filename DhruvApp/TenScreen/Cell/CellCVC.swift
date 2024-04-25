//
//  CellCVC.swift
//  DhruvApp
//
//  Created by STTL on 17/04/24.
//

import UIKit

class CellCVC: UICollectionViewCell {

    //Outlets
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        BorderFactory.addBorder(to: viewCell, cornerRadius: 20, borderColor: nil, borderWidth: 0.0)
    }

    //Configuration of Cell
    func configCell(data:UserModel){
        imgUser.image = UIImage(named: data.img)
        lblName.text = data.name
    }
}
