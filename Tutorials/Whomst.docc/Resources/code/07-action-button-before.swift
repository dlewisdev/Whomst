// in ContactDetailView.swift: show title text alongside icon at AX sizes

private func actionButton(
    icon: String,
    color: Color,
    title: String,
    label: String,
    action: @escaping () -> Void
) -> some View {
    Button(action: action) {
        Image(systemName: icon)
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.white)
            .frame(width: 52, height: 52)
            .background(color.gradient, in: Circle())
    }
    .buttonStyle(.plain)
    .accessibilityLabel(label)
}
