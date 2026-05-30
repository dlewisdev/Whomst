// in ContactDetailView.swift

private func metAtSection(conference: Conference) -> some View {
    DetailSection(title: "Met at") {
        HStack(spacing: 14) {
            Image(systemName: "calendar.badge.checkmark")
                .font(.system(size: 22))
                .foregroundStyle(Color.accentColor)
                .frame(width: 44, height: 44)
                .background(Color.accentColor.opacity(0.15), in: RoundedRectangle(cornerRadius: 10))
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 2) {
                Text(conference.name)
                    .font(.system(size: 16, weight: .semibold))
                Text("\(conference.location) · \(contact.dateMet.formatted(date: .long, time: .omitted))")
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)
            }
            Spacer(minLength: 0)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(
            "Met at \(conference.name) in \(conference.location) on " +
            "\(contact.dateMet.formatted(date: .long, time: .omitted))"
        )
    }
}
