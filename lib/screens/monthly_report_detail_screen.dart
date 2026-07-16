import 'package:flutter/material.dart';
import 'package:water_this_plant/models/monthly_report.dart';

class MonthlyReportDetailScreen extends StatelessWidget {
  final MonthlyReport report;
  const MonthlyReportDetailScreen({super.key, required this.report});

  static const _emerald = Color(0xFF059669);

  String _formatCurrency(double amount) {
    final numStr = amount.toStringAsFixed(0);
    if (numStr.length <= 3) return '\u20B9$numStr';
    final last3 = numStr.substring(numStr.length - 3);
    final rest = numStr.substring(0, numStr.length - 3);
    final withCommas = StringBuffer();
    for (int i = 0; i < rest.length; i++) {
      if (i > 0 && (rest.length - i) % 2 == 0) withCommas.write(',');
      withCommas.write(rest[i]);
    }
    return '\u20B9$withCommas,$last3';
  }

  @override
  Widget build(BuildContext context) {
    final r = report;
    final donatedPercent = r.revenue > 0 ? r.donated / r.revenue : 0.0;
    final expensesPercent = r.revenue > 0 ? r.expenses / r.revenue : 0.0;
    final reservedPercent = r.revenue > 0 ? r.reserved / r.revenue : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(r.label),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: _emerald.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '${r.month}',
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _emerald),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(r.label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: _reportStatCard('Revenue', _formatCurrency(r.revenue), Icons.trending_up_rounded, _emerald)),
                    const SizedBox(width: 10),
                    Expanded(child: _reportStatCard('Donated', _formatCurrency(r.donated), Icons.favorite_rounded, const Color(0xFF0D9488))),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: _reportStatCard('Expenses', _formatCurrency(r.expenses), Icons.settings_rounded, const Color(0xFFD97706))),
                    const SizedBox(width: 10),
                    Expanded(child: _reportStatCard('Reserved', _formatCurrency(r.reserved), Icons.account_balance_wallet_rounded, const Color(0xFF0284C7))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Distribution Breakdown', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                const SizedBox(height: 20),
                _distBar('Donated', r.donated, donatedPercent, _emerald),
                const SizedBox(height: 16),
                _distBar('Expenses', r.expenses, expensesPercent, const Color(0xFFD97706)),
                const SizedBox(height: 16),
                _distBar('Reserved', r.reserved, reservedPercent, const Color(0xFF0284C7)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Summary', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                const SizedBox(height: 16),
                _summaryRow('Total Revenue', _formatCurrency(r.revenue)),
                _summaryRow('Total Donated', _formatCurrency(r.donated)),
                _summaryRow('Platform Expenses', _formatCurrency(r.expenses)),
                const Divider(height: 24, color: Color(0xFFE2E8F0)),
                _summaryRow('Reserved for Future', _formatCurrency(r.reserved)),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _reportStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 14),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _distBar(String label, double amount, double fraction, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF0F172A), fontSize: 13)),
            Text(
              '${_formatCurrency(amount)} (${(fraction * 100).toStringAsFixed(0)}%)',
              style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF64748B), fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: fraction,
            minHeight: 8,
            backgroundColor: const Color(0xFFE2E8F0),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0F172A), fontSize: 13)),
        ],
      ),
    );
  }
}
