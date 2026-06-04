// in ContactListView.swift

@State private var searchText = ""
@State private var selectedFilter: ContactFilter = .all
@State private var showAddContact = false
@State private var selectedContact: Contact?

// ... later, in the body's modifier chain:

.navigationDestination(item: $selectedContact) { contact in
    ContactDetailView(contact: contact)
}
