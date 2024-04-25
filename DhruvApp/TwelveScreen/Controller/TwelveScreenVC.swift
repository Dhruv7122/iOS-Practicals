//
//  TwelveScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 19/04/24.
//

import UIKit

class TwelveScreenVC: UIViewController{

    //Outlets
    @IBOutlet weak var tblEmployeeDetails: UITableView!
    
    //Variables
    var arrSource: [String: [[String: String]]] = [
        "Welcome To STTL": [
            ["name": "Atharv Pandit", "dob": "01-01-2000", "department": "ios"],
            ["name": "Kashyap Patel", "dob": "01-02-2000", "department": "ios"],
            ["name": "Panshul Mistry", "dob": "01-03-2000", "department": "ios"],
            ["name": "Priyal Savaliya", "dob": "01-04-2000", "department": "ios"]
        ]
    ]

    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Extension of SecondScreenVC
extension TwelveScreenVC : UITableViewDataSource,UITableViewDelegate{

    //No. of Sections in Table
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSource.count
    }

    //Header Title for Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(arrSource.keys)[section]
    }

    //No. of rows in Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let section = Array(arrSource.keys)[section]
        return arrSource[section]!.count
    }

    //put values into table cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwelveTVC", for: indexPath) as! TwelveTVC

        if let employees = arrSource["Welcome To STTL"]{
            let employee = employees[indexPath.row]
            if let name = employee["name"],let dob = employee["dob"], let department = employee["department"] , let logoAlpha = employee["name"]?.first{
                cell.configCell(name: name, dob: dob, department: department,logo:String(logoAlpha))
            }
        }
        return cell
    }

}

