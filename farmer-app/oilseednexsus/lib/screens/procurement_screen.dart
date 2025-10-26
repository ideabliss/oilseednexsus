import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import 'blockchain_traceability_screen.dart';

class ProcurementScreen extends StatefulWidget {
  const ProcurementScreen({super.key});

  @override
  State<ProcurementScreen> createState() => _ProcurementScreenState();
}

class _ProcurementScreenState extends State<ProcurementScreen> {
  String _selectedCrop = 'Soybean';
  final List<String> _crops = ['Soybean', 'Mustard', 'Groundnut', 'Sesame'];

  final List<Map<String, dynamic>> _buyers = [
    {
      'name': 'Maharashtra FPO',
      'type': 'FPO',
      'location': 'Nagpur, Maharashtra',
      'distance': '12 km',
      'price': '₹4,250/quintal',
      'rating': 4.5,
      'verified': true,
      'capacity': '500 quintals',
    },
    {
      'name': 'Adani Wilmar Ltd',
      'type': 'Processor',
      'location': 'Indore, MP',
      'distance': '45 km',
      'price': '₹4,200/quintal',
      'rating': 4.8,
      'verified': true,
      'capacity': '2000 quintals',
    },
    {
      'name': 'Local Trader',
      'type': 'Trader',
      'location': 'Wardha, Maharashtra',
      'distance': '8 km',
      'price': '₹4,100/quintal',
      'rating': 4.2,
      'verified': false,
      'capacity': '100 quintals',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Buyers'),
        actions: [
          IconButton(
            onPressed: _refreshBuyers,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshBuyers,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildHeader(),
                  const SizedBox(height: 16),
                  ..._buyers.map((buyer) => _buildBuyerCard(buyer)),
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
          Flexible(
            child: ElevatedButton.icon(
              onPressed: _showFilters,
              icon: const Icon(Icons.filter_list, size: 18),
              label: const Text('Filter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.highlightBlue,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.storefront, color: AppTheme.primaryGreen),
                const SizedBox(width: 8),
                Text(
                  'Available Buyers',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Connect with verified buyers and get the best prices for your produce',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuyerCard(Map<String, dynamic> buyer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
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
                    color: _getBuyerTypeColor(buyer['type']).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getBuyerTypeIcon(buyer['type']),
                    color: _getBuyerTypeColor(buyer['type']),
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
                          Expanded(
                            child: Text(
                              buyer['name'],
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (buyer['verified'])
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppTheme.successGreen.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    size: 12,
                                    color: AppTheme.successGreen,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    'Verified',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppTheme.successGreen,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      Text(
                        buyer['type'],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: AppTheme.textSecondary),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${buyer['location']} • ${buyer['distance']}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: AppTheme.accentYellow),
                    const SizedBox(width: 2),
                    Text(
                      buyer['rating'].toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.inventory, size: 16, color: AppTheme.textSecondary),
                const SizedBox(width: 4),
                Text(
                  'Capacity: ${buyer['capacity']}',
                  style: Theme.of(context).textTheme.bodySmall,
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
                      Text(
                        'Price Offered',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      Text(
                        buyer['price'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () => _sellToBuyer(buyer),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    child: const Text('Sell Now', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getBuyerTypeColor(String type) {
    switch (type) {
      case 'FPO':
        return AppTheme.primaryGreen;
      case 'Processor':
        return AppTheme.highlightBlue;
      case 'Trader':
        return AppTheme.accentYellow;
      default:
        return AppTheme.textSecondary;
    }
  }

  IconData _getBuyerTypeIcon(String type) {
    switch (type) {
      case 'FPO':
        return Icons.groups;
      case 'Processor':
        return Icons.factory;
      case 'Trader':
        return Icons.person;
      default:
        return Icons.business;
    }
  }

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter Buyers',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            const Text('Filter options will be implemented here'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }

  void _sellToBuyer(Map<String, dynamic> buyer) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sell to ${buyer['name']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: ${buyer['price']}'),
            Text('Location: ${buyer['location']}'),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Quantity (quintals)',
                hintText: 'Enter quantity to sell',
              ),
              keyboardType: TextInputType.number,
            ),
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
              _processSale(buyer);
            },
            child: const Text('Confirm Sale'),
          ),
        ],
      ),
    );
  }

  void _processSale(Map<String, dynamic> buyer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlockchainTraceabilityScreen(
          transactionData: {
            'buyer': buyer['name'],
            'price': buyer['price'],
            'quantity': '10 quintals',
            'crop': _selectedCrop,
          },
        ),
      ),
    );
  }

  Future<void> _refreshBuyers() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }
}