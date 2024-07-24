//
//  HomeVC.swift
//  Assignment
//
//  Created by Rohit on 24/07/24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var tabBar: UITabBar!

    @IBOutlet var viewAddEmploye: UIView!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var city: UITextField!

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAddEmploye.center = self.view.center
        self.view.addSubview(viewAddEmploye)
        if segmentedControl.selectedSegmentIndex == 0{
            viewAddEmploye.isHidden = true
        }
    }
   
    @IBAction func addEmplye(_ sender: Any) {
        guard let name = name.text,!employese.map({$0.name}).contains(name) else {
                        print("please enter  name")
                        return
                    }
        let newEmplye = Employe(name: name, age: age.text, adress: adress.text, city: city.text)
        employese.append(newEmplye)
        self.name.text = ""
        self.age.text = ""
        self.adress.text = ""
        self.city.text = ""

    }
    
    @IBAction func actionSegment(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
            case 0:
            viewAddEmploye.isHidden = true
            print("seg1")
            case 1:
            viewAddEmploye.isHidden = false
            default:
                break
            }
    }
    
}
