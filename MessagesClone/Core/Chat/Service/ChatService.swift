//
//  ChatService.swift
//  MessagesClone
//
//  Created by Thành Trung on 29/8/24.
//

import Foundation
import Firebase
import FirebaseAuth

struct ChatService {
    static let messagesCollection = Firestore.firestore().collection("messages")
    
    let chatPartner: User
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let chatPartnetId = chatPartner.id
        
        let currentUserRef = FirestoreConstants.MessagesCollection.document(currentUid).collection(chatPartnetId).document()
        let chatPartnerRef = FirestoreConstants.MessagesCollection.document(chatPartnetId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(
            messageId: messageId,
            fromId: currentUid,
            toId: chatPartnetId,
            messageText: messageText,
            timestamp: Timestamp()
        )
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }
    
    func observeMessages( completion: @escaping([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        let chatPartnerId = chatPartner.id
        
        let query = FirestoreConstants.MessagesCollection
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap({ try? $0.document.data(as: Message.self)})
            
            for( index, message ) in messages.enumerated() where message.fromId != currentUid {
                messages[index].user = chatPartner
            }
            completion(messages)
        }
    }
}
