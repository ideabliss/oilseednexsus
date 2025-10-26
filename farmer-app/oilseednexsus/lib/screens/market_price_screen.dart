import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/app_theme.dart';

class MarketPriceScreen extends StatefulWidget {
  const MarketPriceScreen({super.key});

  @override
  State<MarketPriceScreen> createState() => _MarketPriceScreenState();
}

class _MarketPriceScreenState extends State<MarketPriceScreen> {
  String _selectedCrop = 'Soybean';
  String _selectedRegion = 'All Regions';

  final List<String> _crops = ['Soybean', 'Mustard', 'Groundnut', 'Sesame', 'Sunflower'];
  final List<String> _regions = ['All Regions', 'Maharashtra', 'Madhya Pradesh', 'Gujarat', 'Rajasthan'];

  final List<Map<String, dynamic>> _prices = [
    {
      'crop': 'Soybean',
      'market': 'Indore Mandi',
      'price': '₹4,200',
      'change': '+2.5%',
      'isUp': true,
      'msp': '₹4,300',
      'quality': 'FAQ',
    },
    {
      'crop': 'Soybean',
      'market': 'Nagpur Mandi',
      'price': '₹4,150',
      'change': '+1.8%',
      'isUp': true,
      'msp': '₹4,300',
      'quality': 'FAQ',
    },
    {
      'crop': 'Mustard',
      'market': 'Jaipur Mandi',
      'price': '₹5,800',
      'change': '-1.2%',
      'isUp': false,
      'msp': '₹5,650',
      'quality': 'FAQ',
    },
    {
      'crop': 'Groundnut',
      'market': 'Rajkot Mandi',
      'price': '₹6,500',
      'change': '+3.8%',
      'isUp': true,
      'msp': '₹5,850',
      'quality': 'Bold',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Prices'),
        actions: [
          IconButton(
            onPressed: _refreshPrices,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshPrices,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildPriceTrend(),
                  const SizedBox(height: 20),
                  _buildLivePrices(),
                  const SizedBox(height: 20),
                  _buildMSPComparison(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppTheme.backgroundGray,
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _selectedCrop,
              decoration: const InputDecoration(
                labelText: 'Crop',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              items: _crops.map((crop) {
                return DropdownMenuItem(
                  value: crop,
                  child: Text(crop),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCrop = value!;
                });
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _selectedRegion,
              decoration: const InputDecoration(
                labelText: 'Region',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              items: _regions.map((region) {
                return DropdownMenuItem(
                  value: region,
                  child: Text(region),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRegion = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceTrend() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.trending_up, color: AppTheme.primaryGreen),
                const SizedBox(width: 8),
                Text(
                  '$_selectedCrop Price Trend (30 Days)',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 200,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: AppTheme.dividerGray,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 60,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '₹${value.toInt()}',
                            style: Theme.of(context).textTheme.bodySmall,
                          );
                        },
                      ),
                    ),
                    bottomTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 4000),
                        const FlSpot(5, 4050),
                        const FlSpot(10, 4100),
                        const FlSpot(15, 4080),
                        const FlSpot(20, 4150),
                        const FlSpot(25, 4180),
                        const FlSpot(30, 4200),
                      ],
                      isCurved: true,
                      color: AppTheme.primaryGreen,
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppTheme.primaryGreen.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTrendStat('30 Days Ago', '₹4,000', AppTheme.textDark),
                _buildTrendStat('Current', '₹4,200', AppTheme.primaryGreen),
                _buildTrendStat('Change', '+5.0%', AppTheme.successGreen),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.textDark.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildLivePrices() {
    final filteredPrices = _prices.where((price) => 
      price['crop'] == _selectedCrop || _selectedCrop == 'All Crops'
    ).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.access_time, color: AppTheme.highlightBlue),
            const SizedBox(width: 8),
            Text(
              'Live Mandi Prices',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            Text(
              'Updated: 2 min ago',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textDark.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...filteredPrices.map((price) => _buildPriceCard(price)),
      ],
    );
  }

  Widget _buildPriceCard(Map<String, dynamic> price) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price['market'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${price['crop']} - ${price['quality']}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textDark.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${price['price']}/quintal',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: price['isUp'] 
                            ? AppTheme.successGreen.withOpacity(0.1)
                            : AppTheme.errorRed.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
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
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'MSP: ${price['msp']}/quintal',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textDark.withOpacity(0.7),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 90,
                  height: 32,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _showSellDialog(price);
                    },
                    icon: const Icon(Icons.sell, size: 14),
                    label: const Text('Sell', style: TextStyle(fontSize: 11)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentYellow,
                      foregroundColor: AppTheme.textDark,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMSPComparison() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.gavel, color: AppTheme.primaryGreen),
                const SizedBox(width: 8),
                Text(
                  'MSP vs Market Price',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildMSPItem('Soybean', '₹4,300', '₹4,200', false),
            _buildMSPItem('Mustard', '₹5,650', '₹5,800', true),
            _buildMSPItem('Groundnut', '₹5,850', '₹6,500', true),
          ],
        ),
      ),
    );
  }

  Widget _buildMSPItem(String crop, String msp, String market, bool isAboveMSP) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              crop,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: Text(
              msp,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Expanded(
            child: Text(
              market,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isAboveMSP ? AppTheme.successGreen : AppTheme.errorRed,
              ),
            ),
          ),
          Icon(
            isAboveMSP ? Icons.trending_up : Icons.trending_down,
            color: isAboveMSP ? AppTheme.successGreen : AppTheme.errorRed,
            size: 16,
          ),
        ],
      ),
    );
  }

  void _showSellDialog(Map<String, dynamic> price) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sell ${price['crop']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Market: ${price['market']}'),
            Text('Price: ${price['price']}/quintal'),
            const SizedBox(height: 16),
            const Text('Contact buyer directly or register your produce for auction.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Redirecting to buyer contact...')),
              );
            },
            child: const Text('Contact Buyer'),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshPrices() async {
    // Simulate price data refresh
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }
}