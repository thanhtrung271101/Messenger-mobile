//
//  Constant.swift
//  MessagesClone
//
//  Created by Thành Trung on 29/8/24.
//

import Foundation
import FirebaseFirestore

struct FirestoreConstants {
    static let UsersCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
    
}
