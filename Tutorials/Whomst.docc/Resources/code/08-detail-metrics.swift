// in ContactDetailView.swift: scale the action buttons and Met-at icon

struct ContactDetailView: View {
    @Environment(ContactStore.self) private var store
    @Environment(\.openURL) private var openURL
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    let initialContact: Contact
    @State private var isEditing = false
    @ScaledMetric private var actionButtonSize: CGFloat = 52
    @ScaledMetric private var metAtIconSize: CGFloat = 44

    // ...inside actionButton:
    //   .frame(width: actionButtonSize, height: actionButtonSize)

    // ...inside metAtSection:
    //   .frame(width: metAtIconSize, height: metAtIconSize)
}
