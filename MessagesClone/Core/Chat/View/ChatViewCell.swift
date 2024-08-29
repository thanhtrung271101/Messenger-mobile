//
//  ChatViewCell.swift
//  MessagesClone
//
//  Created by Thành Trung on 24/8/24.
//

import SwiftUI

struct ChatViewCell: View {
    let isFromCurrentUser: Bool
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                Text("This is a test message that longer for see the different.")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(Color(.white))
                    .clipShape(ChatBubble(isFromCurrentUser: true))
            }
            else {
                HStack(alignment: .bottom, spacing: 8) {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    Text("This is a test message that longer for see the different.")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundStyle(Color(.black))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                    Spacer()
                }
            }
            
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ChatViewCell(isFromCurrentUser: true)
}
