// in ContactDetailView.swift: semantic styles throughout

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
            Text(contact.role)
                .font(.system(size: 16))
                .foregroundStyle(.secondary)
            Text(contact.company)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.primary)
        }
    }
}

private struct DetailSection<Content: View>: View {
    let title: String?
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title {
                Text(title.uppercased())
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.secondary)
            }
            content()
        }
    }
}
