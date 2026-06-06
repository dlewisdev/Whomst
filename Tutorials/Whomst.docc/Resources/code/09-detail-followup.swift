// in ContactDetailView.swift: same icon swap, sized for the large title

HStack(spacing: 8) {
    Text(contact.fullName)
        .font(.largeTitle.bold())
    if contact.needsFollowUp {
        Image(systemName: "bell.badge.fill")
            .font(.title3)
            .foregroundStyle(.orange)
            .symbolRenderingMode(.hierarchical)
            .accessibilityHidden(true)
    }
}
