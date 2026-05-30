// in ContactRowView.swift — replace the red dot with bell.badge.fill

HStack(spacing: 6) {
    Text(contact.fullName)
        .font(.headline)
        .foregroundStyle(.primary)
    if contact.needsFollowUp {
        Image(systemName: "bell.badge.fill")
            .font(.caption)
            .foregroundStyle(.orange)
            .symbolRenderingMode(.hierarchical)
            .accessibilityHidden(true)
    }
}
