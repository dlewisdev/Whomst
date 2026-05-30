// in ContactListView.swift

@State private var searchText = ""
@State private var selectedFilter: ContactFilter = .all
@State private var showAddContact = false

// ... later, in the body's modifier chain:

.navigationDestination(for: Contact.self) { contact in
    ContactDetailView(contact: contact)
}
