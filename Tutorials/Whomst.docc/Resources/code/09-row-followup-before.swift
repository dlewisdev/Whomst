// in ContactRowView.swift: replace the red dot with bell.badge.fill

HStack(spacing: 6) {
    Text(contact.fullName)
        .font(.headline)
        .foregroundStyle(.primary)
    if contact.needsFollowUp {
        Circle()
            .fill(.red)
            .frame(width: 7, height: 7)
    }
}
