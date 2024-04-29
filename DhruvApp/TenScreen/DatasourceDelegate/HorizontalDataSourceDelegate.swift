//
//  HorizontalDatasourceDelegate.swift
//  DhruvApp
//  purpose : Set up Table View
//  Created by STTL on 19/04/24.
//

import Foundation

import UIKit

class HorizontalDataSourceDelegate: NSObject {
    
    //Datatype Alias
    typealias T = UserModel
    typealias col = UICollectionView
    typealias del = ColViewDelegate
    typealias vc = UIViewController
    
    //Variables
    internal var height: Float
    internal var arrSource: [T]
    internal var colvw: col
    internal var delegate: del
    internal weak var vc:vc?
    
    //Variables with Declaration
    let kNumberOfItemsInOneRow: CGFloat = 2
    let kEdgeInset:CGFloat = 16
    let minimumInterItemandLinespacing:CGFloat = 12
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: ColViewDelegate, col: UICollectionView,vc:vc, height: Float) {
        arrSource = arrData
        colvw = col
        self.height = height
        self.delegate = delegate
        self.vc = vc
        super.init()
        setupCol()
    }
    
    //Setup Collection View
    fileprivate func setupCol(){
        
        let nib = UINib(nibName: "CellCVC", bundle: nil)
        colvw.register(nib, forCellWithReuseIdentifier: "CellCVC")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
    }
    
    //Reload Collection View
    func reload(arr:[T]){
        arrSource = arr
        colvw.reloadData()
    }
}

//MARK:- Collection View Delegate Extension
extension HorizontalDataSourceDelegate:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelect(colView: colvw, indexPath: indexPath)
    }
    
}

//MARK:- Collection View Datasource Extension
extension HorizontalDataSourceDelegate:UICollectionViewDataSource {
    
    //No. of Items in Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    //Set value of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCVC", for: indexPath) as! CellCVC
        BorderFactory.addShadow(to: cell,shadowRadius: 7.0, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.2, shadowOffset: CGSize(width: 0, height: 0))
        cell.configCell(data: arrSource[indexPath.row])
        return cell
    }
}


//MARK:- UICollectionViewDelegateFlowLayout Methods
extension HorizontalDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    //Minimum Line Spacing For Section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    //Minimum Spacng Between Items
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    //Size of an Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 44) / 2.3
        return .init(width: width, height: CGFloat(height))
    }
    
    //Whole Section Padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: kEdgeInset, left: kEdgeInset, bottom: kEdgeInset, right: kEdgeInset)
    }
}
