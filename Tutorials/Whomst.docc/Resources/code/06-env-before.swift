// in ContactRowView.swift — body before adapting to Dynamic Type

struct ContactRowView: View {
    let contact: Contact
    let conference: Conference?
    let onToggleFavorite: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            AvatarView(initials: contact.initials, color: contact.avatarColor)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                // ...content...
            }

            Spacer(minLength: 0)
            favoriteButton
        }
        .padding(.vertical, 10)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(combinedLabel)
    }
}
