import 'package:flutter/material.dart';
import 'package:water_this_plant/models/transparency_revenue.dart';
import 'package:water_this_plant/models/donation_transaction.dart';
import 'package:water_this_plant/models/monthly_report.dart';
import 'package:water_this_plant/models/user_contribution.dart';
import 'package:water_this_plant/models/fund_allocation.dart';
import 'package:water_this_plant/models/community_impact.dart';

class TransparencyMockData {
  static const _emerald = Color(0xFF059669);
  static const _blue = Color(0xFF0284C7);
  static const _amber = Color(0xFFD97706);

  static TransparencyRevenue get revenue => TransparencyRevenue(
    totalRevenue: 284500,
    totalDonated: 238000,
    platformCost: 28450,
    availableBalance: 18050,
    lastUpdated: DateTime(2026, 7, 15),
    rewardedAds: 142250,
    bannerAds: 71125,
    interstitialAds: 71125,
  );

  static List<FundAllocation> get allocations => const [
    FundAllocation(label: 'Education', amount: 65000, icon: Icons.school_rounded, color: Color(0xFF059669)),
    FundAllocation(label: 'Medical Support', amount: 42500, icon: Icons.local_hospital_rounded, color: Color(0xFF0D9488)),
    FundAllocation(label: 'Animal Welfare', amount: 30000, icon: Icons.pets_rounded, color: Color(0xFF0284C7)),
    FundAllocation(label: 'Disaster Relief', amount: 27500, icon: Icons.volunteer_activism_rounded, color: Color(0xFFD97706)),
    FundAllocation(label: 'Emergency Reserve', amount: 15000, icon: Icons.shield_rounded, color: Color(0xFF8B5CF6)),
  ];

  static double get totalAllocated =>
      allocations.fold<double>(0, (s, a) => s + a.amount);

  static List<DonationTransaction> get transactions => [
    DonationTransaction(
      id: 'TXN-2026-07-001', date: DateTime(2026, 7, 14), amount: 8500,
      beneficiary: 'Koudougou Community Center', category: 'Education',
      status: 'Completed', shortDescription: 'Construction materials for the new community learning wing.',
      receiptImageUrl: 'assets/images/transparency/receipt_1.png',
      beneficiaryUpdateImageUrl: 'assets/images/transparency/update_1.png', isVerified: true,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-002', date: DateTime(2026, 7, 12), amount: 4200,
      beneficiary: 'Ololua Health Clinic', category: 'Medical Support',
      status: 'Completed', shortDescription: 'Procurement of medical supplies and first-aid kits for the clinic.',
      receiptImageUrl: 'assets/images/transparency/receipt_2.png',
      beneficiaryUpdateImageUrl: 'assets/images/transparency/update_2.png', isVerified: true,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-003', date: DateTime(2026, 7, 10), amount: 6000,
      beneficiary: 'School Supplies Drive', category: 'Education',
      status: 'Completed', shortDescription: 'Textbooks and notebooks for 5 rural schools in Kenya.',
      receiptImageUrl: 'assets/images/transparency/receipt_3.png',
      beneficiaryUpdateImageUrl: 'assets/images/transparency/update_3.png', isVerified: true,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-004', date: DateTime(2026, 7, 8), amount: 3500,
      beneficiary: 'Emergency Food Bank', category: 'Disaster Relief',
      status: 'Processing', shortDescription: 'Food distribution for drought-affected communities.',
      isVerified: false,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-005', date: DateTime(2026, 7, 5), amount: 2800,
      beneficiary: 'Youth Leadership Program', category: 'Education',
      status: 'Completed', shortDescription: 'Training materials and workshop venue for 50 young leaders.',
      receiptImageUrl: 'assets/images/transparency/receipt_5.png',
      beneficiaryUpdateImageUrl: 'assets/images/transparency/update_5.png', isVerified: true,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-006', date: DateTime(2026, 7, 3), amount: 5000,
      beneficiary: 'Bakau Library Project', category: 'Education',
      status: 'Pending', shortDescription: 'Bookshelves, seating, and digital learning equipment.',
      isVerified: false,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-007', date: DateTime(2026, 6, 28), amount: 7200,
      beneficiary: 'Scholarship Fund', category: 'Education',
      status: 'Completed', shortDescription: 'Quarterly scholarships for 20 students from farming communities.',
      receiptImageUrl: 'assets/images/transparency/receipt_7.png',
      beneficiaryUpdateImageUrl: 'assets/images/transparency/update_7.png', isVerified: true,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-008', date: DateTime(2026, 6, 25), amount: 3800,
      beneficiary: 'Animal Welfare Program', category: 'Animal Welfare',
      status: 'Completed', shortDescription: 'Vaccination drives and shelter supplies for stray animals.',
      receiptImageUrl: 'assets/images/transparency/receipt_8.png',
      beneficiaryUpdateImageUrl: 'assets/images/transparency/update_8.png', isVerified: true,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-009', date: DateTime(2026, 6, 22), amount: 4500,
      beneficiary: 'Emergency Food Bank', category: 'Disaster Relief',
      status: 'Completed', shortDescription: 'Nutritional supplies for 500 families in the Horn of Africa.',
      receiptImageUrl: 'assets/images/transparency/receipt_9.png',
      beneficiaryUpdateImageUrl: 'assets/images/transparency/update_9.png', isVerified: true,
    ),
    DonationTransaction(
      id: 'TXN-2026-07-010', date: DateTime(2026, 6, 20), amount: 2100,
      beneficiary: 'Ololua Health Clinic', category: 'Medical Support',
      status: 'Processing', shortDescription: 'Staff training and community health awareness materials.',
      isVerified: false,
    ),
  ];

  static List<MonthlyReport> get reports => const [
    MonthlyReport(year: 2026, month: 7, revenue: 58420, donated: 52000, expenses: 6420),
    MonthlyReport(year: 2026, month: 6, revenue: 62300, donated: 55000, expenses: 7300),
    MonthlyReport(year: 2026, month: 5, revenue: 48900, donated: 43000, expenses: 5900),
    MonthlyReport(year: 2026, month: 4, revenue: 51200, donated: 46000, expenses: 5200),
    MonthlyReport(year: 2026, month: 3, revenue: 37800, donated: 32000, expenses: 5800),
    MonthlyReport(year: 2026, month: 2, revenue: 25880, donated: 20000, expenses: 5880),
  ];

  static UserContribution get userContribution => const UserContribution(
    adsWatched: 847,
    postsViewed: 3241,
    estimatedRevenueGenerated: 42.35,
    likesGiven: 1234,
    commentsMade: 267,
  );

  static CommunityImpact get impact => const CommunityImpact(
    beneficiariesHelped: 2847,
    verifiedCauses: 156,
    mealsSponsored: 125000,
    studentsSupported: 3420,
    treesPlanted: 12500,
  );

  static Color statusColor(String status) {
    switch (status) {
      case 'Completed':
        return _emerald;
      case 'Processing':
        return _amber;
      case 'Pending':
        return _blue;
      default:
        return Colors.grey;
    }
  }

  static IconData statusIcon(String status) {
    switch (status) {
      case 'Completed':
        return Icons.check_circle_rounded;
      case 'Processing':
        return Icons.sync_rounded;
      case 'Pending':
        return Icons.schedule_rounded;
      default:
        return Icons.help_rounded;
    }
  }
}
