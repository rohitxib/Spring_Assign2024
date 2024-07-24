//
//  Models.swift
//  Assignment
//
//  Created by Rohit on 24/07/24.
//

import Foundation

// store API Data
struct ApiData: Codable {
    let token: String?
}
// will store employe
struct Employe: Codable {
    let name: String?
    let age: String?
    let adress: String?
    let city: String?

}
