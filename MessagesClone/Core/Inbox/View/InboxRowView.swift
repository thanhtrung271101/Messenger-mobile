//
//  InboxRowView.swift
//  MessagesClone
//
//  Created by Thành Trung on 14/5/24.
//

import SwiftUI

struct InboxRowView: View {
    let message: Message
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: message.user, size: .large)
            VStack(alignment: .leading, spacing: 4) {
                Text(message.user?.fullName ?? "")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(message.messageText)
                    .font(.subheadline)
                    .lineLimit(2)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
        }
        .frame(height: 72)
    }
}

//#Preview {
//    InboxRowView()
//}
