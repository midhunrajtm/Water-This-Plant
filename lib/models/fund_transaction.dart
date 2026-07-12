class FundTransaction {
  final String id;
  final String causeId;
  final String causeTitle;
  final double amount;
  final String description;
  final DateTime date;
  final String category;

  const FundTransaction({
    required this.id,
    required this.causeId,
    required this.causeTitle,
    required this.amount,
    required this.description,
    required this.date,
    this.category = 'General',
  });

  bool get isIncoming => category == 'funds received';
}
