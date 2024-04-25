//
//  TenScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 17/04/24.
//

import UIKit

class TenScreenVC: UIViewController{

    //Outlets
    @IBOutlet weak var mainCV: UICollectionView!
    @IBOutlet weak var horizontalCV: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    //Variables
    var verticalDatasourceDelegate : VerticalDataSourceDelegate!
    var horizontalDatasourceDelegate : HorizontalDataSourceDelegate!
    var webService = UserWebServices()
    var arrData : [UserModel] = []
    
    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    //Function For Getting Data from JSON to Dictionary
    func getData(){
        webService.getUserList { arr in
            arrData = arr
        }
        setUpCollectionView()
        setUpHorizontalCollectionView()
    }
    
    // Set up Vertical collection View
    func setUpCollectionView() {
        if verticalDatasourceDelegate == nil {
            verticalDatasourceDelegate = .init(arrData: arrData , delegate: self, col: mainCV, vc: self)
        }
    }
    
    // Set up Horizontal collection View
    func setUpHorizontalCollectionView() {
        let width = (horizontalCV.frame.width - 44) / 2.3
        let height = width + 20
        let lineHeight = "abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 14, weight: .regular))
        let finalHeight = height + (lineHeight*2)
        heightConstraint.constant = finalHeight
        if horizontalDatasourceDelegate == nil {
            horizontalDatasourceDelegate = .init(arrData: arrData, delegate: self, col: horizontalCV,vc:self, height: Float(finalHeight))
        }
    }
    
    // Back Btn CLick Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


//MARK:- Extension for ColViewDelegate
extension TenScreenVC: ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        
    }
}
