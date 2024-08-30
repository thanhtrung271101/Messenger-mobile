//
//  ChatView.swift
//  MessagesClone
//
//  Created by Thành Trung on 22/8/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    var body: some View {
        VStack {
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
                
                LazyVStack {
                    ForEach(viewModel.messages) { message in
                        ChatViewCell(message: message)
                    }
                }
                
                
            }
            Spacer()
            // message input view
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .font(.subheadline)
                Button {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                } label: {
                    Text("Send")
                        .font(.subheadline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(user.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
