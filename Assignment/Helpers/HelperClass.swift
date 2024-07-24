//
//  HelperClass.swift
//  Assignment
//
//  Created by Rohit on 24/07/24.
//

import Foundation

var employese = [Employe]() // store temporary employe 

func isValidEmail(email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

