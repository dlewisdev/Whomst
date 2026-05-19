// in ContactDetailView.swift — update the call site to use baseSize

private var header: some View {
    VStack(spacing: 12) {
        AvatarView(initials: contact.initials, color: contact.avatarColor, baseSize: 96)
            .padding(.top, 8)
            .accessibilityHidden(true)

        // ...rest of header...
    }
}
