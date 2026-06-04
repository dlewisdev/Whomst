// in ContactDetailView.swift: follow-up shown as a bare red dot (color only)

HStack(spacing: 8) {
    Text(contact.fullName)
        .font(.largeTitle.bold())
    if contact.needsFollowUp {
        Circle()
            .fill(.red)
            .frame(width: 10, height: 10)
    }
}
