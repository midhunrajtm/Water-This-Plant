class MonthlyReport {
  final int year;
  final int month;
  final double revenue;
  final double donated;
  final double expenses;

  const MonthlyReport({
    required this.year,
    required this.month,
    required this.revenue,
    required this.donated,
    required this.expenses,
  });

  String get monthLabel {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return months[month - 1];
  }

  String get label => '$monthLabel $year';

  double get reserved => revenue - donated - expenses;
}
