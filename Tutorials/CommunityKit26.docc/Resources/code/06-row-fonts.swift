// in ContactRowView.swift — semantic styles instead of literal sizes

private var contentStack: some View {
    VStack(alignment: .leading, spacing: 4) {
        HStack(spacing: 6) {
            Text(contact.fullName)
                .font(.headline)                                  // was .system(size: 16, weight: .semibold)
                .foregroundStyle(.primary)
            if contact.needsFollowUp {
                Circle().fill(.red).frame(width: 7, height: 7)
            }
        }

        Text("\(contact.role) · \(contact.company)")
            .font(.subheadline)                                   // was .system(size: 13)
            .foregroundStyle(.secondary)

        if let conference {
            HStack(spacing: 5) {
                Image(systemName: "calendar")
                    .font(.caption2)                              // was .system(size: 10)
                    .accessibilityHidden(true)
                Text("\(conference.shortName) · \(contact.dateMet.formatted(date: .abbreviated, time: .omitted))")
                    .font(.caption)                               // was .system(size: 11)
            }
            .foregroundStyle(.tertiary)
        }
    }
}

private var favoriteButton: some View {
    Button(action: onToggleFavorite) {
        Image(systemName: contact.isFavorite ? "star.fill" : "star")
            .font(.title3)                                        // was .system(size: 18)
            .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
    }
    .buttonStyle(.plain)
}
