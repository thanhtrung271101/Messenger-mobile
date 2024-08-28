//
//  ChatView.swift
//  MessagesClone
//
//  Created by Thành Trung on 22/8/24.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    let user: User
    var body: some View {
        ScrollView {
            // header
            VStack {
                CircularProfileImageView(user: user, size: .xxLarge)
                VStack(spacing: 4) {
                    Text(user.fullName)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Message")
                        .font(.footnote)
                        .foregroundStyle(Color(.gray))
                    
                }
            }
            
            // message
            
            ForEach(0...15, id: \.self) { user in
                ChatViewCell(isFromCurrentUser: Bool.random())
            }
            
            
        }
        Spacer()
        // message input view
        ZStack(alignment: .trailing) {
            TextField("Message...", text: $messageText, axis: .vertical)
                .padding(12)
                .padding(.trailing, 48)
                .background(Color(.systemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .font(.subheadline)
            Button(action: {print("Send message...")}, label: {
                Text("Send")
                    .font(.subheadline)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            })
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
