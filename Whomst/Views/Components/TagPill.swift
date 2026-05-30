import SwiftUI

struct TagPill: View {
    let tag: TagCategory

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: tag.symbol)
                .font(.caption2.weight(.bold))
                .accessibilityHidden(true)
            Text(tag.rawValue)
                .font(.caption.weight(.semibold))
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(tag.color.gradient, in: Capsule())
    }
}
