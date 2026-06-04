// in ContactRowView.swift: read the user's Dynamic Type setting

struct ContactRowView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    let contact: Contact
    let conference: Conference?
    let onToggleFavorite: () -> Void

    var body: some View {
        Group {
            if dynamicTypeSize.isAccessibilitySize {
                // vertical layout for AX1+
            } else {
                // horizontal layout for default sizes
            }
        }
        .padding(.vertical, 10)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(combinedLabel)
    }
}
