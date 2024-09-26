//
//  ContentViewModel.swift
//  MessagesClone
//
//  Created by Thành Trung on 26/8/24.
//

import Firebase
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {

    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubcribers()
    }

    private func setupSubcribers() {
        AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
    }
}
