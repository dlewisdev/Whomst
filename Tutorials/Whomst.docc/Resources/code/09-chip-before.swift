// in Views/Components/FilterChip.swift — color-only selection state

struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(isSelected ? .white : .primary)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background {
                    if isSelected {
                        Capsule().fill(Color.accentColor.gradient)
                    } else {
                        Capsule().fill(.regularMaterial)
                    }
                }
        }
        .buttonStyle(.plain)
    }
}
