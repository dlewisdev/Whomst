import SwiftUI

struct AddEditContactView: View {
    @Environment(ContactStore.self) private var store
    @Environment(\.dismiss) private var dismiss

    let editingContact: Contact?

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var role = ""
    @State private var company = ""
    @State private var conferenceID: Conference.ID?
    @State private var dateMet: Date = .now
    @State private var notes = ""
    @State private var selectedTags: Set<TagCategory> = []
    @State private var email = ""
    @State private var phone = ""
    @State private var linkedIn = ""
    @State private var needsFollowUp = false

    init(contact: Contact?) {
        self.editingContact = contact
        if let c = contact {
            _firstName = State(initialValue: c.firstName)
            _lastName = State(initialValue: c.lastName)
            _role = State(initialValue: c.role)
            _company = State(initialValue: c.company)
            _conferenceID = State(initialValue: c.conferenceID)
            _dateMet = State(initialValue: c.dateMet)
            _notes = State(initialValue: c.notes)
            _selectedTags = State(initialValue: Set(c.tags))
            _email = State(initialValue: c.email ?? "")
            _phone = State(initialValue: c.phone ?? "")
            _linkedIn = State(initialValue: c.linkedIn ?? "")
            _needsFollowUp = State(initialValue: c.needsFollowUp)
        }
    }

    private var canSave: Bool {
        !firstName.trimmingCharacters(in: .whitespaces).isEmpty && conferenceID != nil
    }

    var body: some View {
        Form {
            Section("Name") {
                TextField("First name", text: $firstName)
                    .textContentType(.givenName)
                TextField("Last name", text: $lastName)
                    .textContentType(.familyName)
            }

            Section("Work") {
                TextField("Role", text: $role)
                    .textContentType(.jobTitle)
                TextField("Company", text: $company)
                    .textContentType(.organizationName)
            }

            Section("Where we met") {
                Picker("Conference", selection: $conferenceID) {
                    Text("Select a conference").tag(Optional<Conference.ID>.none)
                    ForEach(store.conferences) { conf in
                        Text("\(conf.shortName) (\(String(conf.year)))")
                            .tag(Optional(conf.id))
                    }
                }
                DatePicker("Date met", selection: $dateMet, displayedComponents: .date)
            }

            Section("Tags") {
                let columns = [GridItem(.adaptive(minimum: 110), spacing: 8)]
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(TagCategory.allCases) { tag in
                        tagToggle(tag)
                    }
                }
                .padding(.vertical, 4)
            }

            Section("Contact info") {
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                TextField("Phone", text: $phone)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
                TextField("LinkedIn handle", text: $linkedIn)
                    .textInputAutocapitalization(.never)
            }

            Section("Notes") {
                TextField("Add notes", text: $notes, axis: .vertical)
                    .lineLimit(3...8)
            }

            Section {
                Toggle("Needs follow-up", isOn: $needsFollowUp)
            }
        }
        .navigationTitle(editingContact == nil ? "New Contact" : "Edit Contact")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save", action: save)
                    .disabled(!canSave)
            }
        }
    }

    private func tagToggle(_ tag: TagCategory) -> some View {
        let isSelected = selectedTags.contains(tag)
        return Button {
            if isSelected {
                selectedTags.remove(tag)
            } else {
                selectedTags.insert(tag)
            }
        } label: {
            Text(tag.rawValue)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(isSelected ? .white : .primary)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .frame(maxWidth: .infinity)
                .background {
                    if isSelected {
                        Capsule().fill(tag.color.gradient)
                    } else {
                        Capsule().fill(.regularMaterial)
                    }
                }
        }
        .buttonStyle(.plain)
    }

    private func save() {
        guard let conferenceID else { return }
        let saved = Contact(
            id: editingContact?.id ?? UUID(),
            firstName: firstName.trimmingCharacters(in: .whitespaces),
            lastName: lastName.trimmingCharacters(in: .whitespaces),
            role: role.trimmingCharacters(in: .whitespaces),
            company: company.trimmingCharacters(in: .whitespaces),
            conferenceID: conferenceID,
            dateMet: dateMet,
            notes: notes,
            tags: TagCategory.allCases.filter { selectedTags.contains($0) },
            needsFollowUp: needsFollowUp,
            isFavorite: editingContact?.isFavorite ?? false,
            email: email.isEmpty ? nil : email,
            phone: phone.isEmpty ? nil : phone,
            linkedIn: linkedIn.isEmpty ? nil : linkedIn
        )
        if editingContact == nil {
            store.add(saved)
        } else {
            store.update(saved)
        }
        dismiss()
    }
}
