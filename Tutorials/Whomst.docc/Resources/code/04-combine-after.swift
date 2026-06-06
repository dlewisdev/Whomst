// in ContactRowView.swift

var body: some View {
    HStack(spacing: 12) {
        AvatarView(initials: contact.initials, color: contact.avatarColor)
            .accessibilityHidden(true)

        VStack(alignment: .leading, spacing: 4) {
            // ...name, role, conference, tags...
        }

        Spacer(minLength: 0)

        Button(action: onToggleFavorite) {
            Image(systemName: contact.isFavorite ? "star.fill" : "star")
                .font(.system(size: 18))
                .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
        }
        .buttonStyle(.plain)
    }
    .padding(.vertical, 10)
    .contentShape(.rect)
    .accessibilityElement(children: .ignore)
    .accessibilityLabel(combinedLabel)
}

private var combinedLabel: String {
    var parts: [String] = [contact.fullName]
    parts.append("\(contact.role) at \(contact.company)")
    if let conference {
        parts.append("Met at \(conference.shortName) on \(contact.dateMet.formatted(date: .abbreviated, time: .omitted))")
    }
    if !contact.tags.isEmpty {
        parts.append("Tags: \(contact.tags.map(\.rawValue).joined(separator: ", "))")
    }
    if contact.needsFollowUp {
        parts.append("Needs follow-up")
    }
    if contact.isFavorite {
        parts.append("Favorited")
    }
    return parts.joined(separator: ". ")
}
