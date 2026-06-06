import SwiftUI

@Observable
final class ContactStore {
    var contacts: [Contact]
    var conferences: [Conference]

    init() {
        let kaseya = Conference(id: UUID(), name: "Kaseya Center", shortName: "Kaseya Center", year: 2025, location: "Miami, FL")
        let allStar = Conference(id: UUID(), name: "NBA All-Star Weekend", shortName: "All-Star", year: 2025, location: "San Francisco, CA")
        let metGala = Conference(id: UUID(), name: "The Met Gala", shortName: "Met Gala", year: 2025, location: "New York, NY")
        let finals = Conference(id: UUID(), name: "NBA Finals", shortName: "NBA Finals", year: 2023, location: "Miami, FL")
        let hof = Conference(id: UUID(), name: "Basketball Hall of Fame", shortName: "Hall of Fame", year: 2023, location: "Springfield, MA")

        self.conferences = [kaseya, allStar, metGala, finals, hof]

        let cal = Calendar.current
        func date(_ y: Int, _ m: Int, _ d: Int) -> Date {
            cal.date(from: DateComponents(year: y, month: m, day: d)) ?? .now
        }

        self.contacts = [
            Contact(
                id: UUID(),
                firstName: "Edrice", lastName: "Adebayo",
                role: "Secretary of Defense", company: "Miami Heat",
                conferenceID: kaseya.id, dateMet: date(2025, 3, 14),
                notes: "Guards the rim like it owes him money. Do not, under any circumstances, drive into the paint.",
                tags: [.founder, .speaker],
                needsFollowUp: true, isFavorite: true,
                email: "bam.adebayo@heat.example", phone: "+1 305 555 0113", linkedIn: "bam-adebayo"
            ),
            Contact(
                id: UUID(),
                firstName: "Erik", lastName: "Spoelstra",
                role: "Head Coach", company: "Miami Heat",
                conferenceID: kaseya.id, dateMet: date(2025, 3, 14),
                notes: "Draws up plays on napkins, whiteboards, and your arm if you stand too close. Your favorite coach's favorite coach.",
                tags: [.speaker, .author],
                needsFollowUp: false, isFavorite: true,
                email: "coach.spo@heat.example", phone: "+1 305 555 0117", linkedIn: "erik-spoelstra"
            ),
            Contact(
                id: UUID(),
                firstName: "Dwyane", lastName: "Wade",
                role: "GOAT", company: "Wade Enterprises",
                conferenceID: allStar.id, dateMet: date(2025, 2, 16),
                notes: "Three rings and he will not let you forget a single one.",
                tags: [.founder, .lookingToCollab],
                needsFollowUp: true, isFavorite: true,
                email: "dwyane@wadeenterprises.example", phone: "+1 305 555 0103", linkedIn: "dwyane-wade"
            ),
            Contact(
                id: UUID(),
                firstName: "Mario", lastName: "Chalmers",
                role: "#1 Option", company: "Mario's Gourmet Sauces",
                conferenceID: allStar.id, dateMet: date(2025, 2, 15),
                notes: "Convinced he carried the Big Three. Dares you to argue with him about it.",
                tags: [.founder],
                needsFollowUp: false, isFavorite: false,
                email: "mario@gourmetsauces.example", phone: nil, linkedIn: "mario-chalmers"
            ),
            Contact(
                id: UUID(),
                firstName: "Beyoncé", lastName: "Knowles",
                role: "Your Fave's Fave", company: "Parkwood Entertainment",
                conferenceID: metGala.id, dateMet: date(2025, 5, 5),
                notes: "Does not do follow-up emails, only world tours. When you were little girls you dreamt of being in her world. Don't forget it.",
                tags: [.founder, .speaker],
                needsFollowUp: true, isFavorite: true,
                email: "contact@parkwood.example", phone: nil, linkedIn: "beyonce-knowles"
            ),
            Contact(
                id: UUID(),
                firstName: "Gabrielle", lastName: "Union",
                role: "Main Character", company: "I'll Have Another",
                conferenceID: metGala.id, dateMet: date(2025, 5, 5),
                notes: "Steals every scene she's in and half the ones she isn't.",
                tags: [.author, .speaker],
                needsFollowUp: true, isFavorite: false,
                email: "gabrielle@illhaveanother.example", phone: nil, linkedIn: "gabrielle-union"
            ),
            Contact(
                id: UUID(),
                firstName: "Chris", lastName: "Bosh",
                role: "Stretch 5", company: "Miami Heat",
                conferenceID: hof.id, dateMet: date(2023, 8, 12),
                notes: "Hall of Famer turned coding evangelist. Will explain a zone defense and a for-loop in the same breath.",
                tags: [.engineer, .speaker],
                needsFollowUp: false, isFavorite: true,
                email: "chris.bosh@heat.example", phone: nil, linkedIn: "chris-bosh"
            ),
            Contact(
                id: UUID(),
                firstName: "Alonzo", lastName: "Mourning",
                role: "Chief Culture Carrier", company: "Miami Heat",
                conferenceID: hof.id, dateMet: date(2023, 8, 12),
                notes: "Swatted your layup in 2006 and still won't apologize. Now runs player programs—bring kneepads.",
                tags: [.founder, .speaker],
                needsFollowUp: true, isFavorite: false,
                email: "zo@heat.example", phone: nil, linkedIn: "alonzo-mourning"
            ),
            Contact(
                id: UUID(),
                firstName: "Pat", lastName: "Riley",
                role: "The Godfather", company: "Miami Heat",
                conferenceID: hof.id, dateMet: date(2023, 8, 11),
                notes: "Slicked-back hair, a ring for every finger. Still as fly as ever. Ribbit.",
                tags: [.founder, .speaker],
                needsFollowUp: false, isFavorite: true,
                email: "pat.riley@heat.example", phone: "+1 305 555 0100", linkedIn: "pat-riley"
            ),
            Contact(
                id: UUID(),
                firstName: "Udonis", lastName: "Haslem",
                role: "OG", company: "Miami Heat",
                conferenceID: finals.id, dateMet: date(2023, 6, 1),
                notes: "Twenty years, one team. Miami's heartbeat.",
                tags: [.founder, .speaker],
                needsFollowUp: false, isFavorite: true,
                email: "ud@heat.example", phone: nil, linkedIn: "udonis-haslem"
            ),
            Contact(
                id: UUID(),
                firstName: "Jimmy", lastName: "Butler",
                role: "Him", company: "BIGFACE Coffee",
                conferenceID: finals.id, dateMet: date(2023, 6, 1),
                notes: "Will sell you a $20 cup of coffee, then drop 40 points the same night.",
                tags: [.founder, .speaker],
                needsFollowUp: true, isFavorite: true,
                email: "jimmy@bigfacecoffee.example", phone: nil, linkedIn: "jimmy-butler"
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
