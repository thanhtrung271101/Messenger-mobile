//
//  ActiveNowView.swift
//  MessagesClone
//
//  Created by Thành Trung on 14/5/24.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject var viewModel = ActiveNowViewModel()
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 32) {
                ForEach(viewModel.users, id: \.self) {
                    user in
                    NavigationLink(value: Route.chatView(user)) {
                        VStack {
                            ZStack(alignment: .bottomTrailing) {
                                CircularProfileImageView(user: user, size: .large)
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                    Circle()
                                        .fill(Color(.systemGreen))
                                        .frame(width: 12, height: 12)
                                }
                            }
                            Text(user.firstName)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}
