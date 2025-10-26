import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../utils/app_theme.dart';

class BlockchainTraceabilityScreen extends StatefulWidget {
  final Map<String, dynamic> transactionData;

  const BlockchainTraceabilityScreen({
    super.key,
    required this.transactionData,
  });

  @override
  State<BlockchainTraceabilityScreen> createState() => _BlockchainTraceabilityScreenState();
}

class _BlockchainTraceabilityScreenState extends State<BlockchainTraceabilityScreen> {
  late String _transactionId;
  late String _blockHash;
  late DateTime _timestamp;
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    _generateTransaction();
  }

  void _generateTransaction() {
    _transactionId = 'TX${DateTime.now().millisecondsSinceEpoch}';
    _blockHash = '0x${DateTime.now().millisecondsSinceEpoch.toRadixString(16)}';
    _timestamp = DateTime.now();
    
    // Simulate blockchain verification
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isVerified = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blockchain Traceability'),
        actions: [
          IconButton(
            onPressed: _shareTransaction,
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildQRCode(),
            const SizedBox(height: 20),
            _buildTransactionDetails(),
            const SizedBox(height: 20),
            _buildVerificationStatus(),
            const SizedBox(height: 20),
            _buildBlockchainInfo(),
          ],
        ),
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
              AppTheme.highlightBlue,
              AppTheme.highlightBlue.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.link,
              size: 40,
              color: AppTheme.backgroundWhite,
            ),
            const SizedBox(height: 12),
            Text(
              'Transaction Recorded',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppTheme.backgroundWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your produce sale has been recorded on the blockchain',
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

  Widget _buildQRCode() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'QR Code',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.backgroundWhite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.dividerGray),
              ),
              child: QrImageView(
                data: _generateQRData(),
                version: QrVersions.auto,
                size: 200.0,
                backgroundColor: AppTheme.backgroundWhite,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Scan to verify transaction details',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.receipt, color: AppTheme.primaryGreen),
                const SizedBox(width: 8),
                Text(
                  'Transaction Details',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Transaction ID', _transactionId),
            _buildDetailRow('Buyer', widget.transactionData['buyer']),
            _buildDetailRow('Crop', widget.transactionData['crop']),
            _buildDetailRow('Quantity', widget.transactionData['quantity']),
            _buildDetailRow('Price', widget.transactionData['price']),
            _buildDetailRow('Date', _formatDate(_timestamp)),
            _buildDetailRow('Status', _isVerified ? 'Verified' : 'Pending'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationStatus() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  _isVerified ? Icons.verified : Icons.hourglass_empty,
                  color: _isVerified ? AppTheme.successGreen : AppTheme.warningOrange,
                ),
                const SizedBox(width: 8),
                Text(
                  'Verification Status',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isVerified 
                    ? AppTheme.successGreen.withValues(alpha: 0.1)
                    : AppTheme.warningOrange.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _isVerified 
                      ? AppTheme.successGreen.withValues(alpha: 0.3)
                      : AppTheme.warningOrange.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  if (!_isVerified)
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  if (!_isVerified) const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _isVerified 
                          ? 'Transaction verified and recorded on blockchain'
                          : 'Verifying transaction on blockchain...',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _isVerified ? AppTheme.successGreen : AppTheme.warningOrange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlockchainInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_tree, color: AppTheme.highlightBlue),
                const SizedBox(width: 8),
                Text(
                  'Blockchain Information',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Network', 'Ethereum Testnet'),
            _buildDetailRow('Block Hash', _blockHash),
            _buildDetailRow('Gas Used', '21,000'),
            _buildDetailRow('Confirmations', _isVerified ? '12' : '0'),
          ],
        ),
      ),
    );
  }

  String _generateQRData() {
    return 'TX:$_transactionId|BUYER:${widget.transactionData['buyer']}|CROP:${widget.transactionData['crop']}|QTY:${widget.transactionData['quantity']}|PRICE:${widget.transactionData['price']}|DATE:${_formatDate(_timestamp)}';
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }

  void _shareTransaction() {
    // Implement share functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaction details shared')),
    );
  }
}