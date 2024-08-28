//
//  NewMessageView.swift
//  MessagesClone
//
//  Created by Thành Trung on 14/5/24.
//

import SwiftUI

struct NewMessageView: View {
    @State private var  searchText = ""
    @StateObject private var viewModel = NewMessageViewModel()
    @Binding var selectedUser: User?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ScrollView() {
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                Text("CONTACT")
                    .foregroundStyle(.gray)
                    .font(.footnote)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding()
                ForEach(viewModel.users, id: \.self) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: user, size: .small)
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding(.leading)
                        Divider()
                            .padding(.leading, 40)
                    }
                    .onTapGesture {
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar() {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                }
        }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewMessageView(selectedUser: .constant(User.MOCK_USER))
        }
    }
}
