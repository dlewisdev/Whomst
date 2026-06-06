// in ContactDetailView.swift: same icon swap, sized for the large title

HStack(spacing: 8) {
    Text(contact.fullName)
        .font(.largeTitle.bold())
    if contact.needsFollowUp {
        Circle()
            .fill(.red)
            .frame(width: 10, height: 10)
    }
}
