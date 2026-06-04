// in ContactDetailView.swift: scale the action buttons and Met-at icon

struct ContactDetailView: View {
    @Environment(ContactStore.self) private var store
    @Environment(\.openURL) private var openURL
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    let initialContact: Contact
    @State private var isEditing = false

    // ...inside actionButton:
    //   .frame(width: 52, height: 52)

    // ...inside metAtSection:
    //   .frame(width: 44, height: 44)
}
