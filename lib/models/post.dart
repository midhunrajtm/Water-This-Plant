class Post {
  final String id;
  final String userId;
  final String userName;
  final String userRole;
  final String caption;
  final String category;
  final DateTime timestamp;
  final int likes;
  final int comments;
  final int shares;
  bool isLiked;
  bool isSaved;
  final String type;
  final String? causeId;
  final String? causeTitle;
  final String? imageUrl;

  Post({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userRole,
    required this.caption,
    this.category = 'community',
    required this.timestamp,
    required this.likes,
    required this.comments,
    this.shares = 0,
    this.isLiked = false,
    this.isSaved = false,
    this.type = 'photo',
    this.causeId,
    this.causeTitle,
    this.imageUrl,
  });
}
