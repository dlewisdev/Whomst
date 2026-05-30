import SwiftUI

struct Contact: Identifiable, Hashable {
    let id: UUID
    var firstName: String
    var lastName: String
    var role: String
    var company: String
    var conferenceID: Conference.ID
    var dateMet: Date
    var notes: String
    var tags: [TagCategory]
    var needsFollowUp: Bool
    var isFavorite: Bool
    var email: String?
    var phone: String?
    var linkedIn: String?

    var fullName: String { "\(firstName) \(lastName)" }

    var initials: String {
        let f = firstName.first.map(String.init) ?? ""
        let l = lastName.first.map(String.init) ?? ""
        return (f + l).uppercased()
    }

    var avatarColor: Color {
        let palette: [Color] = [.blue, .purple, .pink, .orange, .teal, .indigo, .green, .red, .brown, .cyan]
        let sum = fullName.unicodeScalars.reduce(0) { $0 + Int($1.value) }
        return palette[sum % palette.count]
    }
}
