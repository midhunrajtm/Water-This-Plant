class Ad {
  final String id;
  final String title;
  final String description;
  final String category;
  final String ctaText;

  const Ad({
    required this.id,
    required this.title,
    required this.description,
    this.category = 'water',
    this.ctaText = 'Learn More',
  });
}
