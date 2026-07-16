import 'package:water_this_plant/models/user.dart';
import 'package:water_this_plant/models/cause.dart';
import 'package:water_this_plant/models/growth_action.dart';
import 'package:water_this_plant/models/fund_transaction.dart';
import 'package:water_this_plant/models/story.dart';
import 'package:water_this_plant/models/post.dart';
import 'package:water_this_plant/models/ad.dart';

class MockData {
  static final List<User> users = [
    User(
      id: 'u1', name: 'Sarah Green', email: 'sarah@example.com', role: 'supporter',
      bio: 'Photographer | Turning everyday moments into impact \u2728 Every scroll can grow something beautiful.',
      avatarUrl: 'assets/images/avatars/u1.jpg', coverUrl: 'assets/images/covers/u1.jpg',
      totalActions: 47, totalDonated: 2500.0, causesSupported: 8, peopleReached: 320,
      followers: 1240, following: 382, isVerified: false,
    ),
    User(
      id: 'u2', name: 'Mama Fatima', email: 'fatima@example.com', role: 'beneficiary',
      bio: 'Community leader | Senegal \u{1F1F8}\u{1F1F3} | Building a better future for Koudougou \u{1F30D}',
      avatarUrl: 'assets/images/avatars/u2.jpg', coverUrl: 'assets/images/covers/u2.jpg',
      totalActions: 12, totalDonated: 0, causesSupported: 0, peopleReached: 850,
      followers: 3400, following: 215, isVerified: true,
    ),
    User(
      id: 'u3', name: 'BridgeBuilders Africa', email: 'info@bridgebuilders.org', role: 'partner',
      bio: 'Funding community-led development across West Africa \u{1F30D} Transparency is our promise.',
      avatarUrl: 'assets/images/avatars/u3.jpg', coverUrl: 'assets/images/covers/u3.jpg',
      totalActions: 89, totalDonated: 15000.0, causesSupported: 15, peopleReached: 5000,
      followers: 8900, following: 1200, isVerified: true,
    ),
    User(
      id: 'u4', name: 'James Mwangi', email: 'james@example.com', role: 'beneficiary',
      bio: 'Farmer & innovator | Kenya \u{1F1F0}\u{1F1EA} | Growing food, growing futures \u2600\uFE0F',
      avatarUrl: 'assets/images/avatars/u4.jpg', coverUrl: 'assets/images/covers/u4.jpg',
      totalActions: 5, totalDonated: 0, causesSupported: 0, peopleReached: 210,
      followers: 1800, following: 340, isVerified: true,
    ),
    User(
      id: 'u5', name: 'Elena Rodriguez', email: 'elena@example.com', role: 'supporter',
      bio: 'Artist & activist \u{1F3A8} | Turning creativity into action | Every brushstroke plants a seed.',
      avatarUrl: 'assets/images/avatars/u5.jpg', coverUrl: 'assets/images/covers/u5.jpg',
      totalActions: 33, totalDonated: 1800.0, causesSupported: 6, peopleReached: 190,
      followers: 2100, following: 560, isVerified: false,
    ),
    User(
      id: 'u6', name: 'Kenya Rise Foundation', email: 'info@kenyarise.org', role: 'partner',
      bio: 'Official partner | Empowering communities through education & enterprise \u{1F30D} 501(c)(3)',
      avatarUrl: 'assets/images/avatars/u6.jpg', coverUrl: 'assets/images/covers/u6.jpg',
      totalActions: 120, totalDonated: 25000.0, causesSupported: 22, peopleReached: 12000,
      followers: 15600, following: 890, isVerified: true,
    ),
  ];

  static final List<Cause> causes = [
    Cause(
      id: 'c1', title: 'Koudougou Community Center',
      description: 'Building a multi-purpose community center for 500+ families in Koudougou, Burkina Faso. A hub for education, connection, and growth.',
      imageUrl: 'assets/images/causes/c1.jpg',
      goal: 12000.0, raised: 8750.0, beneficiaryId: 'u2', beneficiaryName: 'Mama Fatima',
      supporters: 142, category: 'Community',
    ),
    Cause(
      id: 'c2', title: 'School Supplies Drive',
      description: 'Providing notebooks, textbooks, and school supplies to 5 rural schools in Kenya. Every child deserves tools to learn.',
      imageUrl: 'assets/images/causes/c2.jpg',
      goal: 8000.0, raised: 6200.0, beneficiaryId: 'u3', beneficiaryName: 'BridgeBuilders Africa',
      supporters: 98, category: 'Community',
    ),
    Cause(
      id: 'c3', title: 'Youth Leadership Program',
      description: 'Training 50 young leaders in coastal Bangladesh in advocacy, project management, and community organizing.',
      imageUrl: 'assets/images/causes/c3.jpg',
      goal: 15000.0, raised: 4500.0, beneficiaryId: 'u3', beneficiaryName: 'BridgeBuilders Africa',
      supporters: 67, category: 'environment',
    ),
    Cause(
      id: 'c4', title: 'Bakau Library Project',
      description: 'Building a community library at Bakau Primary School, The Gambia. 400 students gain access to books and digital learning.',
      imageUrl: 'assets/images/causes/c4.jpg',
      goal: 5000.0, raised: 4850.0, beneficiaryId: 'u2', beneficiaryName: 'Mama Fatima',
      supporters: 73, category: 'Community',
    ),
    Cause(
      id: 'c5', title: 'Scholarship Fund',
      description: 'Scholarships for 20 students from farming communities in northern Ghana. Education breaks the cycle of poverty.',
      imageUrl: 'assets/images/causes/c5.jpg',
      goal: 10000.0, raised: 3200.0, beneficiaryId: 'u4', beneficiaryName: 'James Mwangi',
      supporters: 45, category: 'agriculture',
    ),
    Cause(
      id: 'c6', title: 'Emergency Food Bank',
      description: 'Emergency food distribution for drought-affected communities in the Horn of Africa. No one goes hungry on our watch.',
      imageUrl: 'assets/images/causes/c6.jpg',
      goal: 20000.0, raised: 15300.0, beneficiaryId: 'u3', beneficiaryName: 'BridgeBuilders Africa',
      supporters: 231, category: 'relief',
    ),
    Cause(
      id: 'c7', title: 'Ololua Health Clinic',
      description: 'Community health clinic in Ololua, Kenya. Year-round access to primary care for 300 households.',
      imageUrl: 'assets/images/causes/c7.jpg',
      goal: 7000.0, raised: 2100.0, beneficiaryId: 'u4', beneficiaryName: 'James Mwangi',
      supporters: 28, category: 'Community',
    ),
  ];

  static final List<Story> stories = [
    Story(id: 's1', userId: 'u2', userName: 'Mama Fatima', category: 'community', isViewed: false, postedAt: DateTime(2026, 6, 22, 8), imageUrl: 'assets/images/stories/s1.jpg'),
    Story(id: 's2', userId: 'u1', userName: 'Sarah Green', category: 'community', isViewed: false, postedAt: DateTime(2026, 6, 22, 7), imageUrl: 'assets/images/stories/s2.jpg'),
    Story(id: 's3', userId: 'u3', userName: 'BridgeBuilders', category: 'environment', isViewed: true, postedAt: DateTime(2026, 6, 21, 18), imageUrl: 'assets/images/stories/s3.jpg'),
    Story(id: 's4', userId: 'u4', userName: 'James Mwangi', category: 'agriculture', isViewed: false, postedAt: DateTime(2026, 6, 22, 6), imageUrl: 'assets/images/stories/s4.jpg'),
    Story(id: 's5', userId: 'u5', userName: 'Elena R.', category: 'community', isViewed: true, postedAt: DateTime(2026, 6, 21, 14), imageUrl: 'assets/images/stories/s5.jpg'),
    Story(id: 's6', userId: 'u6', userName: 'KRF', category: 'community', isViewed: true, postedAt: DateTime(2026, 6, 21, 10), imageUrl: 'assets/images/stories/s6.jpg'),
    Story(id: 's7', userId: 'u2', userName: 'Mama Fatima', category: 'community', isViewed: false, postedAt: DateTime(2026, 6, 22, 9), imageUrl: 'assets/images/stories/s7.jpg'),
    Story(id: 's8', userId: 'u5', userName: 'Elena R.', category: 'relief', isViewed: false, postedAt: DateTime(2026, 6, 22, 5), imageUrl: 'assets/images/stories/s8.jpg'),
    Story(id: 's9', userId: 'u4', userName: 'James Mwangi', category: 'agriculture', isViewed: true, postedAt: DateTime(2026, 6, 21, 16), imageUrl: 'assets/images/stories/s9.jpg'),
    Story(id: 's10', userId: 'u1', userName: 'Sarah Green', category: 'environment', isViewed: false, postedAt: DateTime(2026, 6, 22, 4), imageUrl: 'assets/images/stories/s10.jpg'),
  ];

  static final List<Post> posts = [
    Post(
      id: 'p1', userId: 'u2', userName: 'Mama Fatima', userRole: 'beneficiary',
      caption: 'Morning light hits the baobab trees just right today \u{1F305} Nature is showing off. This is home. \u{1F1F8}\u{1F1F3} #Koudougou #Senegal #MorningMagic',
      category: 'environment', timestamp: DateTime(2026, 6, 22, 8), likes: 1234, comments: 56, shares: 89,
      type: 'photo', imageUrl: 'assets/images/posts/p1.jpg',
    ),
    Post(
      id: 'p2', userId: 'u1', userName: 'Sarah Green', userRole: 'supporter',
      caption: 'Found this little guy by the river today \u{1F426} Nature photography is my therapy. Shot on my phone! #BirdWatching #NatureLover',
      category: 'environment', timestamp: DateTime(2026, 6, 22, 7), likes: 892, comments: 34, shares: 12,
      type: 'photo', imageUrl: 'assets/images/posts/p2.jpg',
    ),
    Post(
      id: 'p3', userId: 'u4', userName: 'James Mwangi', userRole: 'beneficiary',
      caption: 'The tomatoes are coming in beautifully! \u{1F345} Two months of work with our new farming techniques. This is what sustainable agriculture looks like. #Farming #Kenya #FoodSecurity',
      category: 'agriculture', timestamp: DateTime(2026, 6, 21, 14), likes: 2156, comments: 89, shares: 234,
      type: 'photo', imageUrl: 'assets/images/posts/p3.jpg',
    ),
    Post(
      id: 'p4', userId: 'u5', userName: 'Elena Rodriguez', userRole: 'supporter',
      caption: 'New mural I finished for the community center \u{1F3A8} Titled "Growing Together" \u2014 because every action helps us flourish. 12ft x 8ft, acrylic on wall. #MuralArt #PublicArt #CreateForChange',
      category: 'community', timestamp: DateTime(2026, 6, 21, 11), likes: 3421, comments: 145, shares: 567,
      type: 'artwork', imageUrl: 'assets/images/posts/p4.jpg',
    ),
    Post(
      id: 'p5', userId: 'u6', userName: 'Kenya Rise Foundation', userRole: 'partner',
      caption: 'Phase 1 complete! \u2705 Three schools now have learning materials and updated classrooms. Hearing the kids laugh without worrying about the future \u2014 that is the real reward. \u{1F30D} #Education #Kenya #Impact',
      category: 'community', timestamp: DateTime(2026, 6, 21, 9), likes: 4532, comments: 178, shares: 891,
      type: 'photo', imageUrl: 'assets/images/posts/p5.jpg',
    ),
    Post(
      id: 'p6', userId: 'u3', userName: 'BridgeBuilders Africa', userRole: 'partner',
      caption: 'Behind the scenes at our newest community project! \u{1F3D7}\uFE0F The team is working through the heat because every brick laid means a stronger future. #CommunityFirst #WestAfrica',
      category: 'community', timestamp: DateTime(2026, 6, 20, 16), likes: 1876, comments: 67, shares: 234,
      type: 'video', imageUrl: 'assets/images/posts/p6.jpg',
    ),
    Post(
      id: 'p7', userId: 'u2', userName: 'Mama Fatima', userRole: 'beneficiary',
      caption: 'Drumming circle with the elders tonight \u{1F941} Music connects us to our ancestors. This rhythm is over 300 years old. #Culture #Senegal #Traditions',
      category: 'community', timestamp: DateTime(2026, 6, 20, 20), likes: 5621, comments: 234, shares: 1234,
      type: 'music', imageUrl: 'assets/images/posts/p7.jpg',
    ),
    Post(
      id: 'p8', userId: 'u1', userName: 'Sarah Green', userRole: 'supporter',
      caption: 'Golden hour at the reserve \u{1F304} Spent 4 hours waiting for this shot. Worth every minute. #WildlifePhotography #GoldenHour #Patience',
      category: 'environment', timestamp: DateTime(2026, 6, 19, 17), likes: 2100, comments: 78, shares: 156,
      type: 'photo', imageUrl: 'assets/images/posts/p8.jpg',
    ),
    Post(
      id: 'p9', userId: 'u4', userName: 'James Mwangi', userRole: 'beneficiary',
      caption: 'Quick sunset reel from the farm \u{1F305} This is what we work for every day. Peace, purpose, and progress. #FarmLife #SunsetReel #Kenya',
      category: 'agriculture', timestamp: DateTime(2026, 6, 19, 18), likes: 3210, comments: 145, shares: 678,
      type: 'reel', imageUrl: 'assets/images/posts/p9.jpg',
    ),
    Post(
      id: 'p10', userId: 'u5', userName: 'Elena Rodriguez', userRole: 'supporter',
      caption: 'Sketching ideas for my next piece \u{2702}\u{FE0F} Growth is the theme. What comes to mind when you think of growing together? Drop your thoughts below! \u{1F4AD} #ArtProcess #Growth',
      category: 'community', timestamp: DateTime(2026, 6, 18, 15), likes: 1456, comments: 234, shares: 89,
      type: 'artwork', imageUrl: 'assets/images/posts/p10.jpg',
    ),
    Post(
      id: 'p11', userId: 'u4', userName: 'James Mwangi', userRole: 'beneficiary',
      caption: 'Market day! \u{1F96C} Fresh vegetables grown sustainably. The community came out strong. Nothing beats farm-to-table. #MarketsOfKenya #FreshProduce',
      category: 'agriculture', timestamp: DateTime(2026, 6, 18, 10), likes: 1876, comments: 67, shares: 234,
      type: 'photo', imageUrl: 'assets/images/posts/p11.jpg',
    ),
    Post(
      id: 'p12', userId: 'u3', userName: 'BridgeBuilders Africa', userRole: 'partner',
      caption: 'We hit 15,000 supporters! \u{1F389} Thank you for turning your scrolls into impact. Every like, share, and comment helps us reach more communities. \u{1F30D} #Milestone #Gratitude',
      category: 'community', timestamp: DateTime(2026, 6, 17, 14), likes: 8910, comments: 456, shares: 2345,
      type: 'update', imageUrl: 'assets/images/posts/p12.jpg',
    ),
    Post(
      id: 'p13', userId: 'u2', userName: 'Mama Fatima', userRole: 'beneficiary',
      caption: 'The children of Koudougou made these drawings of our future community center \u{1F4D7} Their dreams are bigger than any hardship. Soon, every brick will be laid. \u{1F331}',
      category: 'community', timestamp: DateTime(2026, 6, 17, 8), likes: 7342, comments: 312, shares: 1890,
      type: 'artwork', imageUrl: 'assets/images/posts/p13.jpg',
    ),
    Post(
      id: 'p14', userId: 'u1', userName: 'Sarah Green', userRole: 'supporter',
      caption: 'Rainy day studio session \u{1F3B5} Put together this little guitar piece inspired by the sound of rainfall nurturing the earth. Hope it brings you peace. \u{1F3B8} #OriginalMusic #RainyDay #Guitar',
      category: 'environment', timestamp: DateTime(2026, 6, 16, 14), likes: 2134, comments: 123, shares: 456,
      type: 'music', imageUrl: 'assets/images/posts/p14.jpg',
    ),
    Post(
      id: 'p15', userId: 'u6', userName: 'Kenya Rise Foundation', userRole: 'partner',
      caption: 'Drone footage of our newest community learning center! \u{1F4F7} Serving an entire community. Building for good. \u{1F3D7}\uFE0F #Education #Impact #Community',
      category: 'community', timestamp: DateTime(2026, 6, 16, 11), likes: 5678, comments: 234, shares: 1234,
      type: 'reel', imageUrl: 'assets/images/posts/p15.jpg',
    ),
    Post(
      id: 'p16', userId: 'u4', userName: 'James Mwangi', userRole: 'beneficiary',
      caption: 'Proud moment \u{1F60A} Taught 20 local farmers about sustainable techniques today. Knowledge spreads faster than any seed. Together we grow. \u{1F331} #FarmerTraining #Community',
      category: 'agriculture', timestamp: DateTime(2026, 6, 15, 13), likes: 2890, comments: 134, shares: 567,
      type: 'photo', imageUrl: 'assets/images/posts/p16.jpg',
    ),
    Post(
      id: 'p17', userId: 'u5', userName: 'Elena Rodriguez', userRole: 'supporter',
      caption: 'Acrylic pour experiment \u{1F3A8} Green and gold \u2014 growth and light. Sometimes the best art comes from happy accidents. #FluidArt #AbstractArt #Create',
      category: 'community', timestamp: DateTime(2026, 6, 15, 10), likes: 1678, comments: 89, shares: 234,
      type: 'artwork', imageUrl: 'assets/images/posts/p17.jpg',
    ),
    Post(
      id: 'p18', userId: 'u2', userName: 'Mama Fatima', userRole: 'beneficiary',
      caption: 'Sneak peek of something special we have been working on \u{1F914} Stay tuned. Big things coming for Koudougou. #ComingSoon #Excited',
      category: 'community', timestamp: DateTime(2026, 6, 14, 16), likes: 4532, comments: 567, shares: 890,
      type: 'reel', imageUrl: 'assets/images/posts/p18.jpg',
    ),
  ];

  static final List<Ad> ads = [
    Ad(
      id: 'a1', title: 'Sponsored',
      description: 'Join 10,000+ creators on Water This Plant. Share your story, build your audience, and grow real impact. Sign up free.',
      category: 'community', ctaText: 'Get Started', imageUrl: 'assets/images/ads/a1.jpg',
    ),
    Ad(
      id: 'a2', title: 'Sponsored',
      description: 'Your company can amplify verified beneficiaries through our Partner Program. Real impact, real transparency.',
      category: 'environment', ctaText: 'Become a Partner', imageUrl: 'assets/images/ads/a2.jpg',
    ),
    Ad(
      id: 'a3', title: 'Sponsored',
      description: 'Turn your daily scroll into change. Premium members auto-support causes with every like and share. Join now.',
      category: 'community', ctaText: 'Try Premium', imageUrl: 'assets/images/ads/a3.jpg',
    ),
  ];

  static final List<GrowthAction> growthActions = [
    GrowthAction(id: 'd1', userId: 'u1', causeId: 'c1', causeTitle: 'Koudougou Community Center', amount: 50, points: 500, timestamp: DateTime(2026, 6, 20), type: 'donation', message: 'Keep going, Mama Fatima!'),
    GrowthAction(id: 'd2', userId: 'u1', targetUserId: 'u4', targetPostId: 'p3', points: 10, timestamp: DateTime(2026, 6, 20), type: 'like', message: 'Liked James\'s tomato harvest post'),
    GrowthAction(id: 'd3', userId: 'u1', targetUserId: 'u2', targetPostId: 'p7', points: 15, timestamp: DateTime(2026, 6, 20), type: 'comment', message: 'Commented on Mama Fatima\'s drumming post'),
    GrowthAction(id: 'd4', userId: 'u1', causeId: 'c4', causeTitle: 'Bakau Library Project', amount: 75, points: 750, timestamp: DateTime(2026, 6, 19), type: 'donation'),
    GrowthAction(id: 'd5', userId: 'u1', targetUserId: 'u5', targetPostId: 'p4', points: 5, timestamp: DateTime(2026, 6, 19), type: 'share', message: 'Shared Elena\'s mural with followers'),
    GrowthAction(id: 'd6', userId: 'u1', targetUserId: 'u6', targetPostId: 'p5', points: 3, timestamp: DateTime(2026, 6, 18), type: 'save', message: 'Saved KRF\'s school project post'),
    GrowthAction(id: 'd7', userId: 'u1', targetUserId: 'u4', targetPostId: 'p9', points: 10, timestamp: DateTime(2026, 6, 18), type: 'like', message: 'Liked James\'s sunset reel'),
    GrowthAction(id: 'd8', userId: 'u1', causeId: 'c6', causeTitle: 'Emergency Food Bank', amount: 200, points: 2000, timestamp: DateTime(2026, 6, 17), type: 'donation', message: 'Emergency support for Horn of Africa'),
    GrowthAction(id: 'd9', userId: 'u5', targetUserId: 'u2', targetPostId: 'p13', points: 10, timestamp: DateTime(2026, 6, 17), type: 'like', message: 'Liked the children\'s drawings post'),
    GrowthAction(id: 'd10', userId: 'u5', targetUserId: 'u1', targetPostId: 'p14', points: 15, timestamp: DateTime(2026, 6, 16), type: 'comment', message: 'Complimented Sarah\'s guitar piece'),
    GrowthAction(id: 'd11', userId: 'u5', causeId: 'c3', causeTitle: 'Youth Leadership Program', amount: 80, points: 800, timestamp: DateTime(2026, 6, 16), type: 'donation'),
  ];

  static final List<FundTransaction> transactions = [
    FundTransaction(id: 't1', causeId: 'c1', causeTitle: 'Koudougou Community Center', amount: 8750.0, description: 'Total raised from 142 supporters', date: DateTime(2026, 6, 20), category: 'funds received'),
    FundTransaction(id: 't2', causeId: 'c1', causeTitle: 'Koudougou Community Center', amount: 3200.0, description: 'Building materials - roofing & cement', date: DateTime(2026, 6, 18), category: 'equipment'),
    FundTransaction(id: 't3', causeId: 'c1', causeTitle: 'Koudougou Community Center', amount: 1500.0, description: 'Transport & logistics', date: DateTime(2026, 6, 15), category: 'logistics'),
    FundTransaction(id: 't4', causeId: 'c1', causeTitle: 'Koudougou Community Center', amount: 800.0, description: 'Community labor wages', date: DateTime(2026, 6, 12), category: 'labor'),
    FundTransaction(id: 't5', causeId: 'c1', causeTitle: 'Koudougou Community Center', amount: 200.0, description: 'Administrative costs', date: DateTime(2026, 6, 10), category: 'admin'),
    FundTransaction(id: 't6', causeId: 'c2', causeTitle: 'School Supplies Drive', amount: 6200.0, description: 'Total raised from 98 supporters', date: DateTime(2026, 6, 19), category: 'funds received'),
    FundTransaction(id: 't7', causeId: 'c2', causeTitle: 'School Supplies Drive', amount: 2800.0, description: 'Textbooks & notebooks purchase', date: DateTime(2026, 6, 17), category: 'equipment'),
    FundTransaction(id: 't8', causeId: 'c2', causeTitle: 'School Supplies Drive', amount: 1200.0, description: 'Desks & classroom furniture', date: DateTime(2026, 6, 14), category: 'equipment'),
    FundTransaction(id: 't9', causeId: 'c6', causeTitle: 'Emergency Food Bank', amount: 15300.0, description: 'Total raised from 231 supporters', date: DateTime(2026, 6, 20), category: 'funds received'),
    FundTransaction(id: 't10', causeId: 'c6', causeTitle: 'Emergency Food Bank', amount: 7000.0, description: 'Food distribution (30 days)', date: DateTime(2026, 6, 16), category: 'operations'),
    FundTransaction(id: 't11', causeId: 'c6', causeTitle: 'Emergency Food Bank', amount: 3500.0, description: 'Nutritional supplies (50,000 units)', date: DateTime(2026, 6, 13), category: 'supplies'),
    FundTransaction(id: 't12', causeId: 'c6', causeTitle: 'Emergency Food Bank', amount: 1000.0, description: 'Distribution coordination', date: DateTime(2026, 6, 11), category: 'logistics'),
  ];

  static final Map<String, List<String>> userGradients = {
    'u1': ['#0D9488', '#14B8A6'],
    'u2': ['#059669', '#34D399'],
    'u3': ['#0284C7', '#38BDF8'],
    'u4': ['#D97706', '#FBBF24'],
    'u5': ['#8B5CF6', '#A78BFA'],
    'u6': ['#F43F5E', '#FB7185'],
  };

  static final Map<String, User> _userMap = {for (final u in users) u.id: u};

  static User get currentUser => users[0];
  static User userById(String id) => _userMap[id] ?? users[0];

  static List<Story> userStories(String userId) =>
      stories.where((s) => s.userId == userId).toList();

  static List<Post> userPosts(String userId) =>
      posts.where((p) => p.userId == userId).toList();

  static List<GrowthAction> userActions(String userId) =>
      growthActions.where((d) => d.userId == userId).toList();

  static List<Cause> beneficiaryCauses(String userId) =>
      causes.where((c) => c.beneficiaryId == userId).toList();

  static int userDonationCount(String userId) =>
      userActions(userId).where((d) => d.type == 'donation').length;

  static double userDonationAmount(String userId) =>
      userActions(userId).fold<double>(0, (s, d) => s + d.amount);

  static int userEngagementPoints(String userId) =>
      userActions(userId).fold<int>(0, (s, d) => s + d.points);

  static int getUserLevel(int actionCount) {
    if (actionCount >= 100) return 5;
    if (actionCount >= 50) return 4;
    if (actionCount >= 25) return 3;
    if (actionCount >= 10) return 2;
    return 1;
  }

  static double getLevelProgress(int points) {
    if (points >= 10000) return 1.0;
    if (points >= 5000) return (points - 5000) / 5000;
    if (points >= 2500) return (points - 2500) / 2500;
    if (points >= 1000) return (points - 1000) / 1500;
    return points / 1000;
  }
}
