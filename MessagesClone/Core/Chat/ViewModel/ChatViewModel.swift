//
//  ChatViewModel.swift
//  MessagesClone
//
//  Created by Thành Trung on 29/8/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        observeMessages()
    }
    
    func observeMessages() {
        MessageService.observeMessages(chatPartner: user) { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
