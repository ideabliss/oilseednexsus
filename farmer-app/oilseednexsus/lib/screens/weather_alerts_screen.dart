import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class WeatherAlertsScreen extends StatefulWidget {
  const WeatherAlertsScreen({super.key});

  @override
  State<WeatherAlertsScreen> createState() => _WeatherAlertsScreenState();
}

class _WeatherAlertsScreenState extends State<WeatherAlertsScreen> {
  final List<Map<String, dynamic>> _forecast = [
    {
      'day': 'Today',
      'date': 'Dec 15',
      'icon': Icons.wb_sunny,
      'temp': '28°C',
      'condition': 'Sunny',
      'humidity': '65%',
      'wind': '12 km/h',
      'rain': '0%',
      'color': AppTheme.accentYellow,
    },
    {
      'day': 'Tomorrow',
      'date': 'Dec 16',
      'icon': Icons.cloud,
      'temp': '26°C',
      'condition': 'Cloudy',
      'humidity': '72%',
      'wind': '15 km/h',
      'rain': '20%',
      'color': AppTheme.textDark,
    },
    {
      'day': 'Wednesday',
      'date': 'Dec 17',
      'icon': Icons.grain,
      'temp': '24°C',
      'condition': 'Light Rain',
      'humidity': '85%',
      'wind': '18 km/h',
      'rain': '60%',
      'color': AppTheme.highlightBlue,
    },
    {
      'day': 'Thursday',
      'date': 'Dec 18',
      'icon': Icons.thunderstorm,
      'temp': '22°C',
      'condition': 'Thunderstorm',
      'humidity': '90%',
      'wind': '25 km/h',
      'rain': '85%',
      'color': AppTheme.errorRed,
    },
    {
      'day': 'Friday',
      'date': 'Dec 19',
      'icon': Icons.wb_sunny,
      'temp': '27°C',
      'condition': 'Sunny',
      'humidity': '68%',
      'wind': '10 km/h',
      'rain': '5%',
      'color': AppTheme.accentYellow,
    },
  ];

  final List<Map<String, dynamic>> _alerts = [
    {
      'type': 'Weather Warning',
      'message': 'Heavy rainfall expected on Thursday. Avoid field operations.',
      'severity': 'High',
      'color': AppTheme.errorRed,
      'icon': Icons.warning,
    },
    {
      'type': 'Pest Alert',
      'message': 'High humidity may increase aphid activity. Monitor crops closely.',
      'severity': 'Medium',
      'color': AppTheme.warningOrange,
      'icon': Icons.bug_report,
    },
    {
      'type': 'Irrigation Advisory',
      'message': 'Expected rainfall will reduce irrigation needs for next 3 days.',
      'severity': 'Low',
      'color': AppTheme.highlightBlue,
      'icon': Icons.water_drop,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather & Alerts'),
        actions: [
          IconButton(
            onPressed: _refreshWeather,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshWeather,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildCurrentWeather(),
            const SizedBox(height: 20),
            _buildAlerts(),
            const SizedBox(height: 20),
            _buildForecast(),
            const SizedBox(height: 20),
            _buildPestRisk(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentWeather() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              AppTheme.highlightBlue,
              AppTheme.highlightBlue.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.wb_sunny,
                  size: 48,
                  color: AppTheme.accentYellow,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '28°C',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: AppTheme.backgroundWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Sunny, Light Breeze',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppTheme.backgroundWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildWeatherStat('Humidity', '65%', Icons.water_drop),
                _buildWeatherStat('Wind', '12 km/h', Icons.air),
                _buildWeatherStat('UV Index', '7', Icons.wb_sunny),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.backgroundWhite, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.backgroundWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.backgroundWhite.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildAlerts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Active Alerts',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        ..._alerts.map((alert) => _buildAlertCard(alert)),
      ],
    );
  }

  Widget _buildAlertCard(Map<String, dynamic> alert) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border(
            left: BorderSide(
              color: alert['color'],
              width: 4,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: alert['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                alert['icon'],
                color: alert['color'],
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        alert['type'],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: alert['color'].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          alert['severity'],
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: alert['color'],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    alert['message'],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForecast() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5-Day Forecast',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: _forecast.length,
            itemBuilder: (context, index) {
              return _buildForecastCard(_forecast[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildForecastCard(Map<String, dynamic> day) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 8),
      child: Card(
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                day['day'],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                day['date'],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Icon(
                day['icon'],
                color: day['color'],
                size: 20,
              ),
              const SizedBox(height: 4),
              Text(
                day['temp'],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                day['rain'],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.highlightBlue,
                  fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPestRisk() {
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
                Text(
                  'Pest Risk Assessment',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildRiskItem('Aphids', 'Medium Risk', AppTheme.warningOrange),
            _buildRiskItem('Bollworm', 'Low Risk', AppTheme.successGreen),
            _buildRiskItem('Whitefly', 'High Risk', AppTheme.errorRed),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskItem(String pest, String risk, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              pest,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              risk,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshWeather() async {
    // Simulate weather data refresh
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }
}