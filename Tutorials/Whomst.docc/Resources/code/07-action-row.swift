// in ContactDetailView.swift: switch HStack/VStack via AnyLayout

@Environment(\.dynamicTypeSize) private var dynamicTypeSize

private var actionRow: some View {
    let layout = dynamicTypeSize.isAccessibilitySize
        ? AnyLayout(VStackLayout(spacing: 12))
        : AnyLayout(HStackLayout(spacing: 20))

    return layout {
        if let phone = contact.phone {
            actionButton(icon: "phone.fill", color: .green, title: "Call",
                         label: "Call \(contact.fullName)") { /* tel: */ }
        }
        if let email = contact.email {
            actionButton(icon: "envelope.fill", color: .blue, title: "Email",
                         label: "Email \(contact.fullName)") { /* mailto: */ }
        }
        if let linkedIn = contact.linkedIn {
            actionButton(icon: "link", color: .indigo, title: "LinkedIn",
                         label: "Open LinkedIn profile for \(contact.fullName)") { /* url */ }
        }
        actionButton(icon: "square.and.arrow.up", color: .gray, title: "Share",
                     label: "Share contact") { }
    }
}
