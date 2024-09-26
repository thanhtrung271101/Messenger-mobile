//
//  SettingsOptionViewModel.swift
//  MessagesClone
//
//  Created by Thành Trung on 15/8/24.
//

import SwiftUI

enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {

    case darkMode
    case activeStatus
    case accessibility
    case privacyAndSafety
    case notifications

    var title: String {
        switch self {
        case .darkMode: return "Dark Mode"
        case .activeStatus: return "Active Status"
        case .accessibility: return "Accessibility"
        case .privacyAndSafety: return "Privacy and Safety"
        case .notifications: return "Notifications"
        }
    }

    var imageName: String {
        switch self {
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .privacyAndSafety: return "lock.circle.fill"
        case .notifications: return "bell.circle.fill"
        }
    }

    var imageBackgroundColor: Color {
        switch self {
        case .darkMode: return .black
        case .activeStatus: return Color(.systemGreen)
        case .accessibility: return .black
        case .privacyAndSafety: return Color(.systemBlue)
        case .notifications: return Color(.systemPurple)
        }
    }

    var id: Int { return self.rawValue}
}
