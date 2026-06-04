// in ContactRowView.swift: follow-up shown as a bare red dot (color only)

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
