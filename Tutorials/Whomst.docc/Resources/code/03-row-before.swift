// in ContactListView.swift: the ForEach inside the LazyVStack

ForEach(filteredContacts) { contact in
    ContactRowView(
        contact: contact,
        conference: store.conference(for: contact),
        onToggleFavorite: { store.toggleFavorite(contact) }
    )
    .padding(.horizontal, 20)
    .contentShape(.rect)
    .onTapGesture {
        selectedContact = contact
    }

    if contact.id != filteredContacts.last?.id {
        Divider()
            .padding(.leading, 88)
    }
}
