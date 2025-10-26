import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import 'performance_dashboard_screen.dart';
import 'blockchain_traceability_screen.dart';
import 'sales_tracking_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Edit profile functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 24),
          _buildFarmDetails(),
          const SizedBox(height: 20),
          _buildMenuSection(context),
          const SizedBox(height: 20),
          _buildSettingsSection(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppTheme.primaryGreen.withValues(alpha: 0.1),
              child: const Icon(
                Icons.person,
                size: 40,
                color: AppTheme.primaryGreen,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ramesh Kumar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Farmer ID: FRM001234',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.successGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Verified Farmer',
                style: TextStyle(
                  color: AppTheme.successGreen,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFarmDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Farm Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildDetailRow(Icons.location_on, 'Location', 'Pune, Maharashtra'),
            _buildDetailRow(Icons.landscape, 'Total Land', '5.2 acres'),
            _buildDetailRow(Icons.phone, 'Phone', '+91 98765 43210'),
            _buildDetailRow(Icons.email, 'Email', 'ramesh.kumar@email.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryGreen),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
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

  Widget _buildMenuSection(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _buildMenuItem(
            context,
            Icons.analytics,
            'Performance Dashboard',
            'View detailed analytics',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PerformanceDashboardScreen()),
            ),
          ),

          _buildMenuItem(
            context,
            Icons.history,
            'Sales Tracking',
            'Track each crop sale with QR',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SalesTrackingScreen()),
            ),
          ),
          _buildMenuItem(
            context,
            Icons.support_agent,
            'Support & Help',
            'Get assistance',
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.primaryGreen.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppTheme.primaryGreen, size: 20),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Card(
      child: Column(
        children: [
          _buildMenuItem(
            context,
            Icons.language,
            'Language',
            'English',
            () {},
          ),
          _buildMenuItem(
            context,
            Icons.notifications,
            'Notifications',
            'Manage alerts',
            () {},
          ),
          _buildMenuItem(
            context,
            Icons.security,
            'Privacy & Security',
            'Account settings',
            () {},
          ),
          _buildMenuItem(
            context,
            Icons.logout,
            'Logout',
            'Sign out of account',
            () {},
          ),
        ],
      ),
    );
  }
}