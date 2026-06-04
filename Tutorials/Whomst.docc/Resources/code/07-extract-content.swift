// in ContactRowView.swift: extract reusable content stack

private var contentStack: some View {
    VStack(alignment: .leading, spacing: 4) {
        HStack(spacing: 6) {
            Text(contact.fullName)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.primary)
            if contact.needsFollowUp {
                Circle().fill(.red).frame(width: 7, height: 7)
            }
        }

        Text("\(contact.role) · \(contact.company)")
            .font(.system(size: 13))
            .foregroundStyle(.secondary)
            .lineLimit(dynamicTypeSize.isAccessibilitySize ? nil : 1)

        if let conference {
            // conference + date row
        }
        if !contact.tags.isEmpty {
            tagsRow
        }
    }
}

private var favoriteButton: some View {
    Button(action: onToggleFavorite) {
        Image(systemName: contact.isFavorite ? "star.fill" : "star")
            .font(.system(size: 18))
            .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
    }
    .buttonStyle(.plain)
    .accessibilityHidden(true)
}
