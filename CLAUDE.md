# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

CommunityKit26 is a SwiftUI app for tracking conference networking contacts (think CRM, but for the people you meet at iOS dev conferences). Bundle ID `dev.daniellelelewis.CommunityKit26`.

The repo is also the source for an **accessibility workshop**: the same app is delivered as a series of progressive snapshots that walk attendees from an inaccessible-but-pretty starter to a fully accessible final state. The root `CommunityKit26/` directory holds the **final fully-accessible** version.

## Repo layout

```
CommunityKit26.xcodeproj         ← always opens the FINAL accessible version
CommunityKit26/                  ← source files for the FINAL version
Steps/                           ← workshop snapshots, one per step
  00-Starter/                    ← original inaccessible starter
  01-VoiceOver-Labelling/{Starter,Finished}/
  02-VoiceOver-Grouping/{Starter,Finished}/
  03-VoiceOver-Sequencing/{Starter,Finished}/
  04-DynamicType-AdaptiveLayout/{Starter,Finished}/
  05-DynamicType-ScaledMetric/{Starter,Finished}/
  06-DynamicType-SemanticStyles/{Starter,Finished}/
  07-Differentiation-BeyondColor/{Starter,Finished}/
Tutorials/CommunityKit26.docc/   ← DocC tutorial catalog (table of contents + 7 .tutorial files)
```

Every `Steps/NN-…/Starter/` is byte-equivalent to the previous step's `Finished/` (or to `00-Starter/` for step 1). Snapshots are produced with `rsync -a --exclude='.git' --exclude='xcuserdata' --exclude='.DS_Store'`. Each snapshot is a complete, openable Xcode project.

## App architecture

Single-screen iOS app (with detail navigation):
- **Models** — `Contact`, `Conference`, `TagCategory`, `ContactStore` (`@Observable`, in-memory, seeded with 12 contacts across 6 conferences)
- **ContactListView** — search + filter chips + list + floating "+" FAB
- **ContactDetailView** — header + quick actions (call/email/LinkedIn/share) + Met-at + Tags + Notes + follow-up toggle
- **AddEditContactView** — `Form` with name, work, conference, tags grid, contact info, notes
- **Components** — `AvatarView`, `TagPill`, `FilterChip`, plus `Color+Background` for cross-platform `appBackground`

Store is created in `CommunityKit26App` and injected via `.environment(store)` (Observation API, not `EnvironmentObject`).

## Workshop step structure

Each step in `Steps/` adds one accessibility technique on top of the previous:

1. **VoiceOver Labelling** — `.accessibilityLabel`/`Hint` on every icon-only button (star, FAB, edit, share, call, email, LinkedIn); decorative SF Symbols get `.accessibilityHidden(true)`
2. **VoiceOver Grouping** — `.accessibilityElement(children: .combine)` + composed `.accessibilityLabel` on row and detail header; `.accessibilityAction(named:)` for star
3. **VoiceOver Sequencing** — reorder composed labels (follow-up first); `.accessibilitySortPriority(1)` on FAB
4. **Dynamic Type Adaptive Layout** — `@Environment(\.dynamicTypeSize)`, switch HStack→VStack at `isAccessibilitySize`; `AnyLayout` for the action row
5. **`@ScaledMetric`** — proportional avatar/FAB/action-button sizing
6. **Semantic Text Styles** — replace `.font(.system(size:))` with `.headline`/`.subheadline`/`.body`/`.caption`/etc.
7. **Differentiation Beyond Color** — SF Symbol per `TagCategory`; selected `FilterChip` gets stroke + checkmark + bold + shadow + `.isSelected` trait; follow-up red dot becomes `bell.badge.fill`

When evolving a step, edit `CommunityKit26/` (the live final), then re-snapshot affected step folders so each `Starter` matches the previous `Finished`.

## DocC tutorial

`Tutorials/CommunityKit26.docc/` is a standalone catalog (not part of the app target) with one `.tutorial` file per step plus a `CommunityKit26.tutorial` table of contents organized into three chapters (VoiceOver, Dynamic Type, Differentiation). Estimated time per step: 8–12 minutes; ~70 min total.

`Resources/code/` holds 41 focused `.swift` snippet files (`01-star-before.swift`, `01-star-after.swift`, etc.) referenced from `@Code(file:)` directives. **These snippets are intentionally non-compiling fragments** — they show only the relevant chunk of a view body or function, with no imports or surrounding type. Claude Code's SourceKit diagnostic system will lint every snippet file as broken Swift; that noise is harmless. The Xcode build target excludes `Tutorials/` entirely, so the snippets never affect the app build.

`Resources/images/` is where screenshots referenced by `@Image(source:)` directives go. Each `.tutorial` references both intro/diagram images (which need to be created in design tooling) and verification screenshots (which can be captured from a built simulator).

To render the tutorial as a navigable site, run `xcrun docc convert Tutorials/CommunityKit26.docc --output-path /tmp/ckit-tutorial --hosting-base-path /` and serve the output.

## Build / Run

Open `CommunityKit26.xcodeproj` in Xcode and run, or from the CLI:

```sh
# iOS Simulator
xcodebuild -project CommunityKit26.xcodeproj -scheme CommunityKit26 \
  -destination 'platform=iOS Simulator,name=iPhone 16' build

# macOS
xcodebuild -project CommunityKit26.xcodeproj -scheme CommunityKit26 \
  -destination 'platform=macOS' build

# visionOS Simulator
xcodebuild -project CommunityKit26.xcodeproj -scheme CommunityKit26 \
  -destination 'platform=visionOS Simulator,name=Apple Vision Pro' build
```

No test target exists yet; add one via Xcode (File → New → Target → Unit Testing Bundle) before writing tests.

To verify a specific workshop step, open `Steps/NN-…/Starter/CommunityKit26.xcodeproj` (or `Finished/`) and build that snapshot independently:

```sh
xcodebuild -project Steps/01-VoiceOver-Labelling/Finished/CommunityKit26.xcodeproj \
  -scheme CommunityKit26 -destination 'platform=iOS Simulator,name=iPhone 16' build
```

## Architecture notes that aren't visible from the source files

- **Single multiplatform target.** `SUPPORTED_PLATFORMS = "iphoneos iphonesimulator macosx xros xrsimulator"` with `TARGETED_DEVICE_FAMILY = "1,2,7"`. Platform-specific code should branch on `#if os(iOS)` / `#if os(macOS)` / `#if os(visionOS)` rather than splitting targets.
- **Deployment target is OS 26.4** on all platforms — you can use the latest SwiftUI / Swift 6 APIs without availability guards.
- **Filesystem-synchronized project group** (`PBXFileSystemSynchronizedRootGroup`). Files dropped into `CommunityKit26/` are automatically part of the build — do not hand-edit `project.pbxproj` to add sources.
- **MainActor by default.** `SWIFT_DEFAULT_ACTOR_ISOLATION = MainActor` and `SWIFT_APPROACHABLE_CONCURRENCY = YES`. New types are MainActor-isolated unless explicitly marked `nonisolated` or `actor`. Background work must be moved off-main explicitly.
- **App Sandbox + Hardened Runtime are on**, with `ENABLE_USER_SELECTED_FILES = readonly`. Adding capabilities (network, file write, etc.) requires updating entitlements; there is no `.entitlements` file checked in yet, so Xcode will generate one when you toggle a capability.
- **Info.plist is generated** (`GENERATE_INFOPLIST_FILE = YES`). Add Info.plist keys via build settings (`INFOPLIST_KEY_*`), not a standalone file.
- **String catalogs are the localization format** (`LOCALIZATION_PREFERS_STRING_CATALOGS = YES`, `STRING_CATALOG_GENERATE_SYMBOLS = YES`). Use `String(localized:)` / `LocalizedStringResource`; symbols are generated automatically.
- **Asset symbol extensions are generated** (`ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES`) — reference assets as `Color.accentColor`, `Image(.someAsset)` rather than string literals.
