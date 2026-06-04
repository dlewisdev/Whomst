# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Whomst is a SwiftUI app for tracking conference networking contacts (think CRM, but for the people you meet at iOS dev conferences). Bundle ID `dev.daniellelewis.Whomst`.

The repo is also the source for an **accessibility workshop**: the same app is delivered as a series of progressive snapshots that walk attendees from an inaccessible-but-pretty starter to a fully accessible final state. The root `Whomst/` directory holds the **final fully-accessible** version.

## Repo layout

```
Whomst.xcodeproj         ← always opens the FINAL accessible version
Whomst/                  ← source files for the FINAL version
Steps/                           ← workshop snapshots, one per step
  00-Starter/                    ← original inaccessible starter
  01-VoiceOver-Labelling/{Starter,Finished}/
  02-VoiceControl-InputLabels/{Starter,Finished}/
  03-VoiceOver-TapTargets/{Starter,Finished}/
  04-VoiceOver-Grouping/{Starter,Finished}/
  05-VoiceOver-Sequencing/{Starter,Finished}/
  06-DynamicType-SemanticStyles/{Starter,Finished}/
  07-DynamicType-AdaptiveLayout/{Starter,Finished}/
  08-DynamicType-ScaledMetric/{Starter,Finished}/
  09-Differentiation-BeyondColor/{Starter,Finished}/
Tutorials/Whomst.docc/   ← DocC tutorial catalog (Whomst.tutorial TOC + 9 step .tutorial files)
```

Every `Steps/NN-…/Starter/` is byte-equivalent to the previous step's `Finished/` (or to `00-Starter/` for step 1). Snapshots are produced with `rsync -a --exclude='.git' --exclude='xcuserdata' --exclude='.DS_Store'`. Each snapshot is a complete, openable Xcode project.

## App architecture

Single-screen iOS app (with detail navigation):
- **Models** — `Contact`, `Conference`, `TagCategory`, `ContactStore` (`@Observable`, in-memory, seeded with 12 contacts across 6 conferences)
- **ContactListView** — search + filter chips + list + floating "+" FAB
- **ContactDetailView** — header + quick actions (call/email/LinkedIn/share) + Met-at + Tags + Notes + follow-up toggle
- **AddEditContactView** — `Form` with name, work, conference, tags grid, contact info, notes
- **Components** — `AvatarView`, `TagPill`, `FilterChip`, plus `Color+Background` for cross-platform `appBackground`

Store is created in `WhomstApp` and injected via `.environment(store)` (Observation API, not `EnvironmentObject`).

## Workshop step structure

Each step in `Steps/` adds one accessibility technique on top of the previous:

1. **VoiceOver Labelling** — `.accessibilityLabel`/`Hint` on every icon-only button (star, FAB, edit, share, call, email, LinkedIn); decorative SF Symbols get `.accessibilityHidden(true)`
2. **Voice Control Input Labels** — `.accessibilityInputLabels(_:)` on every icon-only control with short alternative spoken names (`["Favorite", "Star"]`, `["Add", "New contact", "Plus"]`, `["Call", "Phone"]`, etc.) so Voice Control users target controls with brief commands instead of the verbose VoiceOver labels; chains at the call site of `actionButton(...)` rather than threading through the helper
3. **VoiceOver Tap Targets** — restore `NavigationLink(value:)` wrapping around the row (the starter chain navigates via `.onTapGesture` + `@State selectedContact` + `.navigationDestination(item:)`, which is invisible to VoiceOver); using `NavigationLink` brings back the `.isButton` trait, the "double-tap to activate" hint, and a single focus stop per row
4. **VoiceOver Grouping** — `.accessibilityElement(children: .combine)` + composed `.accessibilityLabel` on row and detail header; `.accessibilityAction(named:)` for star
5. **VoiceOver Sequencing** — reorder composed labels (follow-up first); `.accessibilitySortPriority(1)` on FAB
6. **Semantic Text Styles** — replace `.font(.system(size:))` with `.headline`/`.subheadline`/`.body`/`.caption`/etc. (done first so text actually scales, making the later layout/sizing problems visible)
7. **Dynamic Type Adaptive Layout** — `@Environment(\.dynamicTypeSize)`, switch HStack→VStack at `isAccessibilitySize`; `AnyLayout` for the action row
8. **`@ScaledMetric`** — proportional avatar/FAB/action-button sizing
9. **Differentiation Beyond Color** — SF Symbol per `TagCategory`; selected `FilterChip` gets stroke + checkmark + bold + shadow + `.isSelected` trait; follow-up red dot becomes `bell.badge.fill`

When evolving a step, edit `Whomst/` (the live final), then re-snapshot affected step folders so each `Starter` matches the previous `Finished`.

## DocC tutorial

`Tutorials/Whomst.docc/` is a standalone catalog (not part of the app target) with one `.tutorial` file per step plus a `Whomst.tutorial` table of contents organized into three chapters (VoiceOver & Voice Control, Dynamic Type, Differentiation). Estimated time per step: 15–25 minutes; 2.5 hours (150 min) total.

`Resources/code/` holds 51 focused `.swift` snippet files (`01-star-before.swift`, `01-star-after.swift`, etc.) referenced from `@Code(file:)` directives. **These snippets are intentionally non-compiling fragments** — they show only the relevant chunk of a view body or function, with no imports or surrounding type. Claude Code's SourceKit diagnostic system will lint every snippet file as broken Swift; that noise is harmless. The Xcode build target excludes `Tutorials/` entirely, so the snippets never affect the app build.

`Resources/images/` is where screenshots referenced by `@Image(source:)` directives go. Each `.tutorial` references both intro/diagram images (which need to be created in design tooling) and verification screenshots (which can be captured from a built simulator).

To render the tutorial as a navigable site locally, run `xcrun docc convert Tutorials/Whomst.docc --output-path /tmp/ckit-tutorial --hosting-base-path /` and serve the output.

**Publishing is automated.** `.github/workflows/docs.yml` runs on every push to `main` (and via `workflow_dispatch`): it builds the catalog with `--hosting-base-path Whomst --transform-for-static-hosting`, writes an `index.html` that redirects to `/Whomst/tutorials/whomst`, and deploys to GitHub Pages. The CI uses a different `--hosting-base-path` than the local command above — match the workflow's value (`Whomst`) if you're reproducing the published output. The workflow builds **only** the DocC catalog, not the app, so it tolerates the non-compiling snippet fragments.

## Build / Run

Open `Whomst.xcodeproj` in Xcode and run, or from the CLI:

```sh
# iOS Simulator
xcodebuild -project Whomst.xcodeproj -scheme Whomst \
  -destination 'platform=iOS Simulator,name=iPhone 16' build

# macOS
xcodebuild -project Whomst.xcodeproj -scheme Whomst \
  -destination 'platform=macOS' build

# visionOS Simulator
xcodebuild -project Whomst.xcodeproj -scheme Whomst \
  -destination 'platform=visionOS Simulator,name=Apple Vision Pro' build
```

No test target exists yet; add one via Xcode (File → New → Target → Unit Testing Bundle) before writing tests.

To verify a specific workshop step, open `Steps/NN-…/Starter/Whomst.xcodeproj` (or `Finished/`) and build that snapshot independently:

```sh
xcodebuild -project Steps/01-VoiceOver-Labelling/Finished/Whomst.xcodeproj \
  -scheme Whomst -destination 'platform=iOS Simulator,name=iPhone 16' build
```

## Architecture notes that aren't visible from the source files

- **Single multiplatform target.** `SUPPORTED_PLATFORMS = "iphoneos iphonesimulator macosx xros xrsimulator"` with `TARGETED_DEVICE_FAMILY = "1,2,7"`. Platform-specific code should branch on `#if os(iOS)` / `#if os(macOS)` / `#if os(visionOS)` rather than splitting targets.
- **Deployment target is OS 26.4** on all platforms — you can use the latest SwiftUI / Swift 6 APIs without availability guards.
- **Filesystem-synchronized project group** (`PBXFileSystemSynchronizedRootGroup`). Files dropped into `Whomst/` are automatically part of the build — do not hand-edit `project.pbxproj` to add sources.
- **MainActor by default.** `SWIFT_DEFAULT_ACTOR_ISOLATION = MainActor` and `SWIFT_APPROACHABLE_CONCURRENCY = YES`. New types are MainActor-isolated unless explicitly marked `nonisolated` or `actor`. Background work must be moved off-main explicitly.
- **App Sandbox + Hardened Runtime are on**, with `ENABLE_USER_SELECTED_FILES = readonly`. Adding capabilities (network, file write, etc.) requires updating entitlements; there is no `.entitlements` file checked in yet, so Xcode will generate one when you toggle a capability.
- **Info.plist is generated** (`GENERATE_INFOPLIST_FILE = YES`). Add Info.plist keys via build settings (`INFOPLIST_KEY_*`), not a standalone file.
- **String catalogs are the localization format** (`LOCALIZATION_PREFERS_STRING_CATALOGS = YES`, `STRING_CATALOG_GENERATE_SYMBOLS = YES`). Use `String(localized:)` / `LocalizedStringResource`; symbols are generated automatically.
- **Asset symbol extensions are generated** (`ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES`) — reference assets as `Color.accentColor`, `Image(.someAsset)` rather than string literals.
