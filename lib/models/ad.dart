class Ad {
  final String id;
  final String title;
  final String description;
  final String category;
  final String ctaText;
  final String? imageUrl;

  const Ad({
    required this.id,
    required this.title,
    required this.description,
    this.category = 'community',
    this.ctaText = 'Learn More',
    this.imageUrl,
  });
}
