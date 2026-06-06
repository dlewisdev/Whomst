// in ContactRowView.swift: switch between two layouts

var body: some View {
    Group {
        if dynamicTypeSize.isAccessibilitySize {
            // vertical layout for AX1+
        } else {
            // horizontal layout for default sizes
        }
    }
    .padding(.vertical, 10)
    .contentShape(.rect)
    .accessibilityElement(children: .combine)
    .accessibilityElement(children: .ignore)
    .accessibilityLabel(combinedLabel)
    .accessibilityAction(named: contact.isFavorite ? "Unfavorite" : "Favorite") {
        onToggleFavorite()
    }
}
