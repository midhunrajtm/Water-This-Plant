import 'package:flutter/material.dart';
import 'package:water_this_plant/data/transparency_mock_data.dart';
import 'package:water_this_plant/models/transparency_revenue.dart';
import 'package:water_this_plant/models/fund_allocation.dart';
import 'package:water_this_plant/models/monthly_report.dart';
import 'package:water_this_plant/screens/donation_details_screen.dart';
import 'package:water_this_plant/screens/monthly_report_detail_screen.dart';

class TransparencyCenterScreen extends StatelessWidget {
  const TransparencyCenterScreen({super.key});

  static const _emerald = Color(0xFF059669);

  String _formatCurrency(double amount) {
    if (amount >= 100000) {
      return '\u20B9${(amount / 100000).toStringAsFixed(1)}L';
    }
    return '\u20B9${amount.toStringAsFixed(0)}';
  }

  String _formatCurrencyFull(double amount) {
    return '\u20B9${_addCommas(amount.toStringAsFixed(0))}';
  }

  String _addCommas(String numStr) {
    if (numStr.length <= 3) return numStr;
    final last3 = numStr.substring(numStr.length - 3);
    final rest = numStr.substring(0, numStr.length - 3);
    final withCommas = StringBuffer();
    for (int i = 0; i < rest.length; i++) {
      if (i > 0 && (rest.length - i) % 2 == 0) withCommas.write(',');
      withCommas.write(rest[i]);
    }
    return '$withCommas,$last3';
  }

  String _formatCompact(int n) {
    if (n >= 100000) return '${(n / 100000).toStringAsFixed(1)}L';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    final data = TransparencyMockData.revenue;
    final allocations = TransparencyMockData.allocations;
    final txns = TransparencyMockData.transactions;
    final reports = TransparencyMockData.reports;
    final impact = TransparencyMockData.impact;
    final contribution = TransparencyMockData.userContribution;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transparency Center'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCommunityRevenue(data),
          const SizedBox(height: 24),
          _buildRevenueBreakdown(data),
          const SizedBox(height: 24),
          _buildFundAllocation(allocations),
          const SizedBox(height: 24),
          _buildDonationLedger(context, txns),
          const SizedBox(height: 24),
          _buildCommunityImpact(impact),
          const SizedBox(height: 24),
          _buildMonthlyReports(context, reports),
          const SizedBox(height: 24),
          _buildMyContribution(contribution),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: _emerald,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const Spacer(),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: const Text(
                'See All',
                style: TextStyle(color: Color(0xFF059669), fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCommunityRevenue(TransparencyRevenue data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Community Revenue'),
        Row(
          children: [
            Expanded(child: _statCard('Total Revenue', _formatCurrency(data.totalRevenue), Icons.trending_up_rounded, _emerald, _formatCurrencyFull(data.totalRevenue))),
            const SizedBox(width: 10),
            Expanded(child: _statCard('Total Donated', _formatCurrency(data.totalDonated), Icons.favorite_rounded, const Color(0xFF0D9488), _formatCurrencyFull(data.totalDonated))),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _statCard('Platform Cost', _formatCurrency(data.platformCost), Icons.settings_rounded, const Color(0xFFD97706), _formatCurrencyFull(data.platformCost))),
            const SizedBox(width: 10),
            Expanded(child: _statCard('Available', _formatCurrency(data.availableBalance), Icons.account_balance_wallet_rounded, const Color(0xFF0284C7), _formatCurrencyFull(data.availableBalance))),
          ],
        ),
        const SizedBox(height: 10),
        _lastUpdatedTile(data.lastUpdated),
      ],
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color, String fullValue) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 16),
              ),
              const Spacer(),
              Text(fullValue, style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8))),
            ],
          ),
          const SizedBox(height: 14),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _lastUpdatedTile(DateTime dt) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final label = '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.access_time_rounded, size: 14, color: Color(0xFF94A3B8)),
          const SizedBox(width: 6),
          Text('Last updated: $label', style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildRevenueBreakdown(TransparencyRevenue data) {
    final items = [
      _BreakdownItem('Rewarded Ads', data.rewardedAds, data.rewardedAdsPercent, _emerald),
      _BreakdownItem('Banner Ads', data.bannerAds, data.bannerAdsPercent, const Color(0xFF0D9488)),
      _BreakdownItem('Interstitial Ads', data.interstitialAds, data.interstitialAdsPercent, const Color(0xFF0284C7)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Revenue Breakdown'),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: items.map((item) {
              final showMargin = items.last != item;
              return Padding(
                padding: EdgeInsets.only(bottom: showMargin ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.label, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF0F172A), fontSize: 13)),
                        Text(
                          '${_formatCurrency(item.amount)} (${(item.percent * 100).toStringAsFixed(0)}%)',
                          style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF64748B), fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: item.percent,
                        minHeight: 8,
                        backgroundColor: const Color(0xFFE2E8F0),
                        valueColor: AlwaysStoppedAnimation<Color>(item.color),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFundAllocation(List<FundAllocation> allocations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Fund Allocation'),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: allocations.map((a) {
              final fraction = TransparencyMockData.totalAllocated > 0
                  ? a.amount / TransparencyMockData.totalAllocated
                  : 0.0;
              final showMargin = allocations.last != a;
              return Padding(
                padding: EdgeInsets.only(bottom: showMargin ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: a.color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(a.icon, color: a.color, size: 18),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(a.label, style: const TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF0F172A), fontSize: 13)),
                              const SizedBox(height: 2),
                              Text(
                                _formatCurrencyFull(a.amount),
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F172A), fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${(fraction * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: LinearProgressIndicator(
                        value: fraction,
                        minHeight: 6,
                        backgroundColor: const Color(0xFFE2E8F0),
                        valueColor: AlwaysStoppedAnimation<Color>(a.color),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDonationLedger(BuildContext context, List<dynamic> txns) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Donation Ledger'),
        ...txns.take(5).map((t) => _ledgerItem(context, t)),
        if (txns.length > 5)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: TextButton(
                onPressed: () => _showAllTransactions(context, txns),
                child: const Text('View All Transactions', style: TextStyle(color: Color(0xFF059669), fontWeight: FontWeight.w500)),
              ),
            ),
          ),
      ],
    );
  }

  Widget _ledgerItem(BuildContext context, dynamic t) {
    final color = TransparencyMockData.statusColor(t.status);
    final icon = TransparencyMockData.statusIcon(t.status);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DonationDetailsScreen(transaction: t)),
        ),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(t.id, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0F172A), fontSize: 11)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 12, color: color),
                        const SizedBox(width: 4),
                        Text(t.status, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.beneficiary, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF0F172A))),
                        const SizedBox(height: 2),
                        Text(t.category, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(_formatCurrencyFull(t.amount), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A))),
                      const SizedBox(height: 2),
                      Text(_formatDate(t.date), style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAllTransactions(BuildContext context, List<dynamic> txns) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('All Transactions'), centerTitle: true),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: txns.map((t) => _ledgerItem(context, t)).toList(),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
  }

  Widget _buildCommunityImpact(dynamic impact) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Community Impact'),
        Row(
          children: [
            Expanded(child: _impactCard('Beneficiaries\nHelped', _formatCompact(impact.beneficiariesHelped), Icons.people_rounded, _emerald)),
            const SizedBox(width: 10),
            Expanded(child: _impactCard('Verified\nCauses', '${impact.verifiedCauses}', Icons.verified_rounded, const Color(0xFF0D9488))),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _impactCard('Meals\nSponsored', _formatCompact(impact.mealsSponsored), Icons.restaurant_rounded, const Color(0xFF0284C7))),
            const SizedBox(width: 10),
            Expanded(child: _impactCard('Students\nSupported', _formatCompact(impact.studentsSupported), Icons.school_rounded, const Color(0xFF8B5CF6))),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(child: _impactCard('Trees\nPlanted', _formatCompact(impact.treesPlanted), Icons.energy_savings_leaf_rounded, const Color(0xFFD97706))),
            const SizedBox(width: 10),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _impactCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(height: 14),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12, height: 1.3)),
        ],
      ),
    );
  }

  Widget _buildMonthlyReports(BuildContext context, List<MonthlyReport> reports) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Monthly Reports'),
        ...reports.map((r) => _reportCard(context, r)),
      ],
    );
  }

  Widget _reportCard(BuildContext context, MonthlyReport r) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MonthlyReportDetailScreen(report: r)),
        ),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: _emerald.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${r.month}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF059669)),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r.label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF0F172A))),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _reportStat('Revenue', _formatCurrencyFull(r.revenue)),
                        const SizedBox(width: 14),
                        _reportStat('Donated', _formatCurrencyFull(r.donated)),
                        const SizedBox(width: 14),
                        _reportStat('Expenses', _formatCurrencyFull(r.expenses)),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Color(0xFFCBD5E1), size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reportStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: Color(0xFF0F172A))),
        Text(label, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 9)),
      ],
    );
  }

  Widget _buildMyContribution(dynamic c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('My Contribution'),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _contribStat('Ads\nWatched', '${c.adsWatched}', Icons.play_circle_outline_rounded, _emerald)),
                  const SizedBox(width: 10),
                  Expanded(child: _contribStat('Posts\nViewed', '${c.postsViewed}', Icons.visibility_outlined, const Color(0xFF0D9488))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _contribStat('Est. Revenue\nGenerated', '\u20B9${c.estimatedRevenueGenerated.toStringAsFixed(2)}', Icons.monetization_on_outlined, const Color(0xFF0284C7))),
                  const SizedBox(width: 10),
                  Expanded(child: _contribStat('Likes\nGiven', '${c.likesGiven}', Icons.favorite_outline_rounded, const Color(0xFFF43F5E))),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _contribStat('Comments\nMade', '${c.commentsMade}', Icons.chat_bubble_outline_rounded, const Color(0xFF8B5CF6))),
                  const SizedBox(width: 10),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline_rounded, size: 16, color: Color(0xFF059669)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'These values are estimates based on your engagement and are shown for demonstration purposes.',
                        style: const TextStyle(color: Color(0xFF059669), fontSize: 11, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _contribStat(String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0F172A))),
              Text(label, style: const TextStyle(color: Color(0xFF64748B), fontSize: 10, height: 1.2)),
            ],
          ),
        ),
      ],
    );
  }
}

class _BreakdownItem {
  final String label;
  final double amount;
  final double percent;
  final Color color;
  const _BreakdownItem(this.label, this.amount, this.percent, this.color);
}
