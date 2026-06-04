// in ContactListView.swift: scale the add button

struct ContactListView: View {
    @Environment(ContactStore.self) private var store
    @State private var searchText = ""
    @State private var selectedFilter: ContactFilter = .all
    @State private var showAddContact = false
    @ScaledMetric private var addButtonSize: CGFloat = 60

    // ...

    private var addButton: some View {
        Button {
            showAddContact = true
        } label: {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .fontWeight(.bold)
                .frame(width: addButtonSize * 0.4, height: addButtonSize * 0.4)
                .foregroundStyle(.white)
                .frame(width: addButtonSize, height: addButtonSize)
                .background(Color.accentColor.gradient, in: Circle())
                .shadow(color: Color.accentColor.opacity(0.35), radius: 10, y: 4)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Add new contact")
        .accessibilitySortPriority(1)
    }
}
