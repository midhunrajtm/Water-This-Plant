class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String avatarUrl;
  final String bio;
  final String coverUrl;
  final int totalDrops;
  final double totalDonated;
  final int causesSupported;
  final int peopleReached;
  final int followers;
  final int following;
  final bool isVerified;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.avatarUrl = '',
    this.bio = '',
    this.coverUrl = '',
    this.totalDrops = 0,
    this.totalDonated = 0.0,
    this.causesSupported = 0,
    this.peopleReached = 0,
    this.followers = 0,
    this.following = 0,
    this.isVerified = false,
  });
}
