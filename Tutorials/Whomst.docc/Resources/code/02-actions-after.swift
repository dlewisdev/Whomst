// in ContactDetailView.swift

private var actionRow: some View {
    HStack(spacing: 20) {
        if let phone = contact.phone {
            actionButton(
                icon: "phone.fill",
                color: .green,
                label: "Call \(contact.fullName)"
            ) {
                if let url = URL(string: "tel:\(phone.replacingOccurrences(of: " ", with: ""))") {
                    openURL(url)
                }
            }
            .accessibilityInputLabels(["Call", "Phone"])
        }
        if let email = contact.email {
            actionButton(
                icon: "envelope.fill",
                color: .blue,
                label: "Email \(contact.fullName)"
            ) {
                if let url = URL(string: "mailto:\(email)") {
                    openURL(url)
                }
            }
            .accessibilityInputLabels(["Email", "Mail"])
        }
        if let linkedIn = contact.linkedIn {
            actionButton(
                icon: "link",
                color: .indigo,
                label: "Open LinkedIn profile for \(contact.fullName)"
            ) {
                if let url = URL(string: "https://linkedin.com/in/\(linkedIn)") {
                    openURL(url)
                }
            }
            .accessibilityInputLabels(["LinkedIn"])
        }
        actionButton(
            icon: "square.and.arrow.up",
            color: .gray,
            label: "Share contact"
        ) { }
            .accessibilityInputLabels(["Share"])
    }
}

// The actionButton helper itself stays unchanged — input labels chain at each call site.
