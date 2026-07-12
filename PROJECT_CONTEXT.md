# Water This Plant — Project Context

> A Flutter demo app: a social media platform (Instagram/TikTok style) where user engagement supports verified beneficiaries.
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
│   └── app_theme.dart                 # Global theme (teal/emerald palette, JetBrains Mono)
├── models/
│   ├── user.dart                      # User (donor/beneficiary/partner)
│   ├── post.dart                      # Social media post
│   ├── story.dart                     # Story bubble
│   ├── cause.dart                     # Cause project (profile feature only)
│   ├── water_drop.dart                # Engagement action / donation
│   ├── fund_transaction.dart          # Financial transparency record
│   └── ad.dart                        # Sponsored content
├── data/
│   └── mock_data.dart                 # ALL hardcoded demo data (6 users, 7 causes, 10 stories, 18 posts, 3 ads, 11 drops, 12 txns)
├── screens/
│   ├── login_screen.dart              # Gradient header + pre-filled form → RoleSelection
│   ├── role_selection_screen.dart     # 3 animated role cards → MainShell
│   ├── main_shell.dart                # 5-tab BottomNavigationBar container (Home/Discover/Create/Drops/Profile)
│   ├── home_tab.dart                  # Instagram feed: stories row + posts + ads (every 5th)
│   ├── discover_tab.dart              # Explore: search + trending creators + "For You" grid
│   ├── create_post_screen.dart        # Modal post composer: media + caption + content type
│   ├── profile_screen.dart            # Current user profile: stats + posts/reels/about tabs
│   ├── beneficiary_profile_screen.dart # Public profile: header + cause card(s) + posts/reels/about tabs
│   ├── water_drops_screen.dart        # Impact dashboard: points/levels + achievements + activity feed
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
    ├── [1] DiscoverTab    — Search + trending creators + For You grid
    ├── [2] (Create)       — Pushes CreatePostScreen modally
    ├── [3] WaterDropsScreen  — Impact dashboard
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
| role | String | `'donor'`, `'beneficiary'`, or `'partner'` |
| bio | String | |
| totalDrops | int | Lifetime engagement count |
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
| category | String | `'water'`, `'environment'`, `'agriculture'`, `'relief'` |
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
| category | String | Matches post categories |
| progress | double | Computed getter (`raised/goal`) |

### WaterDrop
| Field | Type | Notes |
|---|---|---|
| id, userId | String | |
| causeId, causeTitle | String? | For donation-type drops |
| targetUserId, targetPostId | String? | For engagement-type drops |
| amount | double | Monetary value (donations) |
| points | int | Engagement points (likes/comments/shares) |
| type | String | `'donation'`, `'like'`, `'comment'`, `'share'`, `'save'`, `'volunteer'` |
| message | String | Optional user note |
| typeIcon | IconData | Computed getter |

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
| `users` | 6 | 2 donors, 2 beneficiaries, 2 partners; ids `u1`–`u6` |
| `causes` | 7 | Linked to `u2` (Mama Fatima), `u3` (CleanWater NGO), `u4` (James Mwangi) |
| `stories` | 10 | Mix of viewed/unviewed |
| `posts` | 18 | Types: 8 photos, 2 videos, 3 reels, 3 artwork, 1 music, 1 update |
| `ads` | 3 | Inserted every 5th post in feed |
| `waterDrops` | 11 | Mix of donations, likes, comments, shares, saves |
| `transactions` | 12 | For transparency dashboard |

**Helper methods on `MockData`:**
- `currentUser` → `users[0]` (Sarah Green, donor)
- `userById(id)` → quick lookup
- `userPosts(id)` / `userStories(id)` / `userDrops(id)` / `beneficiaryCauses(id)`
- `userEngagementPoints(id)` → sums `points` across drops
- `getUserLevel(dropCount)` / `getLevelProgress(points)` → gamification logic

---

## Screen-by-Screen Design

### 1. LoginScreen
- Full-screen gradient header (teal → emerald) with water drop icon
- White form card with email/password fields (pre-filled for demo)
- "Sign In" button → `RoleSelectionScreen`
- "Continue as Guest" text button

### 2. RoleSelectionScreen
- Title "Who are you?" + 3 role cards (Donor/Beneficiary/Partner)
- Cards have icons, titles, subtitles, and animated selected state
- "Continue" button enabled only when a role is selected → `MainShell`

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

### 12. WaterDropsScreen (Impact Dashboard)
- **Summary card**: Gradient card with Impact Points count + Level badge + XP bar
- **Stats row**: Drops / Donations / Actions
- **Achievements**: Horizontal scroll of badge icons (First Like, Commenter, Sharer, Collector, Supporter, Rising Star) — earned/locked states
- **Activity feed**: List of recent `WaterDrop` items with type icon, message, date, and points

### 13. TransparencyDashboardScreen
- 4 summary cards in 2x2 grid: Total Raised, Distributed, Admin, Impact
- "Spending Breakdown" section with labeled progress bars per category
- "Recent Transactions" list with incoming/outgoing arrows and +/- amounts

---

## Color Palette

| Token | Hex | Usage |
|---|---|---|
| Primary | `#0D9488` (Teal-600) | CTAs, active nav, water category |
| Secondary | `#059669` (Emerald-600) | Environment category |
| Accent | `#0284C7` (Sky-600) | Partner role, logistics |
| Background | `#F8FAFC` (Slate-50) | Scaffold background |
| Surface | `#FFFFFF` | Cards, bottom nav |
| Text | `#0F172A` (Slate-900) | Primary text |
| Text Secondary | `#64748B` (Slate-500) | Secondary text |
| Border/Light | `#E2E8F0`, `#F1F5F9` | Dividers, input fills |
| Agriculture | `#D97706` (Amber) | Farming category |
| Relief | `#DC2626` (Red) | Emergency category |
| Verified | `#0D9488` | Blue checkmark |

---

## Key Design Decisions

1. **Social media first**: The app looks and feels like Instagram. Content types (photo, reel, artwork, music) dominate. Fundraising is a background feature surfaced only on beneficiary profiles.

2. **Cause Cards are profile features**: They appear between the bio and the tab bar on beneficiary profiles — similar to Instagram's "Link in bio" or pinned stories.

3. **Water Drops = engagement + donations**: Points are earned through likes, comments, shares, and saves — not just money. Level system gamifies participation.

4. **All data is hardcoded**: `MockData` class in `mock_data.dart` holds everything. No API, no Firebase, no backend.

5. **No state management library**: Uses `setState` + `StatefulWidget` + `IndexedStack` for tab persistence.

6. **JetBrains Mono** applied globally via `GoogleFonts.jetBrainsMono()` in the theme.

---

## Running the App

```bash
flutter pub get
flutter run
```

The app starts at `LoginScreen` with pre-filled demo credentials. Tap "Sign In" → select a role → enter the Instagram-style feed.
