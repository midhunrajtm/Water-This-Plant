import 'package:flutter/material.dart';
import 'package:water_this_plant/models/story.dart';

class StoryBubble extends StatelessWidget {
  final Story story;
  final VoidCallback onTap;

  const StoryBubble({super.key, required this.story, required this.onTap});

  Color _categoryColor(String cat) {
    switch (cat) {
      case 'community': return const Color(0xFF0D9488);
      case 'environment': return const Color(0xFF059669);
      case 'agriculture': return const Color(0xFFD97706);
      case 'relief': return const Color(0xFFDC2626);
      default: return const Color(0xFF0D9488);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _categoryColor(story.category);
    final initials = story.userName.split(' ').map((w) => w[0]).take(2).join();

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: story.isViewed
                    ? LinearGradient(colors: [Colors.grey[400]!, Colors.grey[300]!])
                    : LinearGradient(
                        colors: [color, const Color(0xFF0D9488)],
                      ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(3),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color, color.withValues(alpha: 0.7)],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      initials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 72,
              child: Text(
                story.userName,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11,
                  color: story.isViewed ? Colors.grey : const Color(0xFF0F172A),
                  fontWeight: story.isViewed ? FontWeight.normal : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
