// in ContactRowView.swift: final state, composed label + custom favorite action

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
        }
        .buttonStyle(.plain)
        .accessibilityHidden(true)
    }
    .padding(.vertical, 10)
    .contentShape(.rect)
    .accessibilityLabel(combinedLabel)
    .accessibilityAction(named: contact.isFavorite ? "Unfavorite" : "Favorite") {
        onToggleFavorite()
    }
}
