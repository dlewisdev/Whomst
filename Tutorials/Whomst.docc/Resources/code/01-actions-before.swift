// in ContactDetailView.swift

private var actionRow: some View {
    HStack(spacing: 20) {
        if let phone = contact.phone {
            actionButton(icon: "phone.fill", color: .green) {
                if let url = URL(string: "tel:\(phone.replacingOccurrences(of: " ", with: ""))") {
                    openURL(url)
                }
            }
        }
        if let email = contact.email {
            actionButton(icon: "envelope.fill", color: .blue) {
                if let url = URL(string: "mailto:\(email)") {
                    openURL(url)
                }
            }
        }
        if let linkedIn = contact.linkedIn {
            actionButton(icon: "link", color: .indigo) {
                if let url = URL(string: "https://linkedin.com/in/\(linkedIn)") {
                    openURL(url)
                }
            }
        }
        actionButton(icon: "square.and.arrow.up", color: .gray) { }
    }
}

private func actionButton(
    icon: String,
    color: Color,
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
}
