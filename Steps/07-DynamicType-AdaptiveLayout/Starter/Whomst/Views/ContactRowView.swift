import SwiftUI

struct ContactRowView: View {
    let contact: Contact
    let conference: Conference?
    let onToggleFavorite: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            AvatarView(initials: contact.initials, color: contact.avatarColor)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(contact.fullName)
                        .font(.headline)
                        .foregroundStyle(.primary)
                    if contact.needsFollowUp {
                        Circle()
                            .fill(.red)
                            .frame(width: 7, height: 7)
                    }
                }

                Text("\(contact.role) · \(contact.company)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)

                if let conference {
                    HStack(spacing: 5) {
                        Image(systemName: "calendar")
                            .font(.caption2)
                            .accessibilityHidden(true)
                        Text("\(conference.shortName) · \(contact.dateMet.formatted(date: .abbreviated, time: .omitted))")
                            .font(.caption)
                    }
                    .foregroundStyle(.tertiary)
                }

                if !contact.tags.isEmpty {
                    HStack(spacing: 4) {
                        ForEach(contact.tags.prefix(3)) { tag in
                            TagPill(tag: tag)
                        }
                    }
                    .padding(.top, 2)
                }
            }

            Spacer(minLength: 0)

            Button(action: onToggleFavorite) {
                Image(systemName: contact.isFavorite ? "star.fill" : "star")
                    .font(.title3)
                    .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
                    .symbolEffect(.bounce, value: contact.isFavorite)
            }
            .buttonStyle(.plain)
            .accessibilityInputLabels(["Favorite", "Star"])
            .accessibilityHidden(true)
        }
        .padding(.vertical, 10)
        .contentShape(.rect)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(combinedLabel)
        .accessibilityAction(named: contact.isFavorite ? "Unfavorite" : "Favorite") {
            onToggleFavorite()
        }
    }

    private var combinedLabel: String {
        var parts: [String] = [contact.fullName]
        if contact.needsFollowUp {
            parts.append("Needs follow-up")
        }
        if contact.isFavorite {
            parts.append("Favorited")
        }
        parts.append("\(contact.role) at \(contact.company)")
        if let conference {
            parts.append("Met at \(conference.shortName) on \(contact.dateMet.formatted(date: .abbreviated, time: .omitted))")
        }
        if !contact.tags.isEmpty {
            parts.append("Tags: \(contact.tags.map(\.rawValue).joined(separator: ", "))")
        }
        return parts.joined(separator: ". ")
    }
}
