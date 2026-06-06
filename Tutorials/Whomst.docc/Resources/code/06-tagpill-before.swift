// in Views/Components/TagPill.swift

struct TagPill: View {
    let tag: TagCategory

    var body: some View {
        Text(tag.rawValue)
            .font(.system(size: 12, weight: .semibold))
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(tag.color.gradient, in: Capsule())
    }
}
