class TransparencyRevenue {
  final double totalRevenue;
  final double totalDonated;
  final double platformCost;
  final double availableBalance;
  final DateTime lastUpdated;

  final double rewardedAds;
  final double bannerAds;
  final double interstitialAds;

  const TransparencyRevenue({
    required this.totalRevenue,
    required this.totalDonated,
    required this.platformCost,
    required this.availableBalance,
    required this.lastUpdated,
    this.rewardedAds = 0,
    this.bannerAds = 0,
    this.interstitialAds = 0,
  });

  double get rewardedAdsPercent => totalRevenue > 0 ? rewardedAds / totalRevenue : 0;
  double get bannerAdsPercent => totalRevenue > 0 ? bannerAds / totalRevenue : 0;
  double get interstitialAdsPercent => totalRevenue > 0 ? interstitialAds / totalRevenue : 0;
}
