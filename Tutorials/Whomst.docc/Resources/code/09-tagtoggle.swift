// in AddEditContactView.swift — keep tag selection consistent with TagPill

private func tagToggle(_ tag: TagCategory) -> some View {
    let isSelected = selectedTags.contains(tag)
    return Button {
        if isSelected { selectedTags.remove(tag) } else { selectedTags.insert(tag) }
    } label: {
        HStack(spacing: 6) {
            Image(systemName: tag.symbol)
                .font(.caption.weight(.bold))
                .accessibilityHidden(true)
            Text(tag.rawValue)
                .font(.subheadline.weight(.semibold))
        }
        .foregroundStyle(isSelected ? .white : .primary)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .frame(maxWidth: .infinity)
        .background {
            ZStack {
                if isSelected {
                    Capsule().fill(tag.color.gradient)
                } else {
                    Capsule().fill(.regularMaterial)
                }
                Capsule()
                    .strokeBorder(
                        isSelected ? tag.color : Color.primary.opacity(0.15),
                        lineWidth: isSelected ? 2 : 1
                    )
            }
        }
    }
    .buttonStyle(.plain)
    .accessibilityAddTraits(isSelected ? .isSelected : [])
}
