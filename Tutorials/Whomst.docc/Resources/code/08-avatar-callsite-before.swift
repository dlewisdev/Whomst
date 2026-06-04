// in ContactDetailView.swift: the call site still passes the old `size:` label

private var header: some View {
    VStack(spacing: 12) {
        AvatarView(initials: contact.initials, color: contact.avatarColor, size: 96)
            .padding(.top, 8)
            .accessibilityHidden(true)

        // ...rest of header...
    }
}
