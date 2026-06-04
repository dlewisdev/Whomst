// in ContactRowView.swift: hide the visible star Button so its own label
// isn't pulled into the row's composed announcement.

Button(action: onToggleFavorite) {
    Image(systemName: contact.isFavorite ? "star.fill" : "star")
        .font(.system(size: 18))
        .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
        .symbolEffect(.bounce, value: contact.isFavorite)
}
.buttonStyle(.plain)
.accessibilityHidden(true)
