class Cause {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double goal;
  final double raised;
  final String beneficiaryId;
  final String beneficiaryName;
  final String beneficiaryAvatar;
  final String status;
  final int supporters;
  final String category;

  const Cause({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl = '',
    required this.goal,
    required this.raised,
    required this.beneficiaryId,
    required this.beneficiaryName,
    this.beneficiaryAvatar = '',
    this.status = 'active',
    this.supporters = 0,
    this.category = 'General',
  });

  double get progress => goal > 0 ? raised / goal : 0.0;
}
