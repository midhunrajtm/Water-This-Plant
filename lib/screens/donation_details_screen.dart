import 'package:flutter/material.dart';
import 'package:water_this_plant/data/transparency_mock_data.dart';
import 'package:water_this_plant/models/donation_transaction.dart';

class DonationDetailsScreen extends StatelessWidget {
  final DonationTransaction transaction;
  const DonationDetailsScreen({super.key, required this.transaction});

  static const _emerald = Color(0xFF059669);

  String _formatDate(DateTime dt) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

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
    final t = transaction;
    final color = TransparencyMockData.statusColor(t.status);
    final icon = TransparencyMockData.statusIcon(t.status);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation Details'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(icon, color: color, size: 32),
                ),
                const SizedBox(height: 16),
                Text(_formatCurrency(t.amount), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(t.status, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Transaction Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                const SizedBox(height: 16),
                _detailRow('Transaction ID', t.id),
                _detailRow('Amount', _formatCurrency(t.amount)),
                _detailRow('Date', _formatDate(t.date)),
                _detailRow('Beneficiary', t.beneficiary),
                _detailRow('Category', t.category),
                _detailRow('Payment Status', t.status),
                if (t.shortDescription.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  const Divider(height: 1, color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 12),
                  Text(t.shortDescription, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, height: 1.5)),
                ],
              ],
            ),
          ),
          if (t.isVerified) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.verified_rounded, color: Color(0xFF059669), size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'This transaction has been verified and authenticated through our transparency protocol.',
                      style: const TextStyle(color: Color(0xFF059669), fontSize: 12, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (t.receiptImageUrl != null) ...[
            const SizedBox(height: 16),
            _imageCard('Receipt', t.receiptImageUrl!),
          ],
          if (t.beneficiaryUpdateImageUrl != null) ...[
            const SizedBox(height: 16),
            _imageCard('Beneficiary Update', t.beneficiaryUpdateImageUrl!),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
          ),
          Expanded(
            child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF0F172A), fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _imageCard(String label, String url) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 12),
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFF8FAFC),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  decoration: BoxDecoration(
                    color: _emerald.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_outlined, size: 40, color: _emerald.withValues(alpha: 0.3)),
                      const SizedBox(height: 8),
                      Text(
                        '$label Image',
                        style: TextStyle(color: _emerald.withValues(alpha: 0.5), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
