class DonationTransaction {
  final String id;
  final DateTime date;
  final double amount;
  final String beneficiary;
  final String category;
  final String status;
  final String shortDescription;
  final String? receiptImageUrl;
  final String? beneficiaryUpdateImageUrl;
  final bool isVerified;

  const DonationTransaction({
    required this.id,
    required this.date,
    required this.amount,
    required this.beneficiary,
    required this.category,
    required this.status,
    this.shortDescription = '',
    this.receiptImageUrl,
    this.beneficiaryUpdateImageUrl,
    this.isVerified = false,
  });
}
