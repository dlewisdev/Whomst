// in ContactDetailView.swift: a fixed horizontal action row

private var actionRow: some View {
    HStack(spacing: 20) {
        if let phone = contact.phone {
            actionButton(icon: "phone.fill", color: .green,
                         label: "Call \(contact.fullName)") { /* tel: */ }
        }
        if let email = contact.email {
            actionButton(icon: "envelope.fill", color: .blue,
                         label: "Email \(contact.fullName)") { /* mailto: */ }
        }
        if let linkedIn = contact.linkedIn {
            actionButton(icon: "link", color: .indigo,
                         label: "Open LinkedIn profile for \(contact.fullName)") { /* url */ }
        }
        actionButton(icon: "square.and.arrow.up", color: .gray,
                     label: "Share contact") { }
    }
}
