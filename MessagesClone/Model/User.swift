//
//  User.swift
//  MessagesClone
//
//  Created by Thành Trung on 18/8/24.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName: String
    let email: String
    var profileImageUrl: String?
     
}
 
extension User {
    static let MOCK_USER = User(fullName: "Ramsey Jordan", email: "ramseyjordan@gmail.com", profileImageUrl: "Rams.svg")
}
