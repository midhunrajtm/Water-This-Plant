import 'package:flutter/material.dart';

class WaterDrop {
  final String id;
  final String userId;
  final String? causeId;
  final String? causeTitle;
  final String? targetUserId;
  final String? targetPostId;
  final double amount;
  final int points;
  final DateTime timestamp;
  final String type;
  final String message;

  const WaterDrop({
    required this.id,
    required this.userId,
    this.causeId,
    this.causeTitle,
    this.targetUserId,
    this.targetPostId,
    this.amount = 0,
    this.points = 0,
    required this.timestamp,
    this.type = 'donation',
    this.message = '',
  });

  IconData get typeIcon {
    switch (type) {
      case 'donation':
        return Icons.water_drop_rounded;
      case 'share':
        return Icons.share_rounded;
      case 'like':
        return Icons.favorite_rounded;
      case 'comment':
        return Icons.chat_bubble_rounded;
      case 'save':
        return Icons.bookmark_rounded;
      case 'volunteer':
        return Icons.handshake_rounded;
      default:
        return Icons.water_drop_rounded;
    }
  }
}
