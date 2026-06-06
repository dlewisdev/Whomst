// in ContactListView.swift

ForEach(filteredContacts) { contact in
    NavigationLink(value: contact) {
        ContactRowView(
            contact: contact,
            conference: store.conference(for: contact),
            onToggleFavorite: { store.toggleFavorite(contact) }
        )
        .padding(.horizontal, 20)
    }
    .buttonStyle(.plain)

    if contact.id != filteredContacts.last?.id {
        Divider()
            .padding(.leading, 88)
    }
}
