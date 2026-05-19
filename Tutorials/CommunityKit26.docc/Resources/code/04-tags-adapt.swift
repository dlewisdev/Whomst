// in ContactRowView.swift — adapt tags row to wrap vertically at AX sizes

@ViewBuilder
private var tagsRow: some View {
    if dynamicTypeSize.isAccessibilitySize {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(contact.tags.prefix(3)) { tag in
                TagPill(tag: tag)
            }
        }
        .padding(.top, 2)
    } else {
        HStack(spacing: 4) {
            ForEach(contact.tags.prefix(3)) { tag in
                TagPill(tag: tag)
            }
        }
        .padding(.top, 2)
    }
}
