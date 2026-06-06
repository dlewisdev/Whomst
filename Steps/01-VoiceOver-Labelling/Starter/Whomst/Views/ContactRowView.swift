import SwiftUI

struct ContactRowView: View {
    let contact: Contact
    let conference: Conference?
    let onToggleFavorite: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            AvatarView(initials: contact.initials, color: contact.avatarColor)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Text(contact.fullName)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.primary)
                    if contact.needsFollowUp {
                        Circle()
                            .fill(.red)
                            .frame(width: 7, height: 7)
                    }
                }

                Text("\(contact.role) · \(contact.company)")
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)

                if let conference {
                    HStack(spacing: 5) {
                        Image(systemName: "calendar")
                            .font(.system(size: 10))
                        Text("\(conference.shortName) · \(contact.dateMet.formatted(date: .abbreviated, time: .omitted))")
                            .font(.system(size: 11))
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
                    .font(.system(size: 18))
                    .foregroundStyle(contact.isFavorite ? .yellow : .secondary)
                    .symbolEffect(.bounce, value: contact.isFavorite)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 10)
        .contentShape(.rect)
    }
}
