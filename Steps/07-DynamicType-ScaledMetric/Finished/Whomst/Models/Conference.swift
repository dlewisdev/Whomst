import Foundation

struct Conference: Identifiable, Hashable {
    let id: UUID
    var name: String
    var shortName: String
    var year: Int
    var location: String
}
