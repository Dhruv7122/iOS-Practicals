//
//  FourteenScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 26/04/24.
//

import UIKit

class FourteenScreenVC: UIViewController{

    //Outlets
    @IBOutlet weak var viewLogo: UIView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewStdIdContainer: UIView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    @IBOutlet weak var lblLogo: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var lblStudentId: UILabel!
    @IBOutlet weak var lblSportsName: UILabel!
    
    //Variables
    var receivedData : EmployeeModel?
    var fourteenDataSourceDelegate : FourteenDataSourceDelegate!
    var arrData : [EmployeeModel] = []
    
    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //giving attribute to UIViews
        let cornerRad = viewLogo.frame.width / 2
        BorderFactory.addBorder(to: viewLogo, cornerRadius: cornerRad, borderColor: UIColor.red, borderWidth: 1.5)
        BorderFactory.addBorder(to: viewContainer, cornerRadius: 10.0, borderColor: nil, borderWidth: 0.0)
        BorderFactory.addShadow(to: viewContainer, shadowRadius: 10.0, shadowColor: UIColor.black.cgColor, shadowOpacity: 0.2, shadowOffset: CGSize(width: 0, height: 0))
        BorderFactory.addBorder(to: viewStdIdContainer, cornerRadius: 10.0, borderColor: nil, borderWidth: 0.0)
        
        //set Logo Text
        lblLogo.text = String(receivedData!.name.first!)
        lblName.text = receivedData?.name ?? ""
        lblDepartment.text = receivedData?.department ?? ""
        lblStudentId.text = receivedData?.student_id ?? ""
        lblSportsName.text = receivedData?.sports_name ?? ""
        
        // Add observer for content size changes of the table view
        tblView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        setupTblView()
    }
    
    //SetUP Table Aciton
    func setupTblView(){
        if let receivedData = receivedData {
            arrData = [receivedData]
        }
        if fourteenDataSourceDelegate == nil {
            fourteenDataSourceDelegate = .init(arrData: arrData, delegate: self, tbl: tblView)
        }
    }
    
    // Observe changes to the contentSize property
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
            if let newSize = change?[.newKey] as? CGSize {
                // Update the height constraint of the table view
                tblViewHeight.constant = newSize.height
            }
        }
    }
    
    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- FourteenScreenVC Extension
extension FourteenScreenVC : TblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
    }
}
