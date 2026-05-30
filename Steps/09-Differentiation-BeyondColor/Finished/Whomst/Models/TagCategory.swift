import SwiftUI

enum TagCategory: String, CaseIterable, Hashable, Identifiable {
    case engineer = "Engineer"
    case designer = "Designer"
    case productManager = "PM"
    case founder = "Founder"
    case speaker = "Speaker"
    case author = "Author"
    case indie = "Indie"
    case openSource = "Open Source"
    case lookingToCollab = "Looking to Collab"

    var id: String { rawValue }

    var color: Color {
        switch self {
        case .engineer: .blue
        case .designer: .pink
        case .productManager: .purple
        case .founder: .orange
        case .speaker: .teal
        case .author: .indigo
        case .indie: .green
        case .openSource: .cyan
        case .lookingToCollab: .red
        }
    }

    var symbol: String {
        switch self {
        case .engineer: "hammer.fill"
        case .designer: "paintpalette.fill"
        case .productManager: "chart.bar.fill"
        case .founder: "building.2.fill"
        case .speaker: "mic.fill"
        case .author: "book.fill"
        case .indie: "person.fill"
        case .openSource: "chevron.left.forwardslash.chevron.right"
        case .lookingToCollab: "handshake.fill"
        }
    }
}
