import 'package:flutter/material.dart';
import 'package:water_this_plant/data/mock_data.dart';
import 'package:water_this_plant/models/user.dart';
import 'package:water_this_plant/models/post.dart';
import 'package:water_this_plant/widgets/cause_card_widget.dart';

class BeneficiaryProfileScreen extends StatefulWidget {
  final String userId;

  const BeneficiaryProfileScreen({super.key, required this.userId});

  @override
  State<BeneficiaryProfileScreen> createState() => _BeneficiaryProfileScreenState();
}

class _BeneficiaryProfileScreenState extends State<BeneficiaryProfileScreen> with SingleTickerProviderStateMixin {
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

  Color _roleColor(String role) {
    switch (role) {
      case 'beneficiary': return const Color(0xFF0D9488);
      case 'partner': return const Color(0xFF0284C7);
      case 'supporter': return const Color(0xFF8B5CF6);
      default: return const Color(0xFF0D9488);
    }
  }

  String _formatCount(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    final user = MockData.userById(widget.userId);
    final color = _roleColor(user.role);
    final userCauses = MockData.beneficiaryCauses(widget.userId);
    final userPosts = MockData.userPosts(widget.userId);
    final photos = userPosts.where((p) => p.type == 'photo').toList();
    final reels = userPosts.where((p) => p.type == 'reel').toList();

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color, color.withValues(alpha: 0.6)],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 33,
                        backgroundColor: color.withValues(alpha: 0.2),
                        child: Stack(
                          children: [
                            Text(user.name[0],
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: color)),
                            if (user.isVerified)
                              Positioned(
                                bottom: 0, right: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.verified_rounded, size: 12, color: color),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(user.name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                    const SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${user.role[0].toUpperCase()}${user.role.substring(1)}',
                        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(user.bio, textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, height: 1.4)),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _stat('${userPosts.length}', 'Posts'),
                        _stat(_formatCount(user.followers), 'Followers'),
                        _stat(_formatCount(user.following), 'Following'),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: color,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              child: const Text('Follow'),
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
                            child: const Icon(Icons.send_outlined, size: 18, color: Color(0xFF0F172A)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          // Cause Card section (if beneficiary has causes)
          if (userCauses.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.eco_rounded, size: 16, color: Color(0xFF0D9488)),
                          const SizedBox(width: 6),
                          const Text('Cause', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                        ],
                      ),
                    ),
                    ...userCauses.map((cause) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CauseCardWidget(cause: cause),
                    )),
                  ],
                ),
              ),
            ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyTabBar2(
              TabBar(
                controller: _tabController,
                indicatorColor: color,
                indicatorWeight: 1,
                labelColor: color,
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
            _buildGrid(photos, color),
            _buildGrid(reels, color),
            _buildAbout(user, color),
          ],
        ),
      ),
    );
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

  Widget _buildGrid(List<Post> items, Color color) {
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            children: [
              Icon(Icons.photo_camera_outlined, size: 48, color: const Color(0xFFCBD5E1)),
              const SizedBox(height: 12),
              const Text('No posts yet', style: TextStyle(color: Color(0xFF94A3B8))),
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
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.6)]),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Center(child: Icon(Icons.eco_rounded, color: Colors.white.withValues(alpha: 0.25), size: 28)),
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

  Widget _buildAbout(User user, Color color) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('About', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 16),
          _infoRow(Icons.people_outlined, 'People Reached', '${user.peopleReached}'),
          _infoRow(Icons.eco_outlined, 'Actions', '${user.totalActions}'),
          _infoRow(Icons.monetization_on_outlined, 'Total Raised', '\$${user.totalDonated.toStringAsFixed(0)}'),
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

class _StickyTabBar2 extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _StickyTabBar2(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  bool shouldRebuild(_StickyTabBar2 old) => false;
}
