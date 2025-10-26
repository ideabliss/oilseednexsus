import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import 'blockchain_traceability_screen.dart';

class SalesTrackingScreen extends StatefulWidget {
  const SalesTrackingScreen({super.key});

  @override
  State<SalesTrackingScreen> createState() => _SalesTrackingScreenState();
}

class _SalesTrackingScreenState extends State<SalesTrackingScreen> {
  final List<Map<String, dynamic>> _salesHistory = [
    {
      'id': 'SALE001',
      'crop': 'Soybean',
      'quantity': '500 kg',
      'buyer': 'AgriCorp Ltd',
      'price': '₹27,500',
      'date': '15/12/2024',
      'status': 'Delivered',
      'qrId': 'QR_SOY_001_15122024',
    },
    {
      'id': 'SALE002',
      'crop': 'Groundnut',
      'quantity': '300 kg',
      'buyer': 'FarmFresh Co',
      'price': '₹18,000',
      'date': '12/12/2024',
      'status': 'In Transit',
      'qrId': 'QR_GND_002_12122024',
    },
    {
      'id': 'SALE003',
      'crop': 'Mustard',
      'quantity': '200 kg',
      'buyer': 'Oil Mills Pvt',
      'price': '₹12,400',
      'date': '10/12/2024',
      'status': 'Delivered',
      'qrId': 'QR_MUS_003_10122024',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Tracking'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Filter functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          ..._salesHistory.map((sale) => _buildSaleCard(sale)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
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
          ),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.qr_code_scanner,
              size: 40,
              color: AppTheme.backgroundWhite,
            ),
            const SizedBox(height: 12),
            Text(
              'Track Your Sales',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.backgroundWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Each sale has a unique QR code for complete traceability',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.backgroundWhite.withValues(alpha: 0.9),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaleCard(Map<String, dynamic> sale) {
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
                Text(
                  'Sale ID: ${sale['id']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(sale['status']).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    sale['status'],
                    style: TextStyle(
                      color: _getStatusColor(sale['status']),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Crop', sale['crop']),
                      _buildDetailRow('Quantity', sale['quantity']),
                      _buildDetailRow('Buyer', sale['buyer']),
                      _buildDetailRow('Price', sale['price']),
                      _buildDetailRow('Date', sale['date']),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.qr_code,
                        color: AppTheme.primaryGreen,
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'QR Code',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _viewQRCode(sale),
                    icon: const Icon(Icons.qr_code_scanner, size: 16),
                    label: const Text('View QR'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _viewBlockchain(sale),
                    icon: const Icon(Icons.link, size: 16),
                    label: const Text('Blockchain'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              '$label:',
              style: const TextStyle(
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

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return AppTheme.successGreen;
      case 'In Transit':
        return AppTheme.warningOrange;
      case 'Pending':
        return AppTheme.textSecondary;
      default:
        return AppTheme.textSecondary;
    }
  }

  void _viewQRCode(Map<String, dynamic> sale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('QR Code - ${sale['id']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.dividerGray),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.qr_code,
                    size: 120,
                    color: AppTheme.primaryGreen,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'QR ID: ${sale['qrId']}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Scan this QR code to verify the authenticity and trace the complete journey of this ${sale['crop']} sale.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Share QR functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('QR Code shared successfully')),
              );
            },
            child: const Text('Share'),
          ),
        ],
      ),
    );
  }

  void _viewBlockchain(Map<String, dynamic> sale) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlockchainTraceabilityScreen(
          transactionData: {
            'buyer': sale['buyer'],
            'crop': sale['crop'],
            'quantity': sale['quantity'],
            'price': sale['price'],
          },
        ),
      ),
    );
  }
}