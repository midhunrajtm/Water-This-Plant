import 'package:flutter/material.dart';
import 'package:water_this_plant/data/mock_data.dart';
import 'package:water_this_plant/models/post.dart';
import 'package:water_this_plant/screens/beneficiary_profile_screen.dart';

class DiscoverTab extends StatefulWidget {
  const DiscoverTab({super.key});

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab> {
  String _searchQuery = '';
  String _selectedType = 'All';

  final _types = ['All', 'Photo', 'Reel', 'Artwork', 'Music'];

  Color _typeColor(String t) {
    switch (t) {
      case 'Photo': return const Color(0xFF059669);
      case 'Reel': return const Color(0xFFDC2626);
      case 'Artwork': return const Color(0xFF8B5CF6);
      case 'Music': return const Color(0xFFD97706);
      default: return const Color(0xFF0D9488);
    }
  }

  List<Post> get _filteredPosts {
    var result = MockData.posts;
    if (_selectedType != 'All') {
      result = result.where((p) =>
        p.type.toLowerCase() == _selectedType.toLowerCase()
      ).toList();
    }
    if (_searchQuery.isNotEmpty) {
      result = result.where((p) =>
        p.caption.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        p.userName.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF0F172A))),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (v) => setState(() => _searchQuery = v),
              decoration: InputDecoration(
                hintText: 'Search posts & creators...',
                prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF94A3B8)),
                filled: true,
                fillColor: const Color(0xFFF1F5F9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 34,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _types.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final t = _types[index];
                  final isSelected = _selectedType == t;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedType = t),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                      decoration: BoxDecoration(
                        color: isSelected ? _typeColor(t).withValues(alpha: 0.1) : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(18),
                        border: isSelected ? Border.all(color: _typeColor(t)) : null,
                      ),
                      child: Text(
                        t,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          color: isSelected ? _typeColor(t) : const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Trending Creators',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: MockData.users.length,
                itemBuilder: (context, index) {
                  final user = MockData.users[index];
                  final color = const Color(0xFF0D9488);
                  return GestureDetector(
                    onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BeneficiaryProfileScreen(userId: user.id))),
                    child: Container(
                      width: 90,
                      margin: const EdgeInsets.only(right: 12),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: color.withValues(alpha: 0.2),
                                child: Text(user.name[0],
                                  style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 24)),
                              ),
                              if (user.isVerified)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.verified_rounded, size: 14, color: Color(0xFF0D9488)),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(user.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF0F172A))),
                          Text('${user.followers} followers',
                            style: const TextStyle(fontSize: 9, color: Color(0xFF94A3B8))),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'For You',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredPosts.length > 9 ? 9 : _filteredPosts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final post = _filteredPosts[index];
    Color color;
    switch (post.category) {
      case 'community': color = const Color(0xFF0D9488); break;
      case 'environment': color = const Color(0xFF059669); break;
      case 'agriculture': color = const Color(0xFFD97706); break;
      case 'relief': color = const Color(0xFFDC2626); break;
      default: color = const Color(0xFF0D9488);
    }
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [color, color.withValues(alpha: 0.6)]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Stack(
                    children: [
                      Center(child: Icon(Icons.eco_rounded, color: Colors.white.withValues(alpha: 0.25), size: 24)),
                      if (post.type == 'reel')
                        Positioned(
                          bottom: 4, right: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Text('REEL', style: TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.bold)),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
