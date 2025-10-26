import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final prices = [
      {'crop': 'Soybean', 'price': '₹4,200', 'change': '+2.5%', 'isUp': true},
      {'crop': 'Mustard', 'price': '₹5,800', 'change': '-1.2%', 'isUp': false},
      {'crop': 'Groundnut', 'price': '₹6,500', 'change': '+3.8%', 'isUp': true},
    ];

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.trending_up,
                    color: AppTheme.primaryGreen,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Live Mandi Prices (per quintal)',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...prices.map((price) => _buildPriceRow(context, price)),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context, Map<String, dynamic> price) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              price['crop'],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              price['price'],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: price['isUp'] 
                  ? AppTheme.successGreen.withValues(alpha: 0.1)
                  : AppTheme.errorRed.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  price['isUp'] ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 12,
                  color: price['isUp'] ? AppTheme.successGreen : AppTheme.errorRed,
                ),
                const SizedBox(width: 2),
                Text(
                  price['change'],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: price['isUp'] ? AppTheme.successGreen : AppTheme.errorRed,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}