// in ContactRowView.swift

Button(action: onToggleFavorite) {
    Image(systemName: contact.isFavorite ? "star.fill" : "star")
        .font(.system(size: 18))
        .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
        .symbolEffect(.bounce, value: contact.isFavorite)
}
.buttonStyle(.plain)
