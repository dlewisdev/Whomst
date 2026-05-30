// in ContactDetailView.swift — show title text alongside icon at AX sizes

private func actionButton(
    icon: String,
    color: Color,
    title: String,
    label: String,
    action: @escaping () -> Void
) -> some View {
    Button(action: action) {
        if dynamicTypeSize.isAccessibilitySize {
            HStack(spacing: 14) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(width: 52, height: 52)
                    .background(color.gradient, in: Circle())
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(.primary)
                Spacer(minLength: 0)
            }
        } else {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: 52, height: 52)
                .background(color.gradient, in: Circle())
        }
    }
    .buttonStyle(.plain)
    .accessibilityLabel(label)
}
