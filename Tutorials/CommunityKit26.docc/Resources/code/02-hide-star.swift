// in ContactRowView.swift — hide the visible star Button from accessibility
// so the .combine modifier doesn't include it as a child element.

Button(action: onToggleFavorite) {
    Image(systemName: contact.isFavorite ? "star.fill" : "star")
        .font(.system(size: 18))
        .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
        .symbolEffect(.bounce, value: contact.isFavorite)
}
.buttonStyle(.plain)
.accessibilityHidden(true)
