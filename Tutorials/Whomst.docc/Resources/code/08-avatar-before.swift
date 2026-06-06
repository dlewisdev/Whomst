// in Views/Components/AvatarView.swift: scale with Dynamic Type

struct AvatarView: View {
    let initials: String
    let color: Color
    var size: CGFloat = 56

    var body: some View {
        Circle()
            .fill(color.gradient)
            .frame(width: size, height: size)
            .overlay {
                Text(initials)
                    .font(.system(size: size * 0.4, weight: .semibold))
                    .foregroundStyle(.white)
            }
            .shadow(color: color.opacity(0.25), radius: 4, y: 2)
    }
}
