import 'package:flutter/material.dart';
import 'package:water_this_plant/data/mock_data.dart';
import 'package:water_this_plant/models/user.dart';
import 'package:water_this_plant/models/post.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;
    final userPosts = MockData.userPosts(user.id);
    final photos = userPosts.where((p) => p.type == 'photo').toList();
    final reels = userPosts.where((p) => p.type == 'reel').toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF0F172A))),
            if (user.isVerified) ...[
              const SizedBox(width: 4),
              const Icon(Icons.verified_rounded, size: 16, color: Color(0xFF0D9488)),
            ],
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Color(0xFF0F172A)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu_rounded, color: Color(0xFF0F172A)),
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xFF0D9488).withValues(alpha: 0.2),
                        child: Text(
                          user.name[0],
                          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0D9488)),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _stat('${userPosts.length}', 'Posts'),
                            _stat(_formatCount(user.followers), 'Followers'),
                            _stat(_formatCount(user.following), 'Following'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A))),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0D9488).withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                user.role[0].toUpperCase() + user.role.substring(1),
                                style: const TextStyle(fontSize: 10, color: Color(0xFF0D9488), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(user.bio, style: const TextStyle(fontSize: 13, color: Color(0xFF0F172A), height: 1.4)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 36,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              side: const BorderSide(color: Color(0xFFE2E8F0)),
                              foregroundColor: const Color(0xFF0F172A),
                            ),
                            child: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            side: const BorderSide(color: Color(0xFFE2E8F0)),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Icon(Icons.people_outline, size: 18, color: Color(0xFF0F172A)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyTabBar(
              TabBar(
                controller: _tabController,
                indicatorColor: const Color(0xFF0F172A),
                indicatorWeight: 1,
                labelColor: const Color(0xFF0F172A),
                unselectedLabelColor: const Color(0xFF94A3B8),
                tabs: const [
                  Tab(icon: Icon(Icons.grid_view_rounded, size: 22)),
                  Tab(icon: Icon(Icons.smart_display_outlined, size: 22)),
                  Tab(icon: Icon(Icons.info_outline_rounded, size: 22)),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildGrid(photos, 'photo'),
            _buildGrid(reels, 'reel'),
            _buildAbout(user),
          ],
        ),
      ),
    );
  }

  String _formatCount(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return '$n';
  }

  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
      ],
    );
  }

  Widget _buildGrid(List<Post> items, String type) {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            children: [
              Icon(type == 'photo' ? Icons.photo_camera_outlined : Icons.smart_display_outlined, size: 48, color: const Color(0xFFCBD5E1)),
              const SizedBox(height: 12),
              Text('No ${type}s yet', style: const TextStyle(color: Color(0xFF94A3B8))),
            ],
          ),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        final post = items[index];
        Color color;
        switch (post.category) {
          case 'water': color = const Color(0xFF0D9488); break;
          case 'environment': color = const Color(0xFF059669); break;
          case 'agriculture': color = const Color(0xFFD97706); break;
          case 'relief': color = const Color(0xFFDC2626); break;
          default: color = const Color(0xFF0D9488);
        }
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.6)]),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(child: Icon(Icons.water_drop_rounded, color: Colors.white.withValues(alpha: 0.25), size: 28)),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                color: Colors.black.withValues(alpha: 0.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite_rounded, size: 10, color: Colors.white70),
                    const SizedBox(width: 3),
                    Text('${post.likes}', style: const TextStyle(color: Colors.white70, fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAbout(User user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 16),
          _infoRow(Icons.water_drop_outlined, 'Water Drops', '${user.totalDrops}'),
          _infoRow(Icons.monetization_on_outlined, 'Donated', '\$${user.totalDonated.toStringAsFixed(0)}'),
          _infoRow(Icons.favorite_outlined, 'Causes Supported', '${user.causesSupported}'),
          _infoRow(Icons.people_outlined, 'People Reached', '${user.peopleReached}'),
          _infoRow(Icons.mail_outline, 'Email', user.email),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF94A3B8)),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
          const Spacer(),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF0F172A), fontSize: 13)),
        ],
      ),
    );
  }
}

class _StickyTabBar extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _StickyTabBar(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  bool shouldRebuild(_StickyTabBar old) => false;
}
