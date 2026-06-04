// in ContactRowView.swift

var body: some View {
    HStack(spacing: 12) {
        AvatarView(initials: contact.initials, color: contact.avatarColor)
            .accessibilityHidden(true)

        VStack(alignment: .leading, spacing: 4) {
            // ...name, role, conference, tags...
        }

        Spacer(minLength: 0)

        Button(action: onToggleFavorite) {
            Image(systemName: contact.isFavorite ? "star.fill" : "star")
                .font(.system(size: 18))
                .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(
            contact.isFavorite
                ? "Unfavorite \(contact.fullName)"
                : "Favorite \(contact.fullName)"
        )
    }
    .padding(.vertical, 10)
    .contentShape(.rect)
}
