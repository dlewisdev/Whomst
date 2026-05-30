// in Views/Components/AvatarView.swift — scale with Dynamic Type

struct AvatarView: View {
    let initials: String
    let color: Color
    var baseSize: CGFloat = 56

    @ScaledMetric private var scaleFactor: CGFloat = 1

    private var size: CGFloat { baseSize * scaleFactor }

    var body: some View {
        Circle()
            .fill(color.gradient)
            .frame(width: size, height: size)
            .overlay {
                Text(initials)
                    .font(.system(size: size * 0.4, weight: .semibold))
                    .foregroundStyle(.white)
                    .minimumScaleFactor(0.5)
            }
            .shadow(color: color.opacity(0.25), radius: 4, y: 2)
    }
}
