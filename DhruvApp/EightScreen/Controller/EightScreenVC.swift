//
//  EightScreenVC.swift
//  DhruvApp
//
//  Created by STTL on 16/04/24.
//

import UIKit

class EightScreenVC: UIViewController {


    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //Country Array
    var arrCountry : [String] = ["USA" , "Bahamas","Brazil","Canada","Republic of China","Cuba","Egypt","Fiji","France","Germany","Iceland","India"]
    var searchCountry = [String]()
    
    //Main Action
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCountry = arrCountry
    }
    
    // back Btn Click Action
    @IBAction func btnBackClickAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

// EightScreenVC Extension for Table View and SearchBar
extension EightScreenVC : UITableViewDataSource , UITableViewDelegate{
    
    
    //No. of Rows in Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchCountry.count
        
    }
    
    //Data Of Table Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTVC", for: indexPath) as! TestTVC
        cell.configCell(data: searchCountry[indexPath.row])
        return cell
    }
    
    
    //Leading Swipe Action
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "delete")
        {
            (action,view,completion) in
            self.searchCountry.remove(at: indexPath.row)
            self.arrCountry = self.searchCountry
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        action.title = "Delete"
        action.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    //Trailing Swipe Action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Favorite")
        {
            (action,view,completion) in
            self.searchCountry.remove(at: indexPath.row)
            self.arrCountry = self.searchCountry
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        action.title = "Favorite"
        action.backgroundColor = .systemYellow
        return UISwipeActionsConfiguration(actions: [action])
    }
}

//MARK:- Extension for searchbar Delegate
extension EightScreenVC : UISearchBarDelegate{
    
    //SearchBar Action
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCountry = searchBar.text?.isEmpty ?? true ? arrCountry : searchCountry.filter { $0.lowercased().contains(searchBar.text!.lowercased()) }
        tableView.reloadData()
    }
}
