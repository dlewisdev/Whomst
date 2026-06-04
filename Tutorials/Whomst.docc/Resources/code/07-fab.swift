// in ContactListView.swift: scale the add button

struct ContactListView: View {
    @Environment(ContactStore.self) private var store
    @State private var searchText = ""
    @State private var selectedFilter: ContactFilter = .all
    @State private var showAddContact = false
    @ScaledMetric private var fabSize: CGFloat = 60

    // ...

    private var addButton: some View {
        Button {
            showAddContact = true
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: fabSize, height: fabSize)
                .background(Color.accentColor.gradient, in: Circle())
                .shadow(color: Color.accentColor.opacity(0.35), radius: 10, y: 4)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Add new contact")
        .accessibilitySortPriority(1)
    }
}
