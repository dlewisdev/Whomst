// in Models/TagCategory.swift: add an SF Symbol per category

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
}
