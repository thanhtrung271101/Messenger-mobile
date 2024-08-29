//
//  ChatViewModel.swift
//  MessagesClone
//
//  Created by Thành Trung on 29/8/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messageText = ""
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessage() {
        MessageService.sendMessage(messageText, toUser: user)
    }
}
