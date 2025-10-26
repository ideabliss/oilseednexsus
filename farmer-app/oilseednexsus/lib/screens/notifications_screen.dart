import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () {
              // Mark all as read
            },
            child: const Text('Mark All Read'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationItem(
            'Weather Alert',
            'Heavy rainfall expected in your area tomorrow. Protect your crops.',
            Icons.cloud_queue,
            AppTheme.warningOrange,
            '2 hours ago',
            true,
          ),
          _buildNotificationItem(
            'Price Update',
            'Soybean prices increased by 5% in Pune mandi.',
            Icons.trending_up,
            AppTheme.successGreen,
            '4 hours ago',
            true,
          ),
          _buildNotificationItem(
            'AI Recommendation',
            'Optimal time for pesticide application detected.',
            Icons.psychology,
            AppTheme.highlightBlue,
            '1 day ago',
            false,
          ),
          _buildNotificationItem(
            'Buyer Interest',
            'New buyer interested in your groundnut produce.',
            Icons.storefront,
            AppTheme.accentYellow,
            '2 days ago',
            false,
          ),
          _buildNotificationItem(
            'Government Scheme',
            'New subsidy scheme available for oilseed farmers.',
            Icons.account_balance,
            AppTheme.primaryGreen,
            '3 days ago',
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    String title,
    String message,
    IconData icon,
    Color color,
    String time,
    bool isUnread,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ),
            if (isUnread)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.errorRed,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(message),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}