import 'package:flutter/material.dart';
import 'package:water_this_plant/data/mock_data.dart';
import 'package:water_this_plant/models/post.dart';
import 'package:water_this_plant/models/story.dart';
import 'package:water_this_plant/models/ad.dart';
import 'package:water_this_plant/widgets/story_bubble.dart';
import 'package:water_this_plant/widgets/feed_post.dart';
import 'package:water_this_plant/widgets/ad_card.dart';
import 'package:water_this_plant/screens/beneficiary_profile_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late List<Story> _stories;
  late List<dynamic> _feedItems;

  @override
  void initState() {
    super.initState();
    _stories = List.from(MockData.stories);
    _buildFeed();
  }

  void _buildFeed() {
    _feedItems = [];
    int postCount = 0;
    for (final post in MockData.posts) {
      _feedItems.add(post);
      postCount++;
      if (postCount % 5 == 0 && postCount < MockData.posts.length) {
        final adIndex = (postCount ~/ 5) - 1;
        if (adIndex < MockData.ads.length) {
          _feedItems.add(MockData.ads[adIndex]);
        }
      }
    }
  }

  void _markStoryViewed(int index) {
    setState(() => _stories[index].isViewed = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.eco_rounded, color: Color(0xFF0D9488), size: 28),
            SizedBox(width: 6),
            Text(
              'Water This Plant',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF0F172A)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline_rounded, color: Color(0xFF0F172A)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Color(0xFF0F172A)),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 800));
          setState(() {
            _stories = List.from(MockData.stories);
            _buildFeed();
          });
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 4, bottom: 16),
          itemCount: _feedItems.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _stories.length,
                    itemBuilder: (context, i) => StoryBubble(
                      story: _stories[i],
                      onTap: () => _markStoryViewed(i),
                    ),
                  ),
                ),
              );
            }
            final item = _feedItems[index - 1];
            if (item is Post) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: FeedPost(
                  post: item,
                  onAvatarTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BeneficiaryProfileScreen(userId: item.userId),
                    ),
                  ),
                ),
              );
            }
            if (item is Ad) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: AdCard(ad: item),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
