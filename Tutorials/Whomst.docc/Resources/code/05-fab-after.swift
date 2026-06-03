// in ContactListView.swift — bump VoiceOver order so the add button reads before the list

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
    .accessibilityHint("Opens a form to add someone you've met")
    .accessibilitySortPriority(1)
}
