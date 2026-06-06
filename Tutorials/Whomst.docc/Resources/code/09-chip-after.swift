// in Views/Components/FilterChip.swift: checkmark, stroke, weight, shadow, isSelected trait

struct FilterChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.caption.weight(.bold))
                        .accessibilityHidden(true)
                }
                Text(title)
                    .font(.subheadline.weight(isSelected ? .bold : .semibold))
            }
            .foregroundStyle(isSelected ? .white : .primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background {
                ZStack {
                    if isSelected {
                        Capsule().fill(Color.accentColor.gradient)
                    } else {
                        Capsule().fill(.regularMaterial)
                    }
                    Capsule()
                        .strokeBorder(
                            isSelected ? Color.accentColor : Color.primary.opacity(0.15),
                            lineWidth: isSelected ? 2 : 1
                        )
                }
            }
            .shadow(color: isSelected ? Color.accentColor.opacity(0.25) : .clear, radius: 6, y: 2)
        }
        .buttonStyle(.plain)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
    }
}
