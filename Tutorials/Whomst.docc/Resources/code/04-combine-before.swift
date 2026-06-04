// in ContactRowView.swift

var body: some View {
    HStack(spacing: 12) {
        AvatarView(initials: contact.initials, color: contact.avatarColor)
            .accessibilityHidden(true)

        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 6) {
                Text(contact.fullName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.primary)
                if contact.needsFollowUp {
                    Circle().fill(.red).frame(width: 7, height: 7)
                }
            }

            Text("\(contact.role) · \(contact.company)")
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
                .lineLimit(1)

            // ...conference and tags omitted for brevity
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
