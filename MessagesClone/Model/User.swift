//
//  User.swift
//  MessagesClone
//
//  Created by Thành Trung on 18/8/24.
//

import Foundation
import FirebaseFirestore

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
    var firstName: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullName)
        return components?.givenName ?? fullName
    }
}

extension User {
    static let MOCK_USER = User(
        fullName: "Ramsey Jordan",
        email: "ramseyjordan@gmail.com",
        profileImageUrl: "OnePiece"
    )
}
