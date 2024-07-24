//
//  EmployeesVC.swift
//  Assignment
//
//  Created by Rohit on 24/07/24.
//

import UIKit



class EmployeesVC: UIViewController, UITableViewDataSource {
   
    
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tblView.dataSource = self
        registerTableViewCells()
        tblView.rowHeight = 100
    }

    override func viewWillAppear(_ animated: Bool) {
        tblView.reloadData()
    }
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "TableCell",
                                  bundle: nil)
        self.tblView.register(textFieldCell,
                                forCellReuseIdentifier: "TableCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employese.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        cell.name.text = employese[indexPath.row].name
        cell.age.text = employese[indexPath.row].age
        cell.adress.text = employese[indexPath.row].adress
        cell.city.text = employese[indexPath.row].city
       
        return cell
    }
    
}

