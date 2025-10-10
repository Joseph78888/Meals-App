# 🍽️ Meals App

A beautiful Flutter application for discovering and managing your favorite recipes. Browse through various meal categories, view detailed recipes, and save your favorites with an intuitive and modern interface.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## ✨ Features

### 🏠 Main Features
- **Category Browsing**: Explore meals organized by cuisine types (Italian, Asian, French, etc.)
- **Recipe Details**: View comprehensive recipe information including ingredients and step-by-step instructions
- **Favorites System**: Save and manage your favorite meals
- **Advanced Filtering**: Filter meals by dietary preferences (Gluten-free, Lactose-free, Vegetarian, Vegan)
- **Beautiful UI**: Modern dark theme with smooth animations and responsive design

### 📱 User Interface
- **Tab Navigation**: Easy switching between Categories and Favorites
- **Grid Layout**: Intuitive category display with color-coded tiles
- **Image Loading**: Smooth image loading with placeholder support
- **Responsive Design**: Optimized for various screen sizes
- **Drawer Navigation**: Quick access to settings and filters

### 🔍 Filtering & Search
- **Dietary Filters**: Filter by dietary restrictions and preferences
- **Persistent Settings**: Filters are remembered across app sessions
- **Real-time Filtering**: Instant results when filters are applied

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point and theme configuration
├── data/
│   └── dummy_data.dart       # Sample meal and category data
├── models/
│   ├── category.dart         # Category data model
│   └── meal.dart            # Meal data model with enums
└── presentation/
    ├── screens/
    │   ├── tabs.dart         # Main tab navigation screen
    │   ├── categories.dart   # Category grid display
    │   ├── meals.dart        # Meal list display
    │   ├── meal_details.dart # Detailed recipe view
    │   └── filters.dart      # Filter settings screen
    └── widgets/
        ├── category_grid_item.dart  # Individual category tile
        ├── meal_item.dart          # Individual meal card
        ├── meal_item_trait.dart    # Meal attribute display
        ├── filters_list.dart       # Filter controls
        └── main_drawer.dart        # Navigation drawer
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Joseph78888/meals.git
   cd meals
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🎨 Design & Theme

The app features a modern dark theme with:
- **Primary Color**: Orange-brown (`#833900`)
- **Typography**: Figtree font family from Google Fonts
- **Color Scheme**: Material Design 3 dark theme
- **Gradients**: Beautiful gradient overlays on category tiles
- **Animations**: Smooth transitions and loading states

## 📊 Data Models

### Category Model
```dart
class Category {
  final String id;
  final String title;
  final Color color;
}
```

### Meal Model
```dart
class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}
```

### Enums
- **Complexity**: `simple`, `challenging`, `hard`
- **Affordability**: `affordable`, `pricey`, `luxurious`

## 🔧 Dependencies

### Production Dependencies
- **flutter**: SDK framework
- **cupertino_icons**: iOS-style icons
- **google_fonts**: Custom typography
- **transparent_image**: Image loading placeholders

### Development Dependencies
- **flutter_lints**: Code quality and style enforcement
- **flutter_test**: Testing framework

## 📱 Screenshots

### Main Features
- **Categories Screen**: Grid of colorful meal categories
- **Meals List**: Scrollable list of meals with images and details
- **Recipe Details**: Full recipe with ingredients and instructions
- **Favorites**: Saved meals with easy management
- **Filters**: Dietary preference settings

## 🎯 Key Features Implementation

### State Management
- Uses Flutter's built-in `StatefulWidget` for local state
- Efficient state updates with `setState()`
- Proper widget lifecycle management

### Navigation
- Bottom tab navigation for main sections
- Drawer navigation for additional options
- Push navigation for detailed views
- Proper back navigation handling

### Data Flow
- Centralized data management through `TabsScreen`
- Filter state propagation to child widgets
- Favorites management with snackbar feedback

### Performance Optimizations
- Efficient list rendering with `ListView.builder`
- Image loading with placeholders
- Proper widget disposal and memory management

## 🧪 Testing

Run the test suite:
```bash
flutter test
```

## 📝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🐛 Known Issues

- Some meal images may take time to load on slow connections
- Filters are not persisted between app restarts
- No search functionality for meals

## 🔮 Future Enhancements

- [ ] Add meal search functionality
- [ ] Implement persistent data storage
- [ ] Add user accounts and meal sharing
- [ ] Include nutritional information
- [ ] Add cooking timers
- [ ] Implement meal planning features
- [ ] Add recipe rating system
- [ ] Support for custom meal additions

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

- GitHub: [@Joseph78888](https://github.com/Joseph78888)
- Email: yousifkhalid544@gmail.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for the design system
- Google Fonts for beautiful typography
- All contributors and testers

---

**Made with ❤️ and Flutter**
