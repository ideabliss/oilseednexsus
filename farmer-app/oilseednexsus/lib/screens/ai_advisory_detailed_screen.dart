import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/app_theme.dart';

class AIAdvisoryDetailedScreen extends StatefulWidget {
  const AIAdvisoryDetailedScreen({super.key});

  @override
  State<AIAdvisoryDetailedScreen> createState() => _AIAdvisoryDetailedScreenState();
}

class _AIAdvisoryDetailedScreenState extends State<AIAdvisoryDetailedScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Advisory Center'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshData,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Crop Planning'),
            Tab(text: 'Weather'),
            Tab(text: 'Pest Alert'),
            Tab(text: 'Satellite'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCropPlanningTab(),
          _buildWeatherTab(),
          _buildPestManagementTab(),
          _buildSatelliteTab(),
        ],
      ),
    );
  }

  Widget _buildCropPlanningTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAIRecommendationCard(),
        const SizedBox(height: 16),
        _buildSoilAnalysisCard(),
        const SizedBox(height: 16),
        _buildCropRotationCard(),
        const SizedBox(height: 16),
        _buildOptimalTimingCard(),
      ],
    );
  }

  Widget _buildAIRecommendationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.highlightBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.psychology, color: AppTheme.highlightBlue),
                ),
                const SizedBox(width: 12),
                const Text(
                  'AI Crop Recommendations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.successGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.successGreen.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🌱 Recommended: Soybean',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text('Based on current soil conditions, weather patterns, and market prices, Soybean is optimal for your farm.'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildMetric('Yield Potential', '95%', AppTheme.successGreen),
                      const SizedBox(width: 16),
                      _buildMetric('Market Demand', '88%', AppTheme.highlightBlue),
                      const SizedBox(width: 16),
                      _buildMetric('Risk Factor', 'Low', AppTheme.primaryGreen),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSoilAnalysisCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Soil Health Analysis',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 10,
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 7.5, color: AppTheme.primaryGreen)]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 6.2, color: AppTheme.accentYellow)]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 8.1, color: AppTheme.highlightBlue)]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 5.8, color: AppTheme.warningOrange)]),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const titles = ['pH', 'N', 'P', 'K'];
                          return Text(titles[value.toInt()]);
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildWeatherForecastCard(),
        const SizedBox(height: 16),
        _buildWeatherAlertsCard(),
        const SizedBox(height: 16),
        _buildIrrigationAdviceCard(),
      ],
    );
  }

  Widget _buildWeatherForecastCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.cloud, color: AppTheme.highlightBlue),
                const SizedBox(width: 8),
                const Text('7-Day Weather Forecast', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  final temps = [28, 32, 29, 26, 30, 31, 27];
                  final icons = [Icons.sunny, Icons.cloud, Icons.grain, Icons.thunderstorm, Icons.sunny, Icons.cloud, Icons.sunny];
                  
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.dividerGray),
                    ),
                    child: Column(
                      children: [
                        Text(days[index], style: const TextStyle(fontWeight: FontWeight.w500)),
                        const SizedBox(height: 8),
                        Icon(icons[index], color: AppTheme.highlightBlue),
                        const SizedBox(height: 8),
                        Text('${temps[index]}°C', style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text('85%', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherAlertsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Weather Alerts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildAlertItem(Icons.warning, 'Heavy Rainfall Expected', 'Tomorrow 2-6 PM', AppTheme.warningOrange),
            _buildAlertItem(Icons.thermostat, 'High Temperature Alert', 'Next 3 days >35°C', AppTheme.errorRed),
            _buildAlertItem(Icons.air, 'Strong Winds', 'Thursday evening', AppTheme.highlightBlue),
          ],
        ),
      ),
    );
  }

  Widget _buildPestManagementTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildPestRiskCard(),
        const SizedBox(height: 16),
        _buildPestIdentificationCard(),
        const SizedBox(height: 16),
        _buildTreatmentRecommendationsCard(),
      ],
    );
  }

  Widget _buildPestRiskCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.bug_report, color: AppTheme.warningOrange),
                const SizedBox(width: 8),
                const Text('Pest Risk Assessment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.warningOrange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Text('Current Risk Level', style: TextStyle(fontSize: 12)),
                        const SizedBox(height: 4),
                        const Text('MEDIUM', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.warningOrange)),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: 0.6,
                          backgroundColor: AppTheme.dividerGray,
                          valueColor: const AlwaysStoppedAnimation(AppTheme.warningOrange),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      _buildPestRiskItem('Aphids', 'High', AppTheme.errorRed),
                      _buildPestRiskItem('Bollworm', 'Medium', AppTheme.warningOrange),
                      _buildPestRiskItem('Whitefly', 'Low', AppTheme.successGreen),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSatelliteTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSatelliteImageCard(),
        const SizedBox(height: 16),
        _buildVegetationIndexCard(),
        const SizedBox(height: 16),
        _buildFieldAnalysisCard(),
      ],
    );
  }

  Widget _buildSatelliteImageCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.satellite_alt, color: AppTheme.highlightBlue),
                const SizedBox(width: 8),
                const Text('Satellite Imagery', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('Last Updated: Today', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.dividerGray),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.satellite_alt, size: 48, color: AppTheme.primaryGreen),
                    SizedBox(height: 8),
                    Text('Satellite View of Your Farm'),
                    Text('Resolution: 10m/pixel', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVegetationIndexCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('NDVI Analysis', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 0.3),
                        const FlSpot(1, 0.5),
                        const FlSpot(2, 0.7),
                        const FlSpot(3, 0.8),
                        const FlSpot(4, 0.75),
                        const FlSpot(5, 0.9),
                      ],
                      isCurved: true,
                      color: AppTheme.successGreen,
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetric('Current NDVI', '0.85', AppTheme.successGreen),
                _buildMetric('Crop Health', 'Excellent', AppTheme.successGreen),
                _buildMetric('Growth Stage', 'Flowering', AppTheme.highlightBlue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCropRotationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Crop Rotation Advice', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.highlightBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recommended Rotation:', style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(height: 8),
                  Text('Kharif: Soybean → Rabi: Mustard → Summer: Groundnut'),
                  SizedBox(height: 8),
                  Text('Benefits: Improved soil nitrogen, reduced pest buildup, better yields'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptimalTimingCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Optimal Timing', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildTimingItem('Sowing', '15-30 June', Icons.agriculture, AppTheme.primaryGreen),
            _buildTimingItem('Fertilizer', '20 July', Icons.scatter_plot, AppTheme.accentYellow),
            _buildTimingItem('Pesticide', '10 August', Icons.pest_control, AppTheme.warningOrange),
            _buildTimingItem('Harvest', '15-30 October', Icons.grass, AppTheme.successGreen),
          ],
        ),
      ),
    );
  }

  Widget _buildIrrigationAdviceCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Irrigation Recommendations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.highlightBlue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('💧 Next Irrigation: Tomorrow 6 AM', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Soil moisture: 45% (Optimal: 60-70%)'),
                  Text('Expected rainfall: 15mm in next 3 days'),
                  Text('Recommendation: Light irrigation (20mm)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPestIdentificationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AI Pest Identification', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // Camera functionality for pest identification
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Camera feature for pest identification')),
                );
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Scan Pest with Camera'),
            ),
            const SizedBox(height: 12),
            const Text('Recent Identifications:', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            _buildPestIdentificationItem('Aphids', '95% confidence', 'Yesterday'),
            _buildPestIdentificationItem('Leaf Miner', '87% confidence', '2 days ago'),
          ],
        ),
      ),
    );
  }

  Widget _buildTreatmentRecommendationsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Treatment Recommendations', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildTreatmentItem('Organic Neem Oil', 'For Aphids', 'Apply 2ml/L water', AppTheme.successGreen),
            _buildTreatmentItem('Biological Control', 'Release Ladybugs', 'Natural predator method', AppTheme.primaryGreen),
            _buildTreatmentItem('Chemical Treatment', 'Imidacloprid 17.8%', 'If infestation >20%', AppTheme.warningOrange),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldAnalysisCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Field Analysis Report', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildAnalysisMetric('Crop Coverage', '92%', AppTheme.successGreen)),
                Expanded(child: _buildAnalysisMetric('Stress Areas', '3%', AppTheme.warningOrange)),
                Expanded(child: _buildAnalysisMetric('Water Stress', 'Low', AppTheme.successGreen)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildAlertItem(IconData icon, String title, String subtitle, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPestRiskItem(String pest, String risk, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pest, style: const TextStyle(fontSize: 12)),
          Text(risk, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildTimingItem(String activity, String timing, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(activity)),
          Text(timing, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildPestIdentificationItem(String pest, String confidence, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pest, style: const TextStyle(fontSize: 12)),
          Text('$confidence • $date', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildTreatmentItem(String treatment, String target, String dosage, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(treatment, style: TextStyle(fontWeight: FontWeight.w500, color: color)),
          Text(target, style: const TextStyle(fontSize: 12)),
          Text(dosage, style: TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildAnalysisMetric(String label, String value, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 16)),
        Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
      ],
    );
  }

  void _refreshData() {
    setState(() {
      _isLoading = true;
    });
    
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('AI advisory data updated')),
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}