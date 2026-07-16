# Water This Plant — Project Context

> A Flutter demo social-impact content platform. A plant-themed metaphor for collective growth — every scroll, like, share, and donation helps a cause flourish.
> **Tagline:** *Where Every Scroll Creates Impact*

---

## Tech Stack

| Layer | Choice |
|---|---|
| Framework | Flutter 3.44.0 (stable) |
| Language | Dart 3.12.0 |
| Font | JetBrains Mono (via `google_fonts`) |
| State Mgmt | `setState` + local state (no external state lib) |
| Navigation | `Navigator.push` / `pushReplacement` / `IndexedStack` |
| Backend | **None** — all data is hardcoded in `mock_data.dart` |

---

## Project Structure

```
lib/
├── main.dart                          # Entry point → LoginScreen
├── theme/
│   └── app_theme.dart                 # Global theme (emerald/teal plant palette, JetBrains Mono)
├── models/
│   ├── user.dart                      # User (supporter/beneficiary/partner)
│   ├── post.dart                      # Social media post
│   ├── story.dart                     # Story bubble
│   ├── cause.dart                     # Cause project (profile feature only)
│   ├── growth_action.dart             # Engagement action / donation (formerly WaterDrop)
│   ├── fund_transaction.dart          # Financial transparency record
│   └── ad.dart                        # Sponsored content
├── data/
│   └── mock_data.dart                 # ALL hardcoded demo data (6 users, 7 causes, 10 stories, 18 posts, 3 ads, 11 actions, 12 txns)
├── screens/
│   ├── login_screen.dart              # Gradient header + pre-filled form → RoleSelection
│   ├── role_selection_screen.dart     # 3 animated role cards (Supporter/Beneficiary/Partner) → MainShell
│   ├── main_shell.dart                # 5-tab BottomNavigationBar (Home/Discover/Create/Impact/Profile)
│   ├── home_tab.dart                  # Instagram feed: stories row + posts + ads (every 5th)
│   ├── discover_tab.dart              # Explore: search + trending creators + "For You" grid
│   ├── create_post_screen.dart        # Modal post composer: media + caption + content type
│   ├── profile_screen.dart            # Current user profile: stats + posts/reels/about tabs
│   ├── beneficiary_profile_screen.dart # Public profile: header + cause card(s) + posts/reels/about tabs
│   ├── impact_screen.dart             # Impact dashboard: points/levels + achievements + activity feed
│   └── transparency_dashboard_screen.dart # Fund tracking: summary cards + spending breakdown + transactions
└── widgets/
    ├── story_bubble.dart              # Circular gradient avatar with seen/unseen ring
    ├── feed_post.dart                 # Instagram-style post card (square media, actions, caption)
    ├── ad_card.dart                   # Sponsored content card with CTA
    └── cause_card_widget.dart         # Profile cause feature (video story, progress bar, Support btn)
```

---

## Navigation Flow

```
LoginScreen
    │  (pushReplacement)
    ▼
RoleSelectionScreen
    │  (pushReplacement)
    ▼
MainShell  ←── 5-tab BottomNavigationBar
    ├── [0] HomeTab        — Instagram feed (stories + posts + ads)
    ├── [1] DiscoverTab    — Explore search + trending + For You grid
    ├── [2] (Create)       — Pushes CreatePostScreen modally
    ├── [3] ImpactScreen   — Impact dashboard
    └── [4] ProfileScreen  — Current user profile

From any post avatar tap:
    HomeTab/DiscoverTab ──► BeneficiaryProfileScreen(userId)
```

---

## Data Model Details

### User
| Field | Type | Notes |
|---|---|---|
| id | String | Primary key |
| name | String | Display name |
| email | String | |
| role | String | `'supporter'`, `'beneficiary'`, or `'partner'` |
| bio | String | |
| totalActions | int | Lifetime engagement count (formerly totalDrops) |
| totalDonated | double | Monetary total |
| causesSupported | int | |
| peopleReached | int | |
| followers | int | |
| following | int | |
| isVerified | bool | Blue checkmark |

### Post
| Field | Type | Notes |
|---|---|---|
| id | String | |
| userId | String | Author |
| userName | String | Denormalized for feed |
| userRole | String | |
| caption | String | Full caption with hashtags |
| category | String | `'community'`, `'environment'`, `'agriculture'`, `'relief'` |
| timestamp | DateTime | |
| likes | int | |
| comments | int | |
| shares | int | |
| isLiked | bool | Mutable (toggle in UI) |
| isSaved | bool | Mutable (toggle in UI) |
| type | String | `'photo'`, `'video'`, `'reel'`, `'artwork'`, `'music'`, `'update'` |
| causeId | String? | Optional link |
| causeTitle | String? | Optional link |

### Story
| Field | Type | Notes |
|---|---|---|
| id, userId, userName | String | |
| category | String | Controls gradient color |
| isViewed | bool | Mutable — controls ring style |
| postedAt | DateTime | |

### Cause
| Field | Type | Notes |
|---|---|---|
| id, title, description | String | |
| goal, raised | double | |
| beneficiaryId, beneficiaryName | String | |
| supporters | int | |
| category | String | `'Community'`, `'environment'`, `'agriculture'`, `'relief'` |
| progress | double | Computed getter (`raised/goal`) |

### GrowthAction (formerly WaterDrop)
| Field | Type | Notes |
|---|---|---|
| id, userId | String | |
| causeId, causeTitle | String? | For donation-type actions |
| targetUserId, targetPostId | String? | For engagement-type actions |
| amount | double | Monetary value (donations) |
| points | int | Engagement points (likes/comments/shares) |
| type | String | `'donation'`, `'like'`, `'comment'`, `'share'`, `'save'`, `'volunteer'` |
| message | String | Optional user note |
| typeIcon | IconData | Computed getter (uses `Icons.eco_rounded` base) |

### FundTransaction
| Field | Type | Notes |
|---|---|---|
| id, causeId, causeTitle | String | |
| amount | double | |
| description | String | |
| date | DateTime | |
| category | String | `'funds received'`, `'equipment'`, `'logistics'`, etc. |
| isIncoming | bool | Computed getter |

### Ad
| Field | Type | Notes |
|---|---|---|
| id, title, description | String | |
| category | String | Controls color |
| ctaText | String | Button label |

---

## Mock Data Summary (`MockData` class)

All data is in `lib/data/mock_data.dart` as `static final` lists.

| List | Count | Notes |
|---|---|---|
| `users` | 6 | 2 supporters, 2 beneficiaries, 2 partners; ids `u1`–`u6` |
| `causes` | 7 | Linked to `u2` (Mama Fatima), `u3` (BridgeBuilders Africa), `u4` (James Mwangi) |
| `stories` | 10 | Mix of viewed/unviewed |
| `posts` | 18 | Types: 8 photos, 2 videos, 3 reels, 3 artwork, 1 music, 1 update |
| `ads` | 3 | Inserted every 5th post in feed |
| `growthActions` | 11 | Mix of donations, likes, comments, shares, saves (formerly waterDrops) |
| `transactions` | 12 | For transparency dashboard |

**Helper methods on `MockData`:**
- `currentUser` → `users[0]` (Sarah Green, supporter)
- `userById(id)` → quick lookup
- `userPosts(id)` / `userStories(id)` / `userActions(id)` / `beneficiaryCauses(id)`
- `userEngagementPoints(id)` → sums `points` across actions
- `getUserLevel(actionCount)` / `getLevelProgress(points)` → gamification logic

---

## Screen-by-Screen Design

### 1. LoginScreen
- Full-screen gradient header (teal → emerald) with water drop icon
- White form card with email/password fields (pre-filled for demo)
- "Sign In" button → `RoleSelectionScreen`
- "Continue as Guest" text button

### 2. RoleSelectionScreen
- Title "Who are you?" + 3 role cards (Supporter/Beneficiary/Partner)
- Cards have icons, titles, subtitles, and animated selected state
- "Continue" button enabled only when a role is selected → `MainShell`
- **Supporter**: browses posts, engages with content, views impact reports
- **Beneficiary**: creates profile, maintains cause card, publishes updates
- **Partner**: sponsors campaigns, matches donations, collaborates on initiatives

### 3. MainShell (Tab Container)
- `IndexedStack` switches between 5 children (preserves scroll state)
- Tab 2 (Create) pushes `CreatePostScreen` modally instead of switching
- Bottom nav uses outlined/rounded icon pairs for active state

### 4. HomeTab (Instagram Feed)
- AppBar: water drop logo + activity buttons
- Horizontal scrollable story row (circular gradient bubbles, seen/unseen ring)
- Feed: `ListView.builder` mixing `Post` and `Ad` items
- Ads inserted after every 5th post
- Pull-to-refresh reloads stories + feed
- Tapping a story marks it as viewed

### 5. FeedPost (Widget)
- Instagram-style layout:
  - **Header**: Avatar (18px) + username + time ago + content type badge + more menu
  - **Media**: Square (1:1) gradient container with type-specific icon overlay; REEL badge or play button for reels/music
  - **Actions**: Like (toggle heart, red), Comment, Share, Save (toggle bookmark)
  - **Likes count** + caption (bold username + text) + "View all X comments" + shares count
  - **Time ago** in muted text
- `onAvatarTap` callback navigates to `BeneficiaryProfileScreen`

### 6. AdCard (Widget)
- Subtle amber border, "Sponsored" label
- Gradient media area with CTA button overlay
- Description text below

### 7. DiscoverTab (Explore)
- Search field (filters by caption or username)
- Horizontal type chips: All / Photo / Reel / Artwork / Music
- "Trending Creators" horizontal scroll row (avatar + name + follower count, verified badges)
- "For You" 3-column grid (9 items max, with REEL labels)

### 8. CreatePostScreen
- Modal pushed from center tab
- Media picker placeholder (tap to add)
- User avatar + name + "Public" visibility selector
- Multi-line caption input
- Menu rows: Tag people, Add location, Link a cause (optional)
- Content type selector chips: Photo/Video/Reel/Artwork/Music/Update
- "Share" button in AppBar shows demo snackbar

### 9. ProfileScreen (Current User)
- **Header**: Avatar (40px) + Posts/Followers/Following stats + name/bio + role badge
- **Actions**: Edit Profile + Share Profile buttons
- **Tabs**: Posts grid (3-col) / Reels grid (3-col) / About (info rows)
- Grid items show gradient + like count overlay

### 10. BeneficiaryProfileScreen (Public Profile)
- **Cover**: Gradient SliverAppBar with overlaid avatar
- **Header**: Avatar with optional verified badge + name + role + bio
- **Stats**: Posts / Followers / Following
- **Actions**: Follow + Message buttons
- **Cause Card section** (if beneficiary has causes): Full-width cause cards with "Support" button — appears between bio and tab bar
- **Tabs**: Posts grid / Reels grid / About

### 11. CauseCardWidget (Profile Feature)
- **Header**: 120px gradient area with video story player ("Watch story") + verified badge + category tag
- **Body**: Title, description (2 lines), raised/goal, progress bar, supporter count
- **CTA**: Teal "Support" button (not "Donate")
- Only rendered on `BeneficiaryProfileScreen` — never in the feed

### 12. ImpactScreen (formerly WaterDropsScreen)
- **Summary card**: Gradient card with Impact Points count + Level badge (e.g. "Level 3 Grower") + XP bar
- **Stats row**: Actions / Donations / Engagements
- **Achievements**: Horizontal scroll of badge icons (First Like, Commenter, Sharer, Collector, Supporter, Rising Star) — earned/locked states
- **Activity feed**: List of recent `GrowthAction` items with type icon, message, date, and points

### 13. TransparencyDashboardScreen
- 4 summary cards in 2x2 grid: Total Raised, Distributed, Admin, Impact
- "Spending Breakdown" section with labeled progress bars per category
- "Recent Transactions" list with incoming/outgoing arrows and +/- amounts

---

## Color Palette

| Token | Hex | Usage |
|---|---|---|
| Primary | `#059669` (Emerald-600) | CTAs, active nav, community category |
| Secondary | `#0D9488` (Teal-600) | Environment category |
| Accent | `#0284C7` (Sky-600) | Partner role, logistics |
| Background | `#F8FAFC` (Slate-50) | Scaffold background |
| Surface | `#FFFFFF` | Cards, bottom nav |
| Text | `#0F172A` (Slate-900) | Primary text |
| Text Secondary | `#64748B` (Slate-500) | Secondary text |
| Border/Light | `#E2E8F0`, `#F1F5F9` | Dividers, input fills |
| Agriculture | `#D97706` (Amber) | Farming category |
| Relief | `#DC2626` (Red) | Emergency category |
| Verified | `#059669` | Verified badge |

---

## Key Design Decisions

1. **Social-impact content platform**: The app looks and feels like Instagram. Content types (photo, reel, artwork, music) dominate. Fundraising is a background feature surfaced only on beneficiary profiles. "Plant" is a metaphor for collective impact — every action helps a cause grow.

2. **Cause Cards are profile features**: They appear between the bio and the tab bar on beneficiary profiles — similar to Instagram's "Link in bio" or pinned stories.

3. **Growth Actions = engagement + donations**: Points (called Impact Points) are earned through likes, comments, shares, saves, and donations. Level system gamifies participation — users progress from "Level 1 Grower" to "Level 5 Grower".

4. **Roles**: Supporters browse and engage, Beneficiaries create and share, Partners sponsor and amplify. No more "donor" terminology — the focus is on holistic support.

5. **All data is hardcoded**: `MockData` class in `mock_data.dart` holds everything. No API, no Firebase, no backend.

6. **No state management library**: Uses `setState` + `StatefulWidget` + `IndexedStack` for tab persistence.

7. **JetBrains Mono** applied globally via `GoogleFonts.jetBrainsMono()` in the theme.

---

## Image Asset Manifest

> A full audit and specification for every placeholder visual is in `assets/images/manifest.md`.
> **53 image assets** are planned across 7 categories, each with 1×, 2×, and 3× resolution variants.

| Category | Count | Format | Base (1×) Size |
|----------|-------|--------|----------------|
| Brand (logo, login BG, empty state) | 3 | PNG/JPG | 200-500×200-340 |
| Avatars (6 users) | 6 | PNG | 200×200 |
| Covers (6 users) | 6 | JPG | 500×200 |
| Posts (18 posts) | 18 | JPG | 500×500 |
| Stories (10 stories) | 10 | JPG | 200×200 |
| Causes (7 causes) | 7 | JPG | 500×170 |
| Ads (3 ads) | 3 | JPG | 500×170 |

**Code integration**: All widgets (`feed_post`, `story_bubble`, `cause_card_widget`, `ad_card`, `profile_screen`, `beneficiary_profile_screen`, `discover_tab`, `create_post_screen`, `login_screen`) now reference asset paths via `AssetImage()`. When you drop the actual images into the `assets/images/` directories, everything will render them automatically.

**Resolution variants**: Place at `assets/images/{category}/file.png` (1×), `assets/images/{category}/2.0x/file.png` (2×), and `assets/images/{category}/3.0x/file.png` (3×). Flutter detects the device pixel ratio and loads the appropriate variant.

---

## Running the App

```bash
flutter pub get
flutter run
```

The app starts at `LoginScreen` with pre-filled demo credentials. Tap "Sign In" → select a role → enter the Instagram-style feed.

> **Note**: Image assets have not been generated yet. The app currently references `assets/images/...` paths but the image files themselves do not exist yet. Run the app — it will use placeholder fallbacks within the widgets or show missing-image indicators until you populate the `assets/images/` directories per `manifest.md`.
