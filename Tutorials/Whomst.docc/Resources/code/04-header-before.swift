// in ContactDetailView.swift: the header before grouping (five separate elements)

private var header: some View {
    VStack(spacing: 12) {
        AvatarView(initials: contact.initials, color: contact.avatarColor, size: 96)
            .padding(.top, 8)
            .accessibilityHidden(true)

        VStack(spacing: 4) {
            HStack(spacing: 8) {
                Text(contact.fullName)
                    .font(.system(size: 28, weight: .bold))
                if contact.needsFollowUp {
                    Circle().fill(.red).frame(width: 10, height: 10)
                }
            }
            Text(contact.role).foregroundStyle(.secondary)
            Text(contact.company).font(.system(size: 16, weight: .semibold))
        }
    }
    .frame(maxWidth: .infinity)
}
