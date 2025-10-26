import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/app_theme.dart';

class PerformanceDashboardScreen extends StatefulWidget {
  const PerformanceDashboardScreen({super.key});

  @override
  State<PerformanceDashboardScreen> createState() => _PerformanceDashboardScreenState();
}

class _PerformanceDashboardScreenState extends State<PerformanceDashboardScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Analytics'),
        actions: [
          IconButton(
            onPressed: _exportReport,
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.lightGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildTab('Overview', 0),
          _buildTab('Income', 1),
          _buildTab('Yield', 2),
          _buildTab('Advisory', 3),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryGreen : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isSelected ? AppTheme.backgroundWhite : AppTheme.textDark,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        return _buildOverview();
      case 1:
        return _buildIncomeAnalytics();
      case 2:
        return _buildYieldAnalytics();
      case 3:
        return _buildAdvisoryAnalytics();
      default:
        return _buildOverview();
    }
  }

  Widget _buildOverview() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildStatsGrid(),
        const SizedBox(height: 20),
        _buildPerformanceChart(),
        const SizedBox(height: 20),
        _buildRecentAchievements(),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        _buildStatCard(
          'Total Income',
          '₹2,45,000',
          '+18%',
          Icons.currency_rupee,
          AppTheme.successGreen,
        ),
        _buildStatCard(
          'Avg Yield',
          '18.5 q/acre',
          '+12%',
          Icons.agriculture,
          AppTheme.primaryGreen,
        ),
        _buildStatCard(
          'Advisories Followed',
          '85%',
          '+5%',
          Icons.psychology,
          AppTheme.highlightBlue,
        ),
        _buildStatCard(
          'Weather Alerts',
          '24 Responded',
          '100%',
          Icons.cloud,
          AppTheme.warningOrange,
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String change, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.successGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                change,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.successGreen,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Performance Trend (Last 6 Months)',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 3),
                        const FlSpot(1, 4),
                        const FlSpot(2, 3.5),
                        const FlSpot(3, 5),
                        const FlSpot(4, 4.5),
                        const FlSpot(5, 6),
                      ],
                      isCurved: true,
                      color: AppTheme.primaryGreen,
                      barWidth: 3,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentAchievements() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.emoji_events, color: AppTheme.accentYellow),
                const SizedBox(width: 8),
                Text(
                  'Recent Achievements',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildAchievementItem(
              'Best Yield Award',
              'Achieved 20% above average yield',
              Icons.trending_up,
              AppTheme.successGreen,
            ),
            _buildAchievementItem(
              'Advisory Champion',
              'Followed 90% of AI recommendations',
              Icons.psychology,
              AppTheme.highlightBlue,
            ),
            _buildAchievementItem(
              'Weather Warrior',
              'Responded to all weather alerts',
              Icons.cloud,
              AppTheme.warningOrange,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementItem(String title, String description, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncomeAnalytics() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildIncomeChart(),
        const SizedBox(height: 20),
        _buildIncomeBreakdown(),
      ],
    );
  }

  Widget _buildIncomeChart() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Income Growth (₹)',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 300000,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 180000, color: AppTheme.primaryGreen)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 200000, color: AppTheme.primaryGreen)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 220000, color: AppTheme.primaryGreen)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 245000, color: AppTheme.primaryGreen)]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeBreakdown() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Income Sources',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildIncomeSourceItem('Soybean Sales', '₹1,80,000', '73%'),
            _buildIncomeSourceItem('Mustard Sales', '₹45,000', '18%'),
            _buildIncomeSourceItem('Government Subsidy', '₹15,000', '6%'),
            _buildIncomeSourceItem('Other', '₹5,000', '3%'),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeSourceItem(String source, String amount, String percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              source,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text(
            amount,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              percentage,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.primaryGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYieldAnalytics() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildYieldComparison(),
        const SizedBox(height: 20),
        _buildCropPerformance(),
      ],
    );
  }

  Widget _buildYieldComparison() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yield vs Average (quintals/acre)',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildYieldCard('Your Yield', '18.5', AppTheme.primaryGreen),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildYieldCard('Regional Avg', '15.2', AppTheme.textSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYieldCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCropPerformance() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Crop Performance',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildCropPerformanceItem('Soybean', '18.5', '15.2', '+21.7%'),
            _buildCropPerformanceItem('Mustard', '12.8', '11.5', '+11.3%'),
            _buildCropPerformanceItem('Groundnut', '22.3', '20.1', '+10.9%'),
          ],
        ),
      ),
    );
  }

  Widget _buildCropPerformanceItem(String crop, String yourYield, String avgYield, String improvement) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  crop,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.successGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  improvement,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.successGreen,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                'Your: $yourYield q/acre',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 16),
              Text(
                'Avg: $avgYield q/acre',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdvisoryAnalytics() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAdvisoryStats(),
        const SizedBox(height: 20),
        _buildAdvisoryHistory(),
      ],
    );
  }

  Widget _buildAdvisoryStats() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Advisory Response Rate',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildAdvisoryStatCard('Total Received', '48', AppTheme.highlightBlue),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildAdvisoryStatCard('Followed', '41', AppTheme.successGreen),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildAdvisoryStatCard('Success Rate', '85%', AppTheme.primaryGreen),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvisoryStatCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAdvisoryHistory() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Advisory Actions',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildAdvisoryHistoryItem(
              'Fertilizer Application',
              'Applied DAP as recommended',
              'Followed',
              AppTheme.successGreen,
            ),
            _buildAdvisoryHistoryItem(
              'Pest Control',
              'Used neem oil spray',
              'Followed',
              AppTheme.successGreen,
            ),
            _buildAdvisoryHistoryItem(
              'Irrigation Schedule',
              'Recommendation ignored',
              'Not Followed',
              AppTheme.errorRed,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvisoryHistoryItem(String advisory, String action, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  advisory,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  action,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _exportReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Performance report exported')),
    );
  }
}