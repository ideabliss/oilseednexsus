import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import 'main_navigation_screen.dart';

class FarmerProfileSetup extends StatefulWidget {
  const FarmerProfileSetup({super.key});

  @override
  State<FarmerProfileSetup> createState() => _FarmerProfileSetupState();
}

class _FarmerProfileSetupState extends State<FarmerProfileSetup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _landAreaController = TextEditingController();
  final TextEditingController _aadhaarController = TextEditingController();
  
  String? _selectedRegion;
  final List<String> _selectedCrops = [];
  bool _isLoading = false;

  final List<String> _regions = [
    'Maharashtra',
    'Madhya Pradesh',
    'Rajasthan',
    'Gujarat',
    'Karnataka',
    'Andhra Pradesh',
    'Telangana',
    'Haryana',
    'Punjab',
    'Uttar Pradesh',
  ];

  final List<String> _crops = [
    'Soybean',
    'Mustard',
    'Groundnut',
    'Sesame',
    'Sunflower',
    'Safflower',
    'Niger',
    'Linseed',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Setup'),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            _buildHeader(),
            const SizedBox(height: 32),
            _buildNameField(),
            const SizedBox(height: 16),
            _buildRegionField(),
            const SizedBox(height: 16),
            _buildLandAreaField(),
            const SizedBox(height: 16),
            _buildAadhaarField(),
            const SizedBox(height: 16),
            _buildCropSelection(),
            const SizedBox(height: 32),
            _buildLocationSection(),
            const SizedBox(height: 32),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Complete Your Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Help us personalize your farming experience',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.textDark.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Full Name *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            hintText: 'Enter your full name',
            prefixIcon: Icon(Icons.person),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildRegionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Region/State *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedRegion,
          decoration: const InputDecoration(
            hintText: 'Select your region',
            prefixIcon: Icon(Icons.location_on),
          ),
          items: _regions.map((region) {
            return DropdownMenuItem(
              value: region,
              child: Text(region),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedRegion = value;
            });
          },
          validator: (value) {
            if (value == null) {
              return 'Please select your region';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildLandAreaField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Land Area (in acres) *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _landAreaController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter land area in acres',
            prefixIcon: Icon(Icons.landscape),
            suffixText: 'acres',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter land area';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildAadhaarField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Aadhaar Number (Optional)',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _aadhaarController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter Aadhaar number for Agri-Stack sync',
            prefixIcon: Icon(Icons.credit_card),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'For government scheme benefits and subsidies',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.textDark.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildCropSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Crop Preferences *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Select crops you grow or plan to grow',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.textDark.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _crops.map((crop) {
            final isSelected = _selectedCrops.contains(crop);
            return FilterChip(
              label: Text(crop),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedCrops.add(crop);
                  } else {
                    _selectedCrops.remove(crop);
                  }
                });
              },
              selectedColor: AppTheme.primaryGreen.withOpacity(0.2),
              checkmarkColor: AppTheme.primaryGreen,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.my_location, color: AppTheme.primaryGreen),
                const SizedBox(width: 8),
                Text(
                  'Location Services',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Enable location access for weather alerts and local market prices',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.location_searching),
              label: const Text('Get Current Location'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.highlightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _submitProfile,
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : const Text('Complete Setup'),
    );
  }

  void _getCurrentLocation() async {
    // Simulate location fetch
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location access granted')),
    );
  }

  void _submitProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedCrops.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one crop')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
    );
  }
}