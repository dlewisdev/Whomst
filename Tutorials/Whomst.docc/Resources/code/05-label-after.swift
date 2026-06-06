// in ContactRowView.swift: reordered: status first, descriptive details last

private var combinedLabel: String {
    var parts: [String] = [contact.fullName]
    if contact.needsFollowUp {
        parts.append("Needs follow-up")
    }
    if contact.isFavorite {
        parts.append("Favorited")
    }
    parts.append("\(contact.role) at \(contact.company)")
    if let conference {
        parts.append("Met at \(conference.shortName) on \(contact.dateMet.formatted(date: .abbreviated, time: .omitted))")
    }
    if !contact.tags.isEmpty {
        parts.append("Tags: \(contact.tags.map(\.rawValue).joined(separator: ", "))")
    }
    return parts.joined(separator: ". ")
}
