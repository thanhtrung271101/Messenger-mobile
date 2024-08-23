//
//  User.swift
//  MessagesClone
//
//  Created by Thành Trung on 18/8/24.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable, Hashable {
    var id = UUID().uuidString
    let fullName: String
    let email: String
    var profileImageUrl: String?
    
    var profileImage: Image? {
        guard let imageName = profileImageUrl else { return nil }
        return Image(imageName)
    }
}

extension User {
    static let MOCK_USER = User(
        fullName: "Ramsey Jordan",
        email: "ramseyjordan@gmail.com",
        profileImageUrl: "OnePiece"
    )
}
