// in ContactDetailView.swift

private func actionButton(
    icon: String,
    color: Color,
    label: String,
    action: @escaping () -> Void
) -> some View {
    Button(action: action) {
        Image(systemName: icon)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.white)
            .frame(width: 52, height: 52)
            .background(color.gradient, in: Circle())
            .shadow(color: color.opacity(0.3), radius: 6, y: 3)
    }
    .buttonStyle(.plain)
    .accessibilityLabel(label)
}
