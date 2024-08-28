//
//  InboxRowView.swift
//  MessagesClone
//
//  Created by Thành Trung on 14/5/24.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: User.MOCK_USER, size: .large)
            VStack(alignment: .leading, spacing: 4) {
                Text("Bruce Wayne")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("Some text messages for now")
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

#Preview {
    InboxRowView()
}