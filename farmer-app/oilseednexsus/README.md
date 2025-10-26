# Oilseed Nexus - Farmer App

A modern Flutter application for oilseed farmers with AI-driven advisories, crop planning, price forecasting, weather alerts, and blockchain traceability.

## Features

### 🌾 Core Features
- **AI-Powered Advisories**: Personalized crop recommendations and yield predictions
- **Crop Planning**: Register crops with detailed planning information
- **Weather Alerts**: 5-day forecast with pest risk assessment
- **Market Prices**: Live mandi prices with trend analysis
- **Direct Market Access**: Connect with buyers and FPOs
- **Blockchain Traceability**: QR code-based produce tracking

### 🎨 Design Principles
- **Color Palette**: 
  - Primary Green: #2E7D32 (growth & agriculture)
  - Accent Yellow: #FBC02D (oilseeds)
  - Highlight Blue: #42A5F5 (AI insights)
- **Typography**: Inter/Poppins fonts for clarity
- **UI Style**: Flat minimal with soft shadows and rounded corners
- **Layout**: Card-based, data-rich but not cluttered

### 📱 Screens Implemented

1. **Splash & Onboarding** - App introduction with 3-slide onboarding
2. **Login & Verification** - Phone-based OTP authentication
3. **Farmer Profile Setup** - Complete profile with crop preferences
4. **Dashboard** - Main hub with quick stats and actions
5. **Crop Planning** - Register new crops with detailed information
6. **AI Advisory** - Yield predictions, price forecasts, and recommendations
7. **Weather Alerts** - 5-day forecast with farming advisories
8. **Market Prices** - Live prices with trends and MSP comparison

### 🛠️ Technical Stack
- **Framework**: Flutter 3.8.1+
- **State Management**: StatefulWidget (can be upgraded to Provider/Bloc)
- **Charts**: FL Chart for data visualization
- **Fonts**: Google Fonts (Inter)
- **Authentication**: Firebase Auth ready
- **Location**: Geolocator for location services

## Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd oilseed-nexus/farmer-app/oilseednexsus
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── utils/
│   └── app_theme.dart       # Theme configuration
├── screens/
│   ├── splash_screen.dart
│   ├── onboarding_screen.dart
│   ├── login_screen.dart
│   ├── farmer_profile_setup.dart
│   ├── dashboard_screen.dart
│   ├── crop_planning_screen.dart
│   ├── ai_advisory_screen.dart
│   ├── weather_alerts_screen.dart
│   └── market_price_screen.dart
└── widgets/
    ├── dashboard_card.dart
    ├── weather_widget.dart
    └── price_widget.dart
```

## Features to Implement

### Phase 2 Features
- [ ] Procurement & Buyer Linkage screen
- [ ] Blockchain Traceability with QR codes
- [ ] Performance Dashboard with analytics
- [ ] Finance & Insurance integration
- [ ] Help & Support with KVK Chatbot
- [ ] Settings with language switching

### Backend Integration
- [ ] Firebase Authentication setup
- [ ] API integration for weather data (IMD)
- [ ] Market price APIs (Agmarknet/eNAM)
- [ ] AI model integration for predictions
- [ ] Blockchain integration for traceability

### Enhancements
- [ ] Offline support
- [ ] Push notifications
- [ ] Multi-language support (Hindi, Marathi)
- [ ] Dark mode theme
- [ ] Advanced analytics
- [ ] Export/Import data functionality

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or support, please contact the development team.