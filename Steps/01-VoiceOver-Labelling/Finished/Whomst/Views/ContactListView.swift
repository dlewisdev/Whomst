import SwiftUI

struct ContactListView: View {
    @Environment(ContactStore.self) private var store
    @State private var searchText = ""
    @State private var selectedFilter: ContactFilter = .all
    @State private var showAddContact = false
    @State private var selectedContact: Contact?

    enum ContactFilter: String, CaseIterable, Identifiable {
        case all = "All"
        case favorites = "Favorites"
        case followUp = "Follow-up"
        case recent = "Recent"

        var id: String { rawValue }
    }

    private var filteredContacts: [Contact] {
        var result = store.contacts
        switch selectedFilter {
        case .all:
            break
        case .favorites:
            result = result.filter(\.isFavorite)
        case .followUp:
            result = result.filter(\.needsFollowUp)
        case .recent:
            let cutoff = Calendar.current.date(byAdding: .day, value: -30, to: .now) ?? .now
            result = result.filter { $0.dateMet > cutoff }
        }
        if !searchText.isEmpty {
            let query = searchText.lowercased()
            result = result.filter {
                $0.fullName.lowercased().contains(query) ||
                $0.company.lowercased().contains(query) ||
                $0.role.lowercased().contains(query)
            }
        }
        return result.sorted { $0.dateMet > $1.dateMet }
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            background

            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    filterStrip
                        .padding(.vertical, 10)

                    if filteredContacts.isEmpty {
                        emptyState
                    } else {
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
                        Spacer(minLength: 96)
                    }
                }
            }
            .scrollDismissesKeyboard(.interactively)

            addButton
                .padding(20)
        }
        .navigationTitle("Network")
        .searchable(text: $searchText, prompt: "Search by name, company, or role")
        .navigationDestination(item: $selectedContact) { contact in
            ContactDetailView(contact: contact)
        }
        .sheet(isPresented: $showAddContact) {
            NavigationStack {
                AddEditContactView(contact: nil)
            }
        }
    }

    private var background: some View {
        LinearGradient(
            colors: [Color.appBackground, Color.accentColor.opacity(0.06)],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }

    private var filterStrip: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(ContactFilter.allCases) { filter in
                    FilterChip(
                        title: filter.rawValue,
                        isSelected: selectedFilter == filter
                    ) {
                        withAnimation(.spring(duration: 0.3)) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "person.2.slash")
                .font(.system(size: 48))
                .foregroundStyle(.tertiary)
            Text("No contacts yet")
                .font(.system(size: 18, weight: .semibold))
            Text("Tap the + button to add someone you've met.")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 80)
        .padding(.horizontal, 40)
    }

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
    }
}
