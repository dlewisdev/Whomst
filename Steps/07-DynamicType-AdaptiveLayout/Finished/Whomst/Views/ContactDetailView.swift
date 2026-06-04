import SwiftUI

struct ContactDetailView: View {
    @Environment(ContactStore.self) private var store
    @Environment(\.openURL) private var openURL
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    let initialContact: Contact
    @State private var isEditing = false

    init(contact: Contact) {
        self.initialContact = contact
    }

    private var contact: Contact {
        store.contacts.first { $0.id == initialContact.id } ?? initialContact
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                header
                actionRow
                if let conference = store.conference(for: contact) {
                    metAtSection(conference: conference)
                }
                if !contact.tags.isEmpty {
                    tagsSection
                }
                if !contact.notes.isEmpty {
                    notesSection
                }
                followUpSection
            }
            .padding(20)
        }
        .background {
            LinearGradient(
                colors: [Color.appBackground, Color.accentColor.opacity(0.06)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    store.toggleFavorite(contact)
                } label: {
                    Image(systemName: contact.isFavorite ? "star.fill" : "star")
                        .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
                        .symbolEffect(.bounce, value: contact.isFavorite)
                }
                .accessibilityLabel(contact.isFavorite ? "Unfavorite \(contact.fullName)" : "Favorite \(contact.fullName)")
                .accessibilityInputLabels(["Favorite", "Star"])
            }
            ToolbarItem(placement: .primaryAction) {
                Button {
                    isEditing = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }
                .accessibilityLabel("Edit \(contact.fullName)")
                .accessibilityInputLabels(["Edit"])
            }
        }
        .sheet(isPresented: $isEditing) {
            NavigationStack {
                AddEditContactView(contact: contact)
            }
        }
    }

    private var header: some View {
        VStack(spacing: 12) {
            AvatarView(initials: contact.initials, color: contact.avatarColor, size: 96)
                .padding(.top, 8)
                .accessibilityHidden(true)

            VStack(spacing: 4) {
                HStack(spacing: 8) {
                    Text(contact.fullName)
                        .font(.largeTitle.bold())
                    if contact.needsFollowUp {
                        Circle()
                            .fill(.red)
                            .frame(width: 10, height: 10)
                    }
                }
                Text(contact.role)
                    .font(.body)
                    .foregroundStyle(.secondary)
                Text(contact.company)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(.primary)
            }
        }
        .frame(maxWidth: .infinity)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(headerLabel)
        .accessibilityAddTraits(.isHeader)
    }

    private var headerLabel: String {
        var parts: [String] = [contact.fullName]
        if contact.needsFollowUp {
            parts.append("Needs follow-up")
        }
        parts.append("\(contact.role) at \(contact.company)")
        return parts.joined(separator: ". ")
    }

    private var actionRow: some View {
        let layout = dynamicTypeSize.isAccessibilitySize
            ? AnyLayout(VStackLayout(spacing: 12))
            : AnyLayout(HStackLayout(spacing: 20))
        return layout {
            if let phone = contact.phone {
                actionButton(icon: "phone.fill", color: .green, title: "Call", label: "Call \(contact.fullName)") {
                    if let url = URL(string: "tel:\(phone.replacingOccurrences(of: " ", with: ""))") {
                        openURL(url)
                    }
                }
                .accessibilityInputLabels(["Call", "Phone"])
            }
            if let email = contact.email {
                actionButton(icon: "envelope.fill", color: .blue, title: "Email", label: "Email \(contact.fullName)") {
                    if let url = URL(string: "mailto:\(email)") {
                        openURL(url)
                    }
                }
                .accessibilityInputLabels(["Email", "Mail"])
            }
            if let linkedIn = contact.linkedIn {
                actionButton(icon: "link", color: .indigo, title: "LinkedIn", label: "Open LinkedIn profile for \(contact.fullName)") {
                    if let url = URL(string: "https://linkedin.com/in/\(linkedIn)") {
                        openURL(url)
                    }
                }
                .accessibilityInputLabels(["LinkedIn"])
            }
            actionButton(icon: "square.and.arrow.up", color: .gray, title: "Share", label: "Share contact") { }
            .accessibilityInputLabels(["Share"])
        }
    }

    private func actionButton(icon: String, color: Color, title: String, label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            if dynamicTypeSize.isAccessibilitySize {
                HStack(spacing: 14) {
                    Image(systemName: icon)
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(.white)
                        .frame(width: 52, height: 52)
                        .background(color.gradient, in: Circle())
                        .shadow(color: color.opacity(0.3), radius: 6, y: 3)
                    Text(title)
                        .font(.body.weight(.semibold))
                        .foregroundStyle(.primary)
                    Spacer(minLength: 0)
                }
            } else {
                Image(systemName: icon)
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)
                    .frame(width: 52, height: 52)
                    .background(color.gradient, in: Circle())
                    .shadow(color: color.opacity(0.3), radius: 6, y: 3)
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel(label)
    }

    private func metAtSection(conference: Conference) -> some View {
        DetailSection(title: "Met at") {
            adaptiveStack {
                Image(systemName: "calendar.badge.checkmark")
                    .font(.title2)
                    .foregroundStyle(Color.accentColor)
                    .frame(width: 44, height: 44)
                    .background(Color.accentColor.opacity(0.15), in: RoundedRectangle(cornerRadius: 10))
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 2) {
                    Text(conference.name)
                        .font(.headline)
                    Text("\(conference.location) · \(contact.dateMet.formatted(date: .long, time: .omitted))")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                if !dynamicTypeSize.isAccessibilitySize {
                    Spacer(minLength: 0)
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Met at \(conference.name) in \(conference.location) on \(contact.dateMet.formatted(date: .long, time: .omitted))")
        }
    }

    @ViewBuilder
    private func adaptiveStack<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        if dynamicTypeSize.isAccessibilitySize {
            VStack(alignment: .leading, spacing: 12, content: content)
        } else {
            HStack(alignment: .center, spacing: 14, content: content)
        }
    }

    private var tagsSection: some View {
        DetailSection(title: "Tags") {
            HStack(spacing: 6) {
                ForEach(contact.tags) { tag in
                    TagPill(tag: tag)
                }
                Spacer(minLength: 0)
            }
        }
    }

    private var notesSection: some View {
        DetailSection(title: "Notes") {
            Text(contact.notes)
                .font(.body)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var followUpSection: some View {
        DetailSection(title: nil) {
            Toggle(isOn: Binding(
                get: { contact.needsFollowUp },
                set: { _ in store.toggleFollowUp(contact) }
            )) {
                HStack(spacing: 10) {
                    Image(systemName: "bell.badge.fill")
                        .foregroundStyle(.orange)
                        .accessibilityHidden(true)
                    Text("Needs follow-up")
                        .font(.body.weight(.semibold))
                }
            }
        }
    }
}

private struct DetailSection<Content: View>: View {
    let title: String?
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title {
                Text(title.uppercased())
                    .font(.caption.weight(.bold))
                    .foregroundStyle(.secondary)
                    .tracking(0.6)
                    .padding(.leading, 4)
            }
            content()
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 16))
        }
    }
}
