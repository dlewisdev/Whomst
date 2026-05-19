// in ContactRowView.swift — switch between two layouts

var body: some View {
    Group {
        if dynamicTypeSize.isAccessibilitySize {
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 12) {
                    AvatarView(initials: contact.initials, color: contact.avatarColor)
                        .accessibilityHidden(true)
                    Spacer(minLength: 0)
                    favoriteButton
                }
                contentStack
            }
        } else {
            HStack(spacing: 12) {
                AvatarView(initials: contact.initials, color: contact.avatarColor)
                    .accessibilityHidden(true)
                contentStack
                Spacer(minLength: 0)
                favoriteButton
            }
        }
    }
    .padding(.vertical, 10)
    .contentShape(.rect)
    .accessibilityElement(children: .combine)
    .accessibilityLabel(combinedLabel)
    .accessibilityAction(named: contact.isFavorite ? "Unfavorite" : "Favorite") {
        onToggleFavorite()
    }
}
