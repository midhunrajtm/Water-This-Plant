import 'package:flutter/material.dart';
import 'package:water_this_plant/data/mock_data.dart';
import 'package:water_this_plant/models/fund_transaction.dart';

class TransparencyDashboardScreen extends StatelessWidget {
  const TransparencyDashboardScreen({super.key});

  String _formatDate(DateTime dt) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}';
  }

  @override
  Widget build(BuildContext context) {
    final txns = MockData.transactions;
    final totalReceived = txns.where((t) => t.isIncoming).fold<double>(0, (s, t) => s + t.amount);
    final totalSpent = txns.where((t) => !t.isIncoming).fold<double>(0, (s, t) => s + t.amount);

    final Map<String, double> spendingByCategory = {};
    for (final t in txns.where((t) => !t.isIncoming)) {
      spendingByCategory[t.category] = (spendingByCategory[t.category] ?? 0) + t.amount;
    }

    final totalImpact = MockData.users.fold<int>(0, (s, u) => s + u.peopleReached);
    final adminTotal = spendingByCategory['admin'] ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transparency'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: _summaryCard('Total Raised', '\$${totalReceived.toStringAsFixed(0)}', Icons.trending_up_rounded, const Color(0xFF0D9488)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _summaryCard('Distributed', '\$${totalSpent.toStringAsFixed(0)}', Icons.send_rounded, const Color(0xFF059669)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _summaryCard('Admin', '\$${adminTotal.toStringAsFixed(0)}', Icons.settings_rounded, const Color(0xFFD97706)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _summaryCard('Impact', '$totalImpact', Icons.people_rounded, const Color(0xFF0284C7)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Spending Breakdown',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
          ),
          const SizedBox(height: 12),
          ...spendingByCategory.entries.map((e) {
            final fraction = totalSpent > 0 ? e.value / totalSpent : 0.0;
            Color barColor;
            switch (e.key) {
              case 'equipment':
                barColor = const Color(0xFF0D9488);
                break;
              case 'logistics':
                barColor = const Color(0xFF0284C7);
                break;
              case 'operations':
                barColor = const Color(0xFFD97706);
                break;
              case 'supplies':
                barColor = const Color(0xFF059669);
                break;
              case 'labor':
                barColor = const Color(0xFF8B5CF6);
                break;
              case 'admin':
                barColor = const Color(0xFFF43F5E);
                break;
              default:
                barColor = const Color(0xFF0D9488);
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.key[0].toUpperCase() + e.key.substring(1),
                        style: const TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$${e.value.toStringAsFixed(0)}',
                        style: const TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: fraction,
                      minHeight: 8,
                      backgroundColor: const Color(0xFFE2E8F0),
                      valueColor: AlwaysStoppedAnimation<Color>(barColor),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 24),
          const Text(
            'Recent Transactions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
          ),
          const SizedBox(height: 12),
          ...txns.reversed.map((FundTransaction t) {
            final isIncoming = t.isIncoming;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: (isIncoming ? const Color(0xFF0D9488) : const Color(0xFFF43F5E)).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      isIncoming ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                      color: isIncoming ? const Color(0xFF0D9488) : const Color(0xFFF43F5E),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.description,
                          style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF0F172A), fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${t.causeTitle} \u00b7 ${_formatDate(t.date)}',
                          style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${isIncoming ? '+' : '-'}\$${t.amount.toStringAsFixed(0)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isIncoming ? const Color(0xFF0D9488) : const Color(0xFFF43F5E),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _summaryCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 16),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
        ],
      ),
    );
  }
}
