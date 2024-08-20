import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    var body: some View {
        VStack {
            // Header
            VStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color(.black))

                    }
                }
                Text(user.fullName)
                    .font(.title)
                    .bold()
                Divider()
            }
            
            // List
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(option.imageBackgroundColor)
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                Section {
                    Button ("Logout") {
                    }
                    Button ("Delete my account!") {
                    }
                }
                .foregroundStyle(Color(.red))
            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER)
}
