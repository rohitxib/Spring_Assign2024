//
//  LoginVC.swift
//  Assignment
//
//  Created by Rohit on 24/07/24.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnActionLogin(_ sender: Any) {
        // checking for valid email
        guard let name = txtUserName.text, isValidEmail(email: name) else {
            print("please enter user name")
               return
           }
        // i am not appling any password validation
        guard let password = txtPassword.text, password.count > 2 else {
            print("please enter user name")
               return
           }
        
        // Api calling
        callApi(userName: name, password: password)
    }
    
    
}

extension LoginVC{
    
    func callApi(userName: String,password: String){
        let url = URL(string: "https://reqres.in/api/login")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
         request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Serialize HTTP Body data as JSON
        let body = ["email": userName,"password": password]
        do {
            // convert parameters to Data and assign dictionary to httpBody of request
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
          } catch let error {
            print(error.localizedDescription)
            return
          }
        
        request.httpMethod = "POST"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                   print("Error with fetching films: \(error)")
                   return
                 }
                 
                 guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
                   print("Error with the response, unexpected status code: \(response)")
                   return
                 }
            if let data = data{
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode(ApiData.self, from: data) {
                    print(decodedData.token)
                    
                    DispatchQueue.main.async {
                        // storing token for next automatic login
                        UserDefaults.standard.set(decodedData.token, forKey: "TOKEN")
                        
                        let TabbarVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabbarVC")
                        self.navigationController?.pushViewController(TabbarVC, animated: true)                                   }
                }
            }
        }
        task.resume()
        
    }
}
