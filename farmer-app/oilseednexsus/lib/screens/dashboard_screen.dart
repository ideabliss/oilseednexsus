import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/weather_widget.dart';
import '../widgets/price_widget.dart';
import 'crop_planning_screen.dart';
import 'ai_advisory_screen.dart';
import 'weather_alerts_screen.dart';
import 'market_price_screen.dart';
import 'procurement_screen.dart';
import 'performance_dashboard_screen.dart';
import 'notifications_screen.dart';
import 'sales_tracking_screen.dart';
import 'pest_alert_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedLanguage = 'EN';
  final List<String> _languages = ['EN', 'HI', 'MR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppTheme.errorRed,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 8,
                      minHeight: 8,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
          ),
          PopupMenuButton<String>(
            initialValue: _selectedLanguage,
            onSelected: (value) {
              setState(() {
                _selectedLanguage = value;
              });
            },
            itemBuilder: (context) => _languages.map((lang) {
              return PopupMenuItem(
                value: lang,
                child: Text(lang),
              );
            }).toList(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: AppTheme.backgroundWhite.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.language, size: 16),
                  const SizedBox(width: 4),
                  Text(_selectedLanguage),
                ],
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: 20),
            _buildQuickStats(),
            const SizedBox(height: 20),
            _buildQuickActions(),
            const SizedBox(height: 20),
            _buildWeatherSection(),
            const SizedBox(height: 20),
            _buildPriceSection(),
          ],
        ),
      ),

    );
  }

  Widget _buildWelcomeSection() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryGreen,
              AppTheme.primaryGreen.withValues(alpha: 0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning, Farmer!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.backgroundWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Today is a great day for farming. Check your AI recommendations below.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.backgroundWhite.withValues(alpha: 0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 16),
          _buildStatCard(
            'Total Land',
            '5.2 acres',
            Icons.landscape,
            AppTheme.primaryGreen,
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            'Active Crops',
            '3 types',
            Icons.eco,
            AppTheme.accentYellow,
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            'This Season',
            '₹2.4L income',
            Icons.trending_up,
            AppTheme.highlightBlue,
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PerformanceDashboardScreen()),
        );
      },
      child: Container(
        width: 120,
        child: Card(
          margin: const EdgeInsets.all(4),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
            return GridView.count(
              crossAxisCount: crossAxisCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.1,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
          children: [
            DashboardCard(
              title: 'AI Predictions',
              subtitle: 'View yield forecasts',
              icon: Icons.psychology,
              color: AppTheme.highlightBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AIAdvisoryScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Weather Alerts',
              subtitle: '5-day forecast',
              icon: Icons.cloud,
              color: AppTheme.warningOrange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherAlertsScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Market Prices',
              subtitle: 'Live mandi rates',
              icon: Icons.trending_up,
              color: AppTheme.successGreen,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MarketPriceScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Sell Produce',
              subtitle: 'Find buyers',
              icon: Icons.storefront,
              color: AppTheme.accentYellow,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProcurementScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Sales Tracking',
              subtitle: 'QR code traceability',
              icon: Icons.qr_code_scanner,
              color: AppTheme.highlightBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SalesTrackingScreen()),
                );
              },
            ),
            DashboardCard(
              title: 'Pest Alerts',
              subtitle: 'AI pest detection',
              icon: Icons.bug_report,
              color: AppTheme.errorRed,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PestAlertScreen()),
                );
              },
            ),
          ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildWeatherSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today\'s Weather',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherAlertsScreen()),
                );
              },
              child: const Text('View Details'),
            ),
          ],
        ),
        const WeatherWidget(),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Market Prices',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MarketPriceScreen()),
                );
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const PriceWidget(),
      ],
    );
  }

  Future<void> _refreshData() async {
    // Simulate data refresh
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }
}