// in Views/Components/TagPill.swift: text only, color is the sole cue

struct TagPill: View {
    let tag: TagCategory

    var body: some View {
        Text(tag.rawValue)
            .font(.caption.weight(.semibold))
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(tag.color.gradient, in: Capsule())
    }
}
