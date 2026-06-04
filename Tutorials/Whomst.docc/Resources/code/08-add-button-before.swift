// in ContactListView.swift: the add button at a fixed 60-point size

struct ContactListView: View {
    @Environment(ContactStore.self) private var store
    @State private var searchText = ""
    @State private var selectedFilter: ContactFilter = .all
    @State private var showAddContact = false

    // ...

    private var addButton: some View {
        Button {
            showAddContact = true
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 60, height: 60)
                .background(Color.accentColor.gradient, in: Circle())
                .shadow(color: Color.accentColor.opacity(0.35), radius: 10, y: 4)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Add new contact")
        .accessibilitySortPriority(1)
    }
}
