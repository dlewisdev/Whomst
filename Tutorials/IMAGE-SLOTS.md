# Image & Video Slots

Production checklist for every media asset in the tutorials. **All assets come from one of three sources — no Figma/Keynote, no hand-drawn diagrams, no photos of code:**

- 📱 **Device** — screen recording / screenshot from a real iPhone (required for Voice Control).
- 🖥️ **Simulator** — screenshot or `simctl` recording. Side-by-side comparisons are two device/sim screenshots placed together.
- 🔍 **Simulator + Accessibility Inspector** — a screenshot (or recording) of the sim next to the Inspector window.

**Code changes are shown with DocC's built-in diff highlighting** via `@Code(file: …, previousFile: …)` — there are no code-screenshot slots.

Status: ✅ uploaded to `Resources/images/` · ⬜ still to shoot.
Media: 🖼️ `@Image` · 🎞️ `@Video` (H.264 `.mp4`; poster optional).

> **Capture-from rule.** Before/problem states come from the step's own `Starter` snapshot; fixed/verify states from its `Finished`. `NN-Starter` is byte-identical to `(NN−1)-Finished`. "Final" shots use `09-Finished` (= root `Whomst.xcodeproj`).

> **Build/deploy.** `xcrun docc convert` succeeds even when slots are unshot (missing resources are warnings, not errors). CI (`.github/workflows/docs.yml`) deploys to GitHub Pages on every push to `main`; the live site is `/Whomst/tutorials/whomst`. Reproduce the CI build locally with the `--fallback-display-name Whomst --fallback-bundle-identifier dev.daniellelewis.Whomst` flags.

---

## Table of contents — `Whomst.tutorial`

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `hero-banner.png` | 🖼️ | ✅ | 🖥️ | `09-Finished` | The contact list — avatars, names, role tags, conference badges. |
| `chapter-voiceover.png` | 🖼️ | ✅ | 🖥️ | `09-Finished`, VO on | A VoiceOver focus rectangle around a contact row. |
| `chapter-dynamictype.png` | 🖼️ | ✅ | 🖥️ | `09-Finished` | Two iPhones: the list at default vs. AX5 Dynamic Type. |
| `chapter-differentiation.png` | 🖼️ | ✅ | 🖥️ | `09-Starter` + `09-Finished` | Two iPhones: color-only tags vs. icons + color. |

---

## Chapter 1 — VoiceOver & Voice Control

### 01 — VoiceOver: Labelling

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `01-intro.png` | 🖼️ | ✅ | 🔍 | `01-Starter` | Inspector: the star's Element "Favorite, Button", Label "Favorite", id `star.fill`. |
| `01-starter-screenshot.png` | 🖼️ | ✅ | 🖥️ | `01-Starter` | The starter contact list. |
| `01-open-project.png` | 🖼️ | ✅ | Xcode | `01-Starter` | Xcode project navigator (Models, Views, Components). |
| `01-voiceover-on.png` | 🖼️ | ⬜ | 🖥️ | `01-Starter`, VO on | The sim with VoiceOver focused on the star. |
| `01-star-label.png` | 🖼️ | ✅ | 🔍 | `01-Starter` | Inspector: the star's Element "Favorite, Button" / Label "Favorite" (before a contextual label). |
| `01-all-labels.mp4` | 🎞️ | ✅ | 🔍 | `01-Finished` | Stepping the Inspector through the detail icon buttons, each label in turn. Poster: `01-all-labels-poster.png`. |
| `01-verify.mp4` | 🎞️ | ✅ | 🔍 | `01-Finished` | Inspector on a row's star showing "Favorite Maya Chen, Button". Poster: `01-verify-poster.png`. |

### 02 — Voice Control: Input Labels

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `02-intro.mp4` | 🎞️ | ✅ | 📱 | `02-Finished`, Voice Control | Show Names overlay appearing over the list. Poster: `02-intro-poster.png`. |
| `02-star-names.png` | 🖼️ | ✅ | 🔍 | `02-Finished` | Inspector: star's label "Favorite Maya Chen" + input labels "Favorite", "Star". |
| `02-fab-names.png` | 🖼️ | ✅ | 🔍 | `02-Finished` | Inspector: Add button's label "Add new contact" + input labels "Add", "New contact", "Plus". |
| `02-actions-names.mp4` | 🎞️ | ✅ | 🔍 | `02-Finished` | Inspector stepping the four action buttons, each label + input labels. (No poster.) |
| `02-verify.png` | 🖼️ | ✅ | 🔍 | `02-Finished` | Inspector: star's label + `accessibilityUserInputLabels` as separate properties. |
| ~~`02-input-labels.png`~~ | — | ❌ removed | — | — | Was a Figma side-by-side; redundant with the Inspector shots above. |

### 03 — VoiceOver: Tap Targets

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `03-intro.mp4` | 🎞️ | ✅ | 🖥️ | `03-Starter`, VO on | VoiceOver stopping on every child element of a row, no Button trait. |
| `03-verify.mp4` | 🎞️ | ⬜ | 🖥️ | `03-Finished`, VO on | A whole row focused as a Button with the activate hint, then a double-tap navigates. Poster: `03-verify-poster.png`. |
| ~~`03-link-vs-tap.png`~~ | — | ❌ removed | — | — | Was a Figma two-column comparison; the concept lives in the bullet list. |
| ~~`03-row-wrap.png`~~ | — | ❌ removed | — | — | Code change → DocC `@Code` auto-diff (`03-row-before` → `03-row-after`). |
| ~~`03-destination.png`~~ | — | ❌ removed | — | — | Code change → DocC `@Code` auto-diff (`03-cleanup-before` → `03-cleanup-after`). |

### 04 — VoiceOver: Grouping

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `04-combine.png` | 🖼️ | ✅ | 🔍 | `04-Finished` | Inspector beside the sim: a focus box around the whole row and its single combined label. |
| `04-custom-action.png` | 🖼️ | ✅ | 🔍 | `04-Finished` | Inspector beside the sim, a rectangular stroke around the new "Favorite" action among the row's other actions. |
| `04-detail-grouping.mp4` | 🎞️ | ✅ | 🔍 | `04-Finished` | Inspector focusing the grouped header (Theo Andersen · Indie Game Developer · Northern Light Games), then the grouped Met-at section (event · city · state · date). No poster. |
| `04-verify.mp4` | 🎞️ | ⬜ | 🖥️ | `04-Finished`, VO on | A row as one stop reading the full composed announcement; swipe-up reveals "Unfavorite". Poster: `04-verify-poster.png`. |
| ~~`04-intro.png`~~ | — | ❌ removed | — | — | Was a Figma focus-stops diagram. Replace with a VO screenshot if you want a hero. |

### 05 — VoiceOver: Sequencing

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `05-verify.mp4` | 🎞️ | ⬜ | 🖥️ | `05-Finished`, VO on | First swipe from the nav title lands on the Add button before chips/list. Poster: `05-verify-poster.png`. |
| ~~`05-intro.png`~~ | — | ❌ removed | — | — | Was a Figma announcement-order diagram. |
| ~~`05-reorder.png`~~ | — | ❌ removed | — | — | Code change → DocC `@Code` auto-diff (`05-label-before` → `05-label-after`). |
| ~~`05-fab-priority.png`~~ | — | ❌ removed | — | — | Was a Figma ZStack diagram. |

---

## Chapter 2 — Dynamic Type

### 06 — Dynamic Type: Adaptive Layout

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `06-intro.png` | 🖼️ | ✅ | 🖥️ | `06-Starter` | Two iPhones: a row fitting at default vs. overflowing at AX5. |
| `06-vertical-layout.png` | 🖼️ | ⬜ | 🖥️ | `06-Finished`, AX size | The accessibility-size row: avatar + star on top, content stacked beneath. |
| `06-detail-adapt.png` | 🖼️ | ⬜ | 🖥️ | `06-Finished`, AX5 | The detail at AX5: action buttons stacked with text labels; Met-at stacked. |
| `06-verify.png` | 🖼️ | ✅ | 🖥️ | `06-Finished`, AX5 | The list at AX5, vertical layout, nothing clipped. |
| ~~`06-dynamictype-scale.png`~~ | — | ❌ removed | — | — | Was a Figma size-scale diagram. |

### 07 — Dynamic Type: ScaledMetric

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `07-intro.png` | 🖼️ | ⬜ | 🖥️ | `07-Starter` + `07-Finished`, AX5 | Two iPhones: tiny unscaled avatar vs. the `@ScaledMetric` avatar grown proportionally. |
| `07-avatar-scaled.png` | 🖼️ | ⬜ | 🖥️ | `07-Finished` | Avatars at xSmall, default, AX5 (three screenshots together). |
| `07-fab-scaled.png` | 🖼️ | ⬜ | 🖥️ | `07-Finished` | The Add button at default vs. AX5. |
| `07-verify.mp4` | 🎞️ | ⬜ | 🖥️ | `07-Finished` | Dragging Dynamic Type while avatar + Add button grow with the text. Poster: `07-verify-poster.png`. |

### 08 — Dynamic Type: Semantic Styles

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `08-sweep.png` | 🖼️ | ⬜ | Xcode | `08-Starter` | Xcode Find Navigator: matches for `.font(.system(`. |
| `08-components.png` | 🖼️ | ⬜ | 🖥️ | `08-Finished` | The TagPill / FilterChip / tag toggles rendered with semantic styles. |
| `08-verify.mp4` | 🎞️ | ⬜ | 🖥️ | `08-Finished` | Dragging Dynamic Type while all text scales together. Poster: `08-verify-poster.png`. |
| ~~`08-intro.png`~~ | — | ❌ removed | — | — | Was a Figma 16pt-vs-.headline diagram. |
| ~~`08-mapping.png`~~ | — | ❌ removed | — | — | Redundant — the size→style mapping is already an inline Markdown table. |

---

## Chapter 3 — Differentiation

### 09 — Differentiation Beyond Color

| Slot | Media | Status | Source | Capture from | Should show |
| --- | --- | --- | --- | --- | --- |
| `09-intro.png` | 🖼️ | ⬜ | 🖥️ | `09-Starter` + `09-Finished` | Tags / chips / follow-up indicators: color-only vs. with shape/icon cues. |
| `09-tags.png` | 🖼️ | ⬜ | 🖥️ | `09-Finished` | Tag pills with an SF Symbol + text label on each capsule. |
| `09-filter.png` | 🖼️ | ⬜ | 🖥️ | `09-Finished` | Filter chips: "All" selected (checkmark, bold, stroke, shadow); others plain. |
| `09-followup.png` | 🖼️ | ⬜ | 🖥️ | `09-Finished` | A row with the red dot replaced by an orange `bell.badge.fill`. |
| `09-verify.png` | 🖼️ | ⬜ | 🖥️ | `09-Finished`, Grayscale on | The list under the Grayscale filter, still distinguishable by shape/weight. |

---

## Capture details

**General**
- **Target:** iPhone 16 simulator for VoiceOver / Dynamic Type / Inspector shots. **Voice Control (`02-intro`) needs a real device** — it isn't in the Simulator.
- **Record:** sim → `xcrun simctl io booted recordVideo --codec=h264 ~/Desktop/<name>.mov`. Device → Control Center Screen Recording or QuickTime "New Movie Recording." Trim in QuickTime. Export **H.264** `.mp4` for cross-browser playback. ⚠️ `02-intro.mp4` is currently **HEVC** (plays in Safari only) — re-export it as H.264. The other uploaded clips are already H.264.
- **Accessibility Inspector:** Xcode → Open Developer Tool → Accessibility Inspector → pick the booted sim → crosshair to inspect an element; it lists `Label`, `Traits`, and `User Input Labels`. Place the Inspector window beside the sim and screenshot/record both.
- **VoiceOver Caption Panel** (if you record VoiceOver instead of the Inspector): Settings → Accessibility → VoiceOver → Caption Panel, so the announcement shows on screen.
- **Posters** are optional; where present they're `*-poster.png`. `02-actions-names` and `03-intro` currently ship without a poster.

**Uploaded so far (✅):** `hero-banner`, all three `chapter-*`, the full `01-*` set, `02-intro`/`02-star-names`/`02-fab-names`/`02-actions-names`/`02-verify`, `03-intro`, `06-intro`, `06-verify`.

**Still to shoot (⬜):** `01-voiceover-on`; `03-verify`; all of `04-*`; `05-verify`; `06-vertical-layout`, `06-detail-adapt`; all of `07-*`; `08-sweep`, `08-components`, `08-verify`; all of `09-*`.

---

## SF Symbol built-in labels — accuracy audit

Every icon-only control in `Steps/00-Starter` (no `.accessibilityLabel`) is announced by its SF Symbol's built-in VoiceOver label — none say a bare "Button". Verified on device:

| Control | SF Symbol | Built-in announcement |
| --- | --- | --- |
| Favorite star | `star` / `star.fill` | "Favorite" |
| Add (FAB) | `plus` | "Add" |
| Edit | `square.and.pencil` | "Compose" |
| Call | `phone.fill` | "Call" |
| Email | `envelope.fill` | "Get Mail" |
| LinkedIn | `link` | "Link" |
| Share | `square.and.arrow.up` | "Share" |

`envelope.fill` → "Get Mail" and `link` → "Link" describe the glyph, not the action — the strongest argument for adding contextual labels in Step 1.
