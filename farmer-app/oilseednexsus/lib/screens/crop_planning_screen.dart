import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class CropPlanningScreen extends StatefulWidget {
  const CropPlanningScreen({super.key});

  @override
  State<CropPlanningScreen> createState() => _CropPlanningScreenState();
}

class _CropPlanningScreenState extends State<CropPlanningScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCrop;
  String? _selectedSoilType;
  String? _selectedIrrigation;
  DateTime? _sowingDate;
  final TextEditingController _areaController = TextEditingController();

  final List<Map<String, dynamic>> _crops = [
    {'name': 'Soybean', 'icon': '🌱', 'season': 'Kharif'},
    {'name': 'Mustard', 'icon': '🌻', 'season': 'Rabi'},
    {'name': 'Groundnut', 'icon': '🥜', 'season': 'Kharif'},
    {'name': 'Sesame', 'icon': '🌾', 'season': 'Kharif'},
    {'name': 'Sunflower', 'icon': '🌻', 'season': 'Rabi'},
    {'name': 'Safflower', 'icon': '🌼', 'season': 'Rabi'},
  ];

  final List<String> _soilTypes = [
    'Black Cotton Soil',
    'Red Soil',
    'Alluvial Soil',
    'Sandy Loam',
    'Clay Loam',
  ];

  final List<String> _irrigationTypes = [
    'Rainfed',
    'Drip Irrigation',
    'Sprinkler',
    'Flood Irrigation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Planning'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildCropSelection(),
            const SizedBox(height: 20),
            _buildAreaField(),
            const SizedBox(height: 20),
            _buildSowingDate(),
            const SizedBox(height: 20),
            _buildSoilType(),
            const SizedBox(height: 20),
            _buildIrrigation(),
            const SizedBox(height: 32),
            _buildSubmitButton(),
          ],
        ),
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
                const Icon(Icons.agriculture, color: AppTheme.primaryGreen),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Register New Crop',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Add crop details to get personalized AI recommendations',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCropSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Crop *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: _crops.length,
          itemBuilder: (context, index) {
            final crop = _crops[index];
            final isSelected = _selectedCrop == crop['name'];
            
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCrop = crop['name'];
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? AppTheme.primaryGreen : AppTheme.dividerGray,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: isSelected 
                      ? AppTheme.primaryGreen.withValues(alpha: 0.1)
                      : AppTheme.backgroundWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        crop['icon'],
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              crop['name'],
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              crop['season'],
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppTheme.textSecondary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAreaField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Area (in acres) *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _areaController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter area in acres',
            prefixIcon: Icon(Icons.landscape),
            suffixText: 'acres',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter area';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSowingDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sowing Date *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _selectDate,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.backgroundWhite,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.dividerGray),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: AppTheme.textDark),
                const SizedBox(width: 12),
                Text(
                  _sowingDate != null
                      ? '${_sowingDate!.day}/${_sowingDate!.month}/${_sowingDate!.year}'
                      : 'Select sowing date',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _sowingDate != null 
                        ? AppTheme.textDark 
                        : AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSoilType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Soil Type *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedSoilType,
          decoration: const InputDecoration(
            hintText: 'Select soil type',
            prefixIcon: Icon(Icons.terrain),
          ),
          items: _soilTypes.map((soil) {
            return DropdownMenuItem(
              value: soil,
              child: Text(soil),
            );
          }).toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select soil type';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _selectedSoilType = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildIrrigation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Irrigation Type *',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedIrrigation,
          decoration: const InputDecoration(
            hintText: 'Select irrigation type',
            prefixIcon: Icon(Icons.water_drop),
          ),
          items: _irrigationTypes.map((irrigation) {
            return DropdownMenuItem(
              value: irrigation,
              child: Text(irrigation),
            );
          }).toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select irrigation type';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              _selectedIrrigation = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryGreen,
          foregroundColor: AppTheme.backgroundWhite,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Register Crop',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _sowingDate) {
      setState(() {
        _sowingDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && 
        _selectedCrop != null && 
        _sowingDate != null) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Crop registered successfully!'),
          backgroundColor: AppTheme.successGreen,
        ),
      );
      
      // Navigate back or to dashboard
      Navigator.pop(context);
    } else {
      // Show validation errors
      String errorMessage = '';
      if (_selectedCrop == null) errorMessage += 'Please select a crop. ';
      if (_sowingDate == null) errorMessage += 'Please select sowing date. ';
      
      if (errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage.trim()),
            backgroundColor: AppTheme.errorRed,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _areaController.dispose();
    super.dispose();
  }
}