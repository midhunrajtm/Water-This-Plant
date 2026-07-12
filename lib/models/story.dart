class Story {
  final String id;
  final String userId;
  final String userName;
  final String category;
  bool isViewed;
  final DateTime postedAt;

  Story({
    required this.id,
    required this.userId,
    required this.userName,
    this.category = 'community',
    this.isViewed = false,
    required this.postedAt,
  });
}
