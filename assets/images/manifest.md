# Image Asset Manifest — Water This Plant

> This manifest catalogs every visual placeholder in the app and specifies the image assets needed to replace them.
> Generated: July 12, 2026
> Format: All assets use the Flutter 1×/2×/3× resolution convention.
> Path structure: `assets/images/{category}/{file}.png` with variants at `assets/images/{category}/2.0x/{file}.png` and `assets/images/{category}/3.0x/{file}.png`.

---

## 1. Brand Assets

### 1.1 App Logo
| Property | Value |
|----------|-------|
| **File path** | `assets/images/brand/logo.png` |
| **Used in** | Login screen header (circle, 90×90 logical), HomeTab app bar (28×28 logical) |
| **Purpose** | Primary app brandmark — a stylized leaf/plant icon representing the "Water This Plant" metaphor |
| **Format** | PNG with transparency |
| **Aspect ratio** | 1:1 (square) |
| **Recommended pixel dimensions** | |
| 1× (base) | 200 × 200 px |
| 2× | 400 × 400 px |
| 3× | 600 × 600 px |
| **Visual description** | A modern, minimalist leaf silhouette made of layered organic curves. The leaf should suggest both a plant sprout reaching upward and a drop of water in the negative space, evoking the "nurturing growth" metaphor. Use a single emerald-green (`#059669`) gradient with subtle teal undertones (`#0D9488`). White or transparent background. No text. Flat design with a slight gradient sheen — suitable for a social-impact brand. |

---

### 1.2 Login Screen Illustration
| Property | Value |
|----------|-------|
| **File path** | `assets/images/brand/login_bg.png` |
| **Used in** | Login screen header — 340 logical px tall, full width, with bottom rounded corners (Radius.circular(40)) |
| **Purpose** | Hero image behind the app icon and tagline, sets the emotional tone of the platform |
| **Format** | JPG (no transparency needed) |
| **Aspect ratio** | ~5:3 (landscape rectangle) |
| **Recommended pixel dimensions** | |
| 1× (base) | 500 × 340 px |
| 2× | 1000 × 680 px |
| 3× | 1500 × 1020 px |
| **Visual description** | An abstract, emotionally warm illustration of diverse hands reaching toward a glowing green sprout in the center. The background should be a soft gradient of emerald to deep teal (`#059669` → `#0D9488`). Small glowing particles or sparkles orbit the sprout like fireflies. The style is flat with soft gradients — inspired by modern illustration platforms like manypixels or undraw. The image should convey unity, growth, and collective action. On mobile, key elements should remain visible in the center 70% (safe zone) since edges may be cropped. |

---

### 1.3 Empty State / Loading Illustration
| Property | Value |
|----------|-------|
| **File path** | `assets/images/brand/empty_state.png` |
| **Used in** | Profile screen grid when no posts exist (currently shows icon + "No photos yet" / "No reels yet") |
| **Purpose** | Friendly empty-state illustration for tabs without content |
| **Format** | PNG with transparency |
| **Aspect ratio** | 1:1 (square) |
| **Recommended pixel dimensions** | |
| 1× (base) | 300 × 300 px |
| 2× | 600 × 600 px |
| 3× | 900 × 900 px |
| **Visual description** | A small potted plant with a single leaf, drawn in a simple, friendly line-art style. A dotted circular "ripple" radiates outward suggesting potential growth. Colors: emerald green pot/leaf on a very light background (`#F1F5F9`). Minimalist, cute, encouraging. |

---

## 2. User Avatars (Profile Photos)

Used in: FeedPost (radius 18), StoryBubble (inside ring), DiscoverTab (radius 30), ProfileScreen (radius 40), BeneficiaryProfileScreen (radius 33/36), CreatePostScreen (radius 20), ImpactScreen activity list.

All avatars must be **square, well-lit headshots or brand logos** with the face/logo centered. For photo avatars, the subject should occupy the central ~60% of the frame.

| ID | File path | User | Visual Description |
|----|-----------|------|--------------------|
| u1 | `assets/images/avatars/u1.png` | **Sarah Green** (supporter) | A woman in her late 20s with warm brown skin, natural curly hair tied back, wearing a cream-colored shirt. She is outdoors in soft golden-hour light, laughing or smiling warmly at something off-camera. Shallow depth-of-field blurs a green nature background. |
| u2 | `assets/images/avatars/u2.png` | **Mama Fatima** (beneficiary) | A dignified woman in her 50s with dark skin, grey-streaked hair wrapped in a bright indigo and gold headwrap (Senegalese style). She wears colorful traditional fabric. Her expression is wise, kind, and hopeful. Background is warm earth tones. |
| u3 | `assets/images/avatars/u3.png` | **BridgeBuilders Africa** (partner) | A professional brand logo-style avatar: a stylized bridge arching between two tree silhouettes. Clean, modern vector design in navy blue (`#1E3A5F`) and teal (`#0D9488`). White background. Text optional but if included, a clean sans-serif "BB" monogram. |
| u4 | `assets/images/avatars/u4.png` | **James Mwangi** (beneficiary) | A man in his 30s with dark brown skin, short black hair, and a close-trimmed beard, wearing a denim shirt. He stands in a green farm field at golden hour, holding a ripe tomato. His smile is broad and proud. |
| u5 | `assets/images/avatars/u5.png` | **Elena Rodriguez** (supporter) | A woman in her early 30s with light brown skin, long dark hair in a braid over one shoulder, paint speckles on her cheek. She is in an art studio with colorful canvases behind her. She holds a paintbrush and looks creatively inspired. |
| u6 | `assets/images/avatars/u6.png` | **Kenya Rise Foundation** (partner) | A professional brand logo: a rising sun silhouette behind an acacia tree, with the letters "KRF" in a clean modern sans-serif. Colors: warm orange (`#F59E0B`) and dark green (`#065F46`). White or transparent background. |

### Avatar Dimensions (all user avatars)
| Variant | Pixels | Notes |
|---------|--------|-------|
| 1× (base) | 200 × 200 px | Minimum; will be scaled up slightly for radius 40 (80×80 logical) at 1× |
| 2× | 400 × 400 px | Covers radius 40 at 2× = 160×160 device pixels — crisp |
| 3× | 600 × 600 px | Covers all display densities |

**Format:** PNG with transparency. Subjects should be well-centered so `CircleAvatar` cropping looks good.

---

## 3. User Cover Photos

Used in: BeneficiaryProfileScreen (SliverAppBar, expandedHeight: 160 logical px, full width).

**Aspect ratio:** ~5:2 (landscape)
**Format:** JPG

| ID | File path | User | Visual Description |
|----|-----------|------|--------------------|
| u1 | `assets/images/covers/u1.png` | Sarah Green | A wide-angle nature landscape: a calm river winding through a lush green valley at sunrise. Mist rises from the water. Soft warm light. Colors: greens, golds, soft blues. |
| u2 | `assets/images/covers/u2.png` | Mama Fatima | A bustling open-air market in a West African village: colorful fabric stalls, baskets of produce, women in vibrant clothing, warm afternoon sunlight. Authentic, lively, community-focused. |
| u3 | `assets/images/covers/u3.png` | BridgeBuilders Africa | A construction scene with community members helping build a school: bricks, scaffolding, smiling workers of all ages. Bright sunlight, blue sky. Sense of progress and collaboration. |
| u4 | `assets/images/covers/u4.png` | James Mwangi | A sweeping view of terraced farm fields on a hillside in Kenya, with rows of lush green crops, a solar panel visible, and a dramatic sky at golden hour. |
| u5 | `assets/images/covers/u5.png` | Elena Rodriguez | A colorful mural wall in progress: an abstract design with geometric shapes in vibrant blues, greens, and golds. Paint cans and brushes visible at the base. Street-art atmosphere. |
| u6 | `assets/images/covers/u6.png` | Kenya Rise Foundation | A wide shot of a school playground with children in uniform playing, a new building with "KRF" signage visible, set against a clear African sky. Happy, aspirational. |

### Cover Dimensions
| Variant | Pixels |
|---------|--------|
| 1× (base) | 500 × 200 px |
| 2× | 1000 × 400 px |
| 3× | 1500 × 600 px |

---

## 4. Post Media Images (18 posts)

Used in FeedPost (full-width square, 1:1 aspect ratio), ProfileScreen grid (3-column square grid), DiscoverTab grid (3-column square grid), BeneficiaryProfileScreen grid.

**Aspect ratio:** 1:1 (square)
**Format:** JPG

| ID | File path | Belongs to | Type | Visual Description |
|----|-----------|------------|------|--------------------|
| p1 | `assets/images/posts/p1.jpg` | Mama Fatima | photo | A majestic baobab tree silhouetted against a vibrant orange and pink sunrise. Silhouettes of small houses in the distance. The sky has soft cloud streaks. Warm, serene, West African savanna. |
| p2 | `assets/images/posts/p2.jpg` | Sarah Green | photo | A close-up of a small colorful bird (kingfisher) perched on a branch by a river. Soft green and brown background. Sharp focus on the bird's bright blue and orange feathers. Natural lighting. |
| p3 | `assets/images/posts/p3.jpg` | James Mwangi | photo | A close-up of ripe red tomatoes on the vine, glistening with morning dew. Green leaves frame the shot. Warm sunlight from the side. Shallow depth of field. Vibrant, appetizing. |
| p4 | `assets/images/posts/p4.jpg` | Elena Rodriguez | artwork | A vibrant community mural on a brick wall, painted in abstract geometric patterns. Colors: turquoise, coral, gold, and ivory. The composition radiates outward from a central diamond shape. Street-art aesthetic. |
| p5 | `assets/images/posts/p5.jpg` | Kenya Rise Foundation | photo | A bright, modern classroom with wooden desks, a chalkboard with lesson notes, and sunlight streaming through large windows. Children's art projects pinned to a wall. Clean, hopeful. |
| p6 | `assets/images/posts/p6.jpg` | BridgeBuilders Africa | video (poster frame) | A construction site with a drilling rig against a clear blue sky. Workers in hard hats collaborate. Red earth, green equipment. Sense of progress and teamwork. Motion blur hint for "video" feel. |
| p7 | `assets/images/posts/p7.jpg` | Mama Fatima | music (cover art) | A circle of elders sitting under a large tree at dusk, one playing a djembe drum. Warm firelight illuminates their faces. Stars visible in the darkening sky. Cultural, traditional, atmospheric. |
| p8 | `assets/images/posts/p8.jpg` | Sarah Green | photo | A golden-hour landscape of an African watering hole: elephants drinking, orange sky reflected in still water. Silhouetted acacia trees frame the edges. Serene, majestic wildlife scene. |
| p9 | `assets/images/posts/p9.jpg` | James Mwangi | reel (poster frame) | A dramatic sunset over a Kenyan farm: rows of crops leading to the horizon, a single figure standing looking at the sky. Warm oranges and purples. Cinematic wide-angle composition. |
| p10 | `assets/images/posts/p10.jpg` | Elena Rodriguez | artwork | A fluid art painting in progress: swirling greens, golds, and teals on a white canvas. Paint drips and cells visible. Abstract organic shapes suggesting leaves and growth. Creative process shot. |
| p11 | `assets/images/posts/p11.jpg` | James Mwangi | photo | A busy outdoor market in Kenya: colorful piles of fruits and vegetables on tables, people bargaining, a canvas canopy overhead. Bright sunlight, warm colors, energetic atmosphere. |
| p12 | `assets/images/posts/p12.jpg` | BridgeBuilders Africa | update | A team photo of happy volunteers holding a banner that says "15,000 SUPPORTERS" with confetti and smiling faces. Bright daylight. Celebration, milestone, gratitude. |
| p13 | `assets/images/posts/p13.jpg` | Mama Fatima | artwork | Children's crayon drawings taped to a wall: colorful houses with oversized suns, stick figures, and hand-drawn hearts. Authentic child art style. Innocent, touching, hopeful. |
| p14 | `assets/images/posts/p14.jpg` | Sarah Green | music (cover art) | A person's hands playing an acoustic guitar by a rain-streaked window. Soft, moody lighting. Raindrops visible on the glass. Warm interior light. Intimate, peaceful atmosphere. |
| p15 | `assets/images/posts/p15.jpg` | Kenya Rise Foundation | reel (poster frame) | A drone's-eye view of a new community building with a blue roof, surrounded by green fields and red dirt paths. People gathered for an opening ceremony. High-angle, cinematic. |
| p16 | `assets/images/posts/p16.jpg` | James Mwangi | photo | A farmer demonstrating irrigation techniques to a group of attentive villagers. The farmer gestures toward rows of healthy crops. Golden sunlight. Knowledge-sharing, community training. |
| p17 | `assets/images/posts/p17.jpg` | Elena Rodriguez | artwork | A close-up of an acrylic pour painting in progress on a circular canvas. Swirling greens, golds, and pearlescent white. Paint being dripped from a cup. Mesmerizing organic patterns. |
| p18 | `assets/images/posts/p18.jpg` | Mama Fatima | reel (poster frame) | A mysterious wide shot of a small village at dawn with smoke rising from cooking fires. A hand enters the frame holding a smartphone, as if recording. Teaser aesthetic with soft mist. |

### Post Media Dimensions
| Variant | Pixels |
|---------|--------|
| 1× (base) | 500 × 500 px |
| 2× | 1000 × 1000 px |
| 3× | 1500 × 1500 px |

---

## 5. Story Thumbnails (10 stories)

Used in: StoryBubble widget (72×72 logical circle, shown as gradient ring with inner circle).

**Aspect ratio:** 1:1 (square) — will be circle-cropped
**Format:** JPG

| ID | File path | Belongs to | Visual Description |
|----|-----------|------------|--------------------|
| s1 | `assets/images/stories/s1.jpg` | Mama Fatima | Close-up of a woman's face in profile, looking at a beautiful sunset. Warm golden light on dark skin. Simple, elegant portrait. |
| s2 | `assets/images/stories/s2.jpg` | Sarah Green | A nature photograph of a dew-covered spiderweb catching the morning light. Shallow depth of field. Magical, delicate. |
| s3 | `assets/images/stories/s3.jpg` | BridgeBuilders Africa | A close-up of hands holding a small tree sapling about to be planted. Soil, green leaves, sunlight. Symbolic of growth. |
| s4 | `assets/images/stories/s4.jpg` | James Mwangi | A man's hands holding a ripe ear of maize (corn) in a sunlit field. Textured, agricultural, proud. |
| s5 | `assets/images/stories/s5.jpg` | Elena Rodriguez | A paintbrush dipped in bright green paint, close-up. Abstract and colorful. Creative energy. |
| s6 | `assets/images/stories/s6.jpg` | Kenya Rise Foundation | A close-up of a child in a classroom smiling and raising their hand. Defocused classroom background. Joyful learning. |
| s7 | `assets/images/stories/s7.jpg` | Mama Fatima | A traditional West African drum (djembe) with carved details, set on red earth. Warm afternoon light. Cultural, musical. |
| s8 | `assets/images/stories/s8.jpg` | Elena Rodriguez | A close-up of hands folding a warm blanket, with a bowl of soup visible in the background. Comfort, care, relief. |
| s9 | `assets/images/stories/s9.jpg` | James Mwangi | A bee pollinating a yellow flower in a farm field. Macro photography, soft green background. Nature's cycle. |
| s10 | `assets/images/stories/s10.jpg` | Sarah Green | A leaf with pristine water droplets after rain, macro close-up. Vibrant green, fresh, tranquil. |

### Story Thumbnail Dimensions
| Variant | Pixels |
|---------|--------|
| 1× (base) | 200 × 200 px |
| 2× | 400 × 400 px |
| 3× | 600 × 600 px |

---

## 6. Cause Hero Images (7 causes)

Used in: CauseCardWidget (120 logical px tall, full width header with play button overlay).

**Aspect ratio:** ~3:1 (landscape rectangle)
**Format:** JPG

| ID | File path | Cause | Visual Description |
|----|-----------|-------|--------------------|
| c1 | `assets/images/causes/c1.jpg` | Koudougou Community Center | Architectural rendering or construction photo of a community center building in progress. Concrete foundation, rebar, and smiling workers in Burkina Faso. Bright sunlight. |
| c2 | `assets/images/causes/c2.jpg` | School Supplies Drive | A neatly arranged table covered with colorful school supplies: notebooks, pencils, backpacks, rulers. Bright, organized, generous. Warm overhead light. |
| c3 | `assets/images/causes/c3.jpg` | Youth Leadership Program | A group of diverse young people sitting in a circle outdoors, engaged in discussion. Whiteboard visible with brainstorming notes. Energetic, optimistic. |
| c4 | `assets/images/causes/c4.jpg` | Bakau Library Project | A room with empty wooden bookshelves awaiting books, sunlight streaming through a window. Freshly painted walls. Potential, hope for knowledge. |
| c5 | `assets/images/causes/c5.jpg` | Scholarship Fund | A close-up of a graduation cap being tossed in the air against a bright blue sky. Silhouettes of celebrating students. Achievement, future. |
| c6 | `assets/images/causes/c6.jpg` | Emergency Food Bank | Volunteers packing food boxes in a warehouse: canned goods, rice, dried beans arranged neatly. Hands working together. Compassion, organization, urgency. |
| c7 | `assets/images/causes/c7.jpg` | Ololua Health Clinic | A small, freshly painted clinic building with a red cross sign, set in a rural landscape. A health worker stands at the entrance. Clean, welcoming. |

### Cause Hero Dimensions
| Variant | Pixels |
|---------|--------|
| 1× (base) | 500 × 170 px |
| 2× | 1000 × 340 px |
| 3× | 1500 × 510 px |

---

## 7. Ad Creative Images (3 ads)

Used in: AdCard widget (140 logical px tall, full width media area).

**Aspect ratio:** ~3:1 (landscape rectangle)
**Format:** JPG

| ID | File path | Ad | Visual Description |
|----|-----------|-----|--------------------|
| a1 | `assets/images/ads/a1.jpg` | "Get Started" | A smartphone mockup held in a hand, showing the Water This Plant app home screen. Floating green leaf icons and "+10K creators" text visible. Clean, aspirational tech product shot on a white desk with a small potted plant. |
| a2 | `assets/images/ads/a2.jpg` | "Become a Partner" | A professional handshake between two people in business attire, with a blurred background of a community project (building, plants). Warm, trustworthy, corporate-responsibility aesthetic. |
| a3 | `assets/images/ads/a3.jpg` | "Try Premium" | A gold/emerald premium card with a leaf icon floating above a smartphone screen. Sparkle effects. "PREMIUM" text subtly watermarked. Luxurious but nature-inspired, like a high-end green fintech ad. |

### Ad Creative Dimensions
| Variant | Pixels |
|---------|--------|
| 1× (base) | 500 × 170 px |
| 2× | 1000 × 340 px |
| 3× | 1500 × 510 px |

---

## Asset Summary

| Category | Count | Format | Aspect Ratio | Base (1×) Size | 2× Size | 3× Size |
|----------|-------|--------|-------------|---------------|---------|---------|
| Brand: Logo | 1 | PNG (transparent) | 1:1 | 200×200 | 400×400 | 600×600 |
| Brand: Login BG | 1 | JPG | ~5:3 | 500×340 | 1000×680 | 1500×1020 |
| Brand: Empty state | 1 | PNG (transparent) | 1:1 | 300×300 | 600×600 | 900×900 |
| Avatars | 6 | PNG (transparent) | 1:1 | 200×200 | 400×400 | 600×600 |
| Covers | 6 | JPG | ~5:2 | 500×200 | 1000×400 | 1500×600 |
| Posts | 18 | JPG | 1:1 | 500×500 | 1000×1000 | 1500×1500 |
| Stories | 10 | JPG | 1:1 | 200×200 | 400×400 | 600×600 |
| Causes | 7 | JPG | ~3:1 | 500×170 | 1000×340 | 1500×510 |
| Ads | 3 | JPG | ~3:1 | 500×170 | 1000×340 | 1500×510 |

**Total assets: 53 images** (across all categories, not counting resolution variants).
**Total with resolution variants: 159 files** on disk.

---

## Flutter pubspec.yaml Configuration

Add to `pubspec.yaml` under `flutter:`:

```yaml
  assets:
    - assets/images/brand/
    - assets/images/avatars/
    - assets/images/covers/
    - assets/images/posts/
    - assets/images/stories/
    - assets/images/causes/
    - assets/images/ads/
```

---

## Implementation Guide

To use these assets in code, the patterns are:

### Avatar (CircleAvatar)
```dart
CircleAvatar(
  radius: 40,
  backgroundImage: AssetImage('assets/images/avatars/${user.id}.png'),
)
```

### Cover photo (SliverAppBar)
```dart
SliverAppBar(
  expandedHeight: 160,
  flexibleSpace: FlexibleSpaceBar(
    background: Image.asset(
      'assets/images/covers/${user.id}.jpg',
      fit: BoxFit.cover,
    ),
  ),
)
```

### Post media (square container)
```dart
Container(
  width: double.infinity,
  aspectRatio: 1,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/posts/${post.id}.jpg'),
      fit: BoxFit.cover,
    ),
  ),
)
```

### Story thumbnail
```dart
CircleAvatar(
  radius: 33,
  backgroundImage: AssetImage('assets/images/stories/${story.id}.jpg'),
)
```

### Cause card header
```dart
Container(
  height: 120,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/causes/${cause.id}.jpg'),
      fit: BoxFit.cover,
    ),
    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
  ),
)
```

### Ad card media
```dart
Container(
  height: 140,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/ads/${ad.id}.jpg'),
      fit: BoxFit.cover,
    ),
  ),
)
```

### App logo
```dart
Image.asset('assets/images/brand/logo.png', width: 50, height: 50)
```
