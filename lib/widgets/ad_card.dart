import 'package:flutter/material.dart';
import 'package:water_this_plant/models/ad.dart';

class AdCard extends StatelessWidget {
  final Ad ad;

  const AdCard({super.key, required this.ad});

  Color _categoryColor(String cat) {
    switch (cat) {
      case 'water': return const Color(0xFF0D9488);
      case 'environment': return const Color(0xFF059669);
      case 'agriculture': return const Color(0xFFD97706);
      case 'relief': return const Color(0xFFDC2626);
      default: return const Color(0xFF0D9488);
    }
  }

  IconData _categoryIcon(String cat) {
    switch (cat) {
      case 'water': return Icons.water_drop_rounded;
      case 'environment': return Icons.eco_rounded;
      case 'agriculture': return Icons.grass_rounded;
      case 'relief': return Icons.volunteer_activism_rounded;
      default: return Icons.water_drop_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _categoryColor(ad.category);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
            child: Row(
              children: [
                Icon(Icons.adjust, size: 16, color: Colors.amber[700]),
                const SizedBox(width: 6),
                Text(
                  ad.title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber[700],
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.info_outline, size: 14, color: Color(0xFF94A3B8)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.withValues(alpha: 0.8), color.withValues(alpha: 0.4)],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(_categoryIcon(ad.category), size: 56, color: Colors.white.withValues(alpha: 0.3)),
                  Positioned(
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        ad.ctaText,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              ad.description,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF475569),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
