# Bulk Image Generation Guide

## Config Files

Four config files group images by aspect ratio:

| Config | Aspect Ratio | Count | Images |
|--------|-------------|-------|--------|
| `config-1x1.yaml` | 1:1 | 36 | logo, empty state, 6 avatars, 18 posts, 10 stories |
| `config-3x2.yaml` | 5:3 | 1 | login background |
| `config-5x2.yaml` | 5:2 | 6 | cover photos |
| `config-3x1.yaml` | 3:1 | 10 | 7 causes + 3 ads |

## Output → Asset Mapping

The tool outputs images as `{album}_{index:03d}.png`. Rename/copy to these paths.

### config-1x1.yaml → album: wtp-square

| Index | Asset Path | Description |
|-------|-----------|-------------|
| 001 | `brand/logo.png` | App logo |
| 002 | `brand/empty_state.png` | Empty state illustration |
| 003 | `avatars/u1.png` | Sarah Green |
| 004 | `avatars/u2.png` | Mama Fatima |
| 005 | `avatars/u3.png` | BridgeBuilders Africa |
| 006 | `avatars/u4.png` | James Mwangi |
| 007 | `avatars/u5.png` | Elena Rodriguez |
| 008 | `avatars/u6.png` | Kenya Rise Foundation |
| 009 | `posts/p1.jpg` | Baobab sunrise |
| 010 | `posts/p2.jpg` | Kingfisher bird |
| 011 | `posts/p3.jpg` | Tomatoes on vine |
| 012 | `posts/p4.jpg` | Community mural |
| 013 | `posts/p5.jpg` | Classroom supplies |
| 014 | `posts/p6.jpg` | Drilling rig site |
| 015 | `posts/p7.jpg` | Drumming circle |
| 016 | `posts/p8.jpg` | Elephants at watering hole |
| 017 | `posts/p9.jpg` | Farm sunset |
| 018 | `posts/p10.jpg` | Fluid art painting |
| 019 | `posts/p11.jpg` | Kenyan market |
| 020 | `posts/p12.jpg` | 15000 supporters team |
| 021 | `posts/p13.jpg` | Children's drawings |
| 022 | `posts/p14.jpg` | Guitar by window |
| 023 | `posts/p15.jpg` | Drone community center |
| 024 | `posts/p16.jpg` | Farmer training |
| 025 | `posts/p17.jpg` | Acrylic pour |
| 026 | `posts/p18.jpg` | Village dawn teaser |
| 027 | `stories/s1.jpg` | Woman profile sunset |
| 028 | `stories/s2.jpg` | Dew spiderweb |
| 029 | `stories/s3.jpg` | Hands planting sapling |
| 030 | `stories/s4.jpg` | Hands holding maize |
| 031 | `stories/s5.jpg` | Paintbrush green paint |
| 032 | `stories/s6.jpg` | Child raising hand in class |
| 033 | `stories/s7.jpg` | Djembe drum on earth |
| 034 | `stories/s8.jpg` | Hands folding blanket |
| 035 | `stories/s9.jpg` | Bee pollinating flower |
| 036 | `stories/s10.jpg` | Dew leaf macro |

### config-3x2.yaml → album: wtp-login-bg

| Index | Asset Path | Description |
|-------|-----------|-------------|
| 001 | `brand/login_bg.jpg` | Login header illustration |

### config-5x2.yaml → album: wtp-covers

| Index | Asset Path | Description |
|-------|-----------|-------------|
| 001 | `covers/u1.jpg` | Sarah Green — river valley |
| 002 | `covers/u2.jpg` | Mama Fatima — market scene |
| 003 | `covers/u3.jpg` | BridgeBuilders — school build |
| 004 | `covers/u4.jpg` | James Mwangi — terraced farm |
| 005 | `covers/u5.jpg` | Elena Rodriguez — mural wall |
| 006 | `covers/u6.jpg` | Kenya Rise — school playground |

### config-3x1.yaml → album: wtp-wide

| Index | Asset Path | Description |
|-------|-----------|-------------|
| 001 | `causes/c1.jpg` | Koudougou Community Center |
| 002 | `causes/c2.jpg` | School Supplies Drive |
| 003 | `causes/c3.jpg` | Youth Leadership Program |
| 004 | `causes/c4.jpg` | Bakau Library Project |
| 005 | `causes/c5.jpg` | Scholarship Fund |
| 006 | `causes/c6.jpg` | Emergency Food Bank |
| 007 | `causes/c7.jpg` | Ololua Health Clinic |
| 008 | `ads/a1.jpg` | Get Started ad |
| 009 | `ads/a2.jpg` | Become a Partner ad |
| 010 | `ads/a3.jpg` | Try Premium ad |

## Post-Processing Steps

1. Run each config file through your bulk generator tool
2. Convert output PNGs to JPG for categories marked `.jpg` (posts, stories, covers, causes, ads)
3. Rename output files per the mapping tables above
4. Place renamed files into `assets/images/{category}/`
5. Create resolution variants:
   - Copy to `assets/images/{category}/2.0x/` and upscale to 2× dimensions
   - Copy to `assets/images/{category}/3.0x/` and upscale to 3× dimensions
6. Run `flutter pub get` to refresh assets
7. Run the app — images will render via `AssetImage()` references
