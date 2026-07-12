import 'package:flutter/material.dart';
import 'package:water_this_plant/data/mock_data.dart';
import 'package:water_this_plant/models/growth_action.dart';

class ImpactScreen extends StatelessWidget {
  const ImpactScreen({super.key});

  String _formatDate(DateTime dt) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}';
  }

  String _formatCount(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;
    final actions = MockData.userActions(user.id);
    final totalPoints = MockData.userEngagementPoints(user.id);
    final level = MockData.getUserLevel(user.totalActions);
    final progress = MockData.getLevelProgress(totalPoints);

    final badges = <Map<String, dynamic>>[
      {'icon': Icons.favorite_rounded, 'label': 'First Like', 'earned': actions.any((d) => d.type == 'like')},
      {'icon': Icons.chat_bubble_rounded, 'label': 'Commenter', 'earned': actions.any((d) => d.type == 'comment')},
      {'icon': Icons.share_rounded, 'label': 'Sharer', 'earned': actions.any((d) => d.type == 'share')},
      {'icon': Icons.bookmark_rounded, 'label': 'Collector', 'earned': actions.any((d) => d.type == 'save')},
      {'icon': Icons.eco_rounded, 'label': 'Supporter', 'earned': actions.any((d) => d.type == 'donation')},
      {'icon': Icons.rocket_launch_rounded, 'label': 'Rising Star', 'earned': totalPoints >= 1000},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Impact', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Color(0xFF0F172A)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF0D9488), Color(0xFF059669)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.eco_rounded, size: 30, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  _formatCount(totalPoints),
                  style: const TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
                ),
                const Text('Impact Points', style: TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.local_fire_department_rounded, color: Colors.amber, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        'Level $level Grower',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 5,
                    backgroundColor: Colors.white.withValues(alpha: 0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  level < 5 ? '${((1 - progress) * 2500).round()} pts to Level ${level + 1}' : 'Max Level',
                  style: const TextStyle(color: Colors.white60, fontSize: 11),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _item('${user.totalActions}', 'Actions'),
                    _item('${MockData.userDonationCount(user.id)}', 'Donations'),
                    _item('${actions.length}', 'Engagements'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Achievements', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 12),
          SizedBox(
            height: 74,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: badges.length,
              itemBuilder: (context, index) {
                final badge = badges[index];
                final earned = badge['earned'] as bool;
                return Container(
                  width: 66,
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: earned ? const Color(0xFF0D9488).withValues(alpha: 0.1) : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(12),
                          border: earned ? Border.all(color: const Color(0xFF0D9488), width: 1.5) : null,
                        ),
                        child: Icon(
                          badge['icon'] as IconData,
                          color: earned ? const Color(0xFF0D9488) : const Color(0xFFCBD5E1),
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        badge['label'] as String,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9,
                          color: earned ? const Color(0xFF0F172A) : const Color(0xFFCBD5E1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          const Text('Activity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 12),
          ...actions.map((GrowthAction action) {
            final iconColor = action.type == 'donation' ? const Color(0xFF0D9488)
                : action.type == 'like' ? Colors.red
                : action.type == 'comment' ? const Color(0xFF0284C7)
                : action.type == 'share' ? const Color(0xFF8B5CF6)
                : action.type == 'save' ? const Color(0xFFD97706)
                : const Color(0xFF0D9488);
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: iconColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(action.typeIcon, color: iconColor, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          action.message.isNotEmpty ? action.message : '${action.type[0].toUpperCase()}${action.type.substring(1)} action',
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF0F172A)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(_formatDate(action.timestamp),
                              style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                            if (action.points > 0) ...[
                              const SizedBox(width: 8),
                              Text('+${action.points} pts',
                                style: const TextStyle(fontSize: 11, color: Color(0xFF0D9488), fontWeight: FontWeight.w600)),
                            ],
                            if (action.amount > 0) ...[
                              const SizedBox(width: 8),
                              Text('\$${action.amount.toStringAsFixed(0)}',
                                style: const TextStyle(fontSize: 11, color: Color(0xFF0D9488), fontWeight: FontWeight.w600)),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _item(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
