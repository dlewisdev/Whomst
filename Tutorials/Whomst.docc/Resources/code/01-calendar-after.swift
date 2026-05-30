// in ContactRowView.swift

if let conference {
    HStack(spacing: 5) {
        Image(systemName: "calendar")
            .font(.system(size: 10))
            .accessibilityHidden(true)
        Text("\(conference.shortName) · \(contact.dateMet.formatted(date: .abbreviated, time: .omitted))")
            .font(.system(size: 11))
    }
    .foregroundStyle(.tertiary)
}
