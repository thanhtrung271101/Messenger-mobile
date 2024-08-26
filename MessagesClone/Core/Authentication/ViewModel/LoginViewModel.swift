//
//  LoginViewModel.swift
//  MessagesClone
//
//  Created by Thành Trung on 24/8/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
