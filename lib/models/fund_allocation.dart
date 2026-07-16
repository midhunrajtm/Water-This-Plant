import 'package:flutter/material.dart';

class FundAllocation {
  final String label;
  final double amount;
  final IconData icon;
  final Color color;

  const FundAllocation({
    required this.label,
    required this.amount,
    required this.icon,
    required this.color,
  });
}
