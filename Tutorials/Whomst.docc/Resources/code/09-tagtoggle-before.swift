// in AddEditContactView.swift: text-only toggle, color is the sole cue

private func tagToggle(_ tag: TagCategory) -> some View {
    let isSelected = selectedTags.contains(tag)
    return Button {
        if isSelected { selectedTags.remove(tag) } else { selectedTags.insert(tag) }
    } label: {
        Text(tag.rawValue)
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(isSelected ? .white : .primary)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .frame(maxWidth: .infinity)
            .background {
                if isSelected {
                    Capsule().fill(tag.color.gradient)
                } else {
                    Capsule().fill(.regularMaterial)
                }
            }
    }
    .buttonStyle(.plain)
}
