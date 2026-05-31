// in ContactListView.swift — make the FAB's plus icon scale too

private var addButton: some View {
    Button {
        showAddContact = true
    } label: {
        Image(systemName: "plus")
            .font(.title2.bold())                             // was .system(size: 22, weight: .bold)
            .foregroundStyle(.white)
            .frame(width: fabSize, height: fabSize)
            .background(Color.accentColor.gradient, in: Circle())
            .shadow(color: Color.accentColor.opacity(0.35), radius: 10, y: 4)
    }
    .buttonStyle(.plain)
    .accessibilityLabel("Add new contact")
    .accessibilityHint("Opens a form to add someone you've met")
    .accessibilityInputLabels(["Add", "New contact", "Plus"])
    .accessibilitySortPriority(1)
}
