import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class PestAlertScreen extends StatefulWidget {
  const PestAlertScreen({super.key});

  @override
  State<PestAlertScreen> createState() => _PestAlertScreenState();
}

class _PestAlertScreenState extends State<PestAlertScreen> {
  final List<Map<String, dynamic>> _pestAlerts = [
    {
      'pest': 'Aphids',
      'severity': 'High',
      'crop': 'Soybean',
      'location': 'Field A - North Section',
      'detectedDate': '15/12/2024',
      'confidence': '95%',
      'description': 'Large colony detected on leaf undersides. Immediate action required.',
      'treatment': 'Apply Neem oil spray (2ml/L) or release ladybugs',
      'color': AppTheme.errorRed,
    },
    {
      'pest': 'Bollworm',
      'severity': 'Medium',
      'crop': 'Groundnut',
      'location': 'Field B - Center',
      'detectedDate': '14/12/2024',
      'confidence': '87%',
      'description': 'Early stage larvae found on 3 plants. Monitor closely.',
      'treatment': 'Pheromone traps and biological control agents',
      'color': AppTheme.warningOrange,
    },
    {
      'pest': 'Whitefly',
      'severity': 'Low',
      'crop': 'Mustard',
      'location': 'Field C - South',
      'detectedDate': '13/12/2024',
      'confidence': '78%',
      'description': 'Small population detected. Preventive measures recommended.',
      'treatment': 'Yellow sticky traps and regular monitoring',
      'color': AppTheme.accentYellow,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest Alerts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _scanForPests,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshAlerts,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAlertSummary(),
          const SizedBox(height: 20),
          ..._pestAlerts.map((alert) => _buildPestAlertCard(alert)),
          const SizedBox(height: 20),
          _buildPreventiveMeasuresCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scanForPests,
        icon: const Icon(Icons.camera_alt),
        label: const Text('Scan Pest'),
        backgroundColor: AppTheme.primaryGreen,
      ),
    );
  }

  Widget _buildAlertSummary() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              AppTheme.warningOrange,
              AppTheme.warningOrange.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.bug_report,
              size: 40,
              color: AppTheme.backgroundWhite,
            ),
            const SizedBox(height: 12),
            Text(
              'Active Pest Alerts',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.backgroundWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '3 pests detected across your fields',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.backgroundWhite.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSummaryItem('High Risk', '1', AppTheme.errorRed),
                _buildSummaryItem('Medium Risk', '1', AppTheme.warningOrange),
                _buildSummaryItem('Low Risk', '1', AppTheme.accentYellow),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              color: AppTheme.backgroundWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.backgroundWhite,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPestAlertCard(Map<String, dynamic> alert) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: alert['color'].withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.bug_report,
                        color: alert['color'],
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          alert['pest'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          alert['crop'],
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: alert['color'].withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    alert['severity'],
                    style: TextStyle(
                      color: alert['color'],
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildDetailRow('Location', alert['location']),
            _buildDetailRow('Detected', alert['detectedDate']),
            _buildDetailRow('Confidence', alert['confidence']),
            const SizedBox(height: 8),
            Text(
              alert['description'],
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.successGreen.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recommended Treatment:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.successGreen,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    alert['treatment'],
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _viewDetails(alert),
                    icon: const Icon(Icons.info_outline, size: 16),
                    label: const Text('Details'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _markTreated(alert),
                    icon: const Icon(Icons.check, size: 16),
                    label: const Text('Mark Treated'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreventiveMeasuresCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.shield, color: AppTheme.primaryGreen),
                const SizedBox(width: 8),
                const Text(
                  'Preventive Measures',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildPreventiveItem('Regular Field Monitoring', 'Check plants weekly for early detection'),
            _buildPreventiveItem('Crop Rotation', 'Break pest life cycles with different crops'),
            _buildPreventiveItem('Beneficial Insects', 'Maintain habitat for natural predators'),
            _buildPreventiveItem('Proper Sanitation', 'Remove crop residues and weeds'),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to detailed preventive measures
              },
              icon: const Icon(Icons.info, size: 16),
              label: const Text('Learn More'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreventiveItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppTheme.primaryGreen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
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

  void _scanForPests() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AI Pest Scanner'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.camera_alt, size: 64, color: AppTheme.primaryGreen),
            SizedBox(height: 16),
            Text('Point your camera at the affected plant or pest to identify and get treatment recommendations.'),
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
                const SnackBar(content: Text('AI pest scanning feature activated')),
              );
            },
            child: const Text('Start Scan'),
          ),
        ],
      ),
    );
  }

  void _refreshAlerts() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pest alerts refreshed')),
    );
  }

  void _viewDetails(Map<String, dynamic> alert) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${alert['pest']} Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Crop: ${alert['crop']}'),
            Text('Location: ${alert['location']}'),
            Text('Severity: ${alert['severity']}'),
            Text('Confidence: ${alert['confidence']}'),
            const SizedBox(height: 8),
            Text(alert['description']),
            const SizedBox(height: 8),
            Text('Treatment: ${alert['treatment']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _markTreated(Map<String, dynamic> alert) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark as Treated'),
        content: Text('Mark ${alert['pest']} in ${alert['location']} as treated?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${alert['pest']} marked as treated')),
              );
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}