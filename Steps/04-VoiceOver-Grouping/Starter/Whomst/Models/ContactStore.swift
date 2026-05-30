import SwiftUI

@Observable
final class ContactStore {
    var contacts: [Contact]
    var conferences: [Conference]

    init() {
        let wwdc = Conference(id: UUID(), name: "Worldwide Developers Conference", shortName: "WWDC25", year: 2025, location: "Cupertino, CA")
        let trySwift = Conference(id: UUID(), name: "try! Swift Tokyo", shortName: "try! Swift", year: 2026, location: "Tokyo, Japan")
        let appBuilders = Conference(id: UUID(), name: "App Builders", shortName: "App Builders", year: 2024, location: "Lugano, Switzerland")
        let deepDish = Conference(id: UUID(), name: "Deep Dish Swift", shortName: "Deep Dish", year: 2026, location: "Chicago, IL")
        let oneMoreThing = Conference(id: UUID(), name: "One More Thing", shortName: "OMT", year: 2024, location: "Cupertino, CA")
        let happyHour = Conference(id: UUID(), name: "iOSDevHappyHour", shortName: "iOSDevHH", year: 2026, location: "Online")

        self.conferences = [deepDish, trySwift, wwdc, happyHour, oneMoreThing, appBuilders]

        let cal = Calendar.current
        func date(_ y: Int, _ m: Int, _ d: Int) -> Date {
            cal.date(from: DateComponents(year: y, month: m, day: d)) ?? .now
        }

        self.contacts = [
            Contact(
                id: UUID(),
                firstName: "Diego", lastName: "Ramirez",
                role: "Indie Developer", company: "Self-employed",
                conferenceID: deepDish.id, dateMet: date(2026, 4, 24),
                notes: "Built a beautiful habit tracker called Streakly. Open to collaborating on a workshop about indie marketing.",
                tags: [.indie, .lookingToCollab],
                needsFollowUp: true, isFavorite: true,
                email: "hello@diegoramirez.dev", phone: nil, linkedIn: "diegoramirez"
            ),
            Contact(
                id: UUID(),
                firstName: "Theo", lastName: "Andersen",
                role: "Indie Game Developer", company: "Northern Light Games",
                conferenceID: deepDish.id, dateMet: date(2026, 4, 25),
                notes: "Shipped a Game of the Year finalist. Loves talking about Metal performance and shader debugging.",
                tags: [.indie, .founder],
                needsFollowUp: false, isFavorite: false,
                email: "theo@northernlight.games", phone: "+1 312 555 0188", linkedIn: "theoandersen"
            ),
            Contact(
                id: UUID(),
                firstName: "Sam", lastName: "Reilly",
                role: "Developer Advocate", company: "Vapor",
                conferenceID: happyHour.id, dateMet: date(2026, 4, 30),
                notes: "Runs the Vapor Discord. Looking for iOS speakers for their summer summit.",
                tags: [.speaker, .openSource],
                needsFollowUp: false, isFavorite: false,
                email: "sam@vapor.codes", phone: nil, linkedIn: "samreilly"
            ),
            Contact(
                id: UUID(),
                firstName: "Marcus", lastName: "Okonkwo",
                role: "Author & Educator", company: "Self-published",
                conferenceID: trySwift.id, dateMet: date(2026, 3, 27),
                notes: "Wrote 'SwiftUI in Depth'. Speaking on accessibility next year — great resource.",
                tags: [.author, .speaker],
                needsFollowUp: true, isFavorite: false,
                email: "marcus@swiftindepth.com", phone: nil, linkedIn: "marcusokonkwo"
            ),
            Contact(
                id: UUID(),
                firstName: "Yuki", lastName: "Tanaka",
                role: "Open Source Maintainer", company: "Independent",
                conferenceID: trySwift.id, dateMet: date(2026, 3, 28),
                notes: "Core contributor to swift-composable-architecture. Down for code review trades.",
                tags: [.openSource, .engineer],
                needsFollowUp: false, isFavorite: false,
                email: "yuki@tanaka.dev", phone: nil, linkedIn: "yukitanaka"
            ),
            Contact(
                id: UUID(),
                firstName: "Maya", lastName: "Chen",
                role: "Senior iOS Engineer", company: "Mercury",
                conferenceID: wwdc.id, dateMet: date(2025, 6, 9),
                notes: "Working on a SwiftData migration framework. Wants to chat about complex schema migrations and would be open to swapping war stories over coffee.",
                tags: [.engineer, .openSource],
                needsFollowUp: true, isFavorite: true,
                email: "maya@mercury.com", phone: nil, linkedIn: "mayachen"
            ),
            Contact(
                id: UUID(),
                firstName: "Aisha", lastName: "Patel",
                role: "Engineering Manager", company: "Notion",
                conferenceID: wwdc.id, dateMet: date(2025, 6, 10),
                notes: "Hiring iOS engineers for the docs team. Could be a great connect for folks looking to move.",
                tags: [.engineer],
                needsFollowUp: true, isFavorite: false,
                email: "aisha.patel@notion.so", phone: nil, linkedIn: "aishapatel"
            ),
            Contact(
                id: UUID(),
                firstName: "Elena", lastName: "Rossi",
                role: "Staff iOS Engineer", company: "Airbnb",
                conferenceID: wwdc.id, dateMet: date(2025, 6, 11),
                notes: "Leading the migration to Swift 6 strict concurrency. Open to a deep dive call.",
                tags: [.engineer, .speaker],
                needsFollowUp: false, isFavorite: false,
                email: "elena.rossi@airbnb.com", phone: nil, linkedIn: "elenarossi"
            ),
            Contact(
                id: UUID(),
                firstName: "Chloe", lastName: "Kim",
                role: "Design Lead", company: "Figma",
                conferenceID: oneMoreThing.id, dateMet: date(2024, 11, 9),
                notes: "Heading up the new Sites product. Wants iOS designer referrals.",
                tags: [.designer, .lookingToCollab],
                needsFollowUp: true, isFavorite: true,
                email: "chloe@figma.com", phone: nil, linkedIn: "chloekim"
            ),
            Contact(
                id: UUID(),
                firstName: "Sofia", lastName: "Almeida",
                role: "Senior Product Designer", company: "Linear",
                conferenceID: oneMoreThing.id, dateMet: date(2024, 11, 8),
                notes: "Pioneered the new Cycles UI. Always interested in motion design feedback.",
                tags: [.designer],
                needsFollowUp: false, isFavorite: true,
                email: "sofia@linear.app", phone: nil, linkedIn: "sofiaalmeida"
            ),
            Contact(
                id: UUID(),
                firstName: "Jonas", lastName: "Werner",
                role: "AVFoundation Specialist", company: "Soundwave Labs",
                conferenceID: appBuilders.id, dateMet: date(2024, 5, 7),
                notes: "Gave a fantastic talk on real-time audio processing in Swift. Knows everything about audio units.",
                tags: [.engineer, .speaker],
                needsFollowUp: false, isFavorite: false,
                email: "jonas@soundwave.io", phone: "+41 79 555 0142", linkedIn: "jonaswerner"
            ),
            Contact(
                id: UUID(),
                firstName: "Priya", lastName: "Sundaram",
                role: "Senior PM", company: "GitHub",
                conferenceID: appBuilders.id, dateMet: date(2024, 5, 8),
                notes: "Owns the Mobile experience PM portfolio. Interested in collaborating on dev tooling research.",
                tags: [.productManager],
                needsFollowUp: true, isFavorite: false,
                email: "priya@github.com", phone: nil, linkedIn: "priyasundaram"
            ),
        ]
    }

    func conference(for contact: Contact) -> Conference? {
        conferences.first { $0.id == contact.conferenceID }
    }

    func toggleFavorite(_ contact: Contact) {
        guard let idx = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        contacts[idx].isFavorite.toggle()
    }

    func toggleFollowUp(_ contact: Contact) {
        guard let idx = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        contacts[idx].needsFollowUp.toggle()
    }

    func add(_ contact: Contact) {
        contacts.insert(contact, at: 0)
    }

    func update(_ contact: Contact) {
        guard let idx = contacts.firstIndex(where: { $0.id == contact.id }) else { return }
        contacts[idx] = contact
    }

    func delete(_ contact: Contact) {
        contacts.removeAll { $0.id == contact.id }
    }
}
