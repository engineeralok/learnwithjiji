# Learn with Jiji

An AI-driven learning companion application that personalizes how professionals, founders, young adults, and teams learn about AI through an intelligent, adaptive learning experience.

## 📱 About

**Learn with Jiji** is a Flutter-based mobile application developed by VeidaLabs. The platform provides a personalized learning experience for AI concepts, supporting multiple content formats including text, presentations, images, session-recorded videos, and AI-generated avatar videos.


## ✨ Features

### Current Implementation

- **Splash Screen**: Elegant welcome screen with animated logo and branding
- **Home Screen**: Interactive learning interface with:
  - AI character visualization
  - Search functionality with glassmorphic design
  - "Jiji says" section with animated indicators
  - Message cards for learning content
  - Combined resource cards for presentations and videos
- **Theme Support**: Light and dark themes with smooth transitions
- **Localization**: Ready for multi-language support (currently English)
- **Glassmorphic UI**: Modern glass-effect design elements
- **Responsive Design**: Adapts to different screen sizes

### Learning Content Types

- Text content and articles
- PowerPoint presentations
- Images and visual aids
- Session-recorded videos
- AI-generated avatar videos

## 🛠️ Technical Stack

### Core Technologies

- **Flutter**: `^3.10.4` - Cross-platform mobile framework
- **Dart**: Modern programming language

### State Management

- **Riverpod**: `^3.1.0` - Reactive state management and dependency injection
- **Flutter Hooks**: `^0.21.3+1` - Lifecycle management and stateful logic

### Navigation

- **go_router**: `^17.0.1` - Declarative routing and navigation

### UI/UX Libraries

- **Google Fonts**: `^7.0.1` - Custom typography (Plus Jakarta Sans, Inter)
- **vector_math**: `^2.1.4` - Vector mathematics for transformations

### Development Tools

- **flutter_lints**: `^6.0.0` - Linting rules for code quality
- **flutter_launcher_icons**: `^0.14.4` - App icon generation

## 📁 Project Structure

```
lib/
├── core/                    # Core utilities and constants
│   ├── const.dart          # App-wide constants, colors, gradients
│   └── theme.dart          # Light and dark theme definitions
├── l10n/                    # Localization
│   └── app_localizations.dart  # String localization
├── prov/                    # State management (Riverpod providers)
│   ├── router_prov.dart     # Navigation configuration
│   ├── splash_prov.dart     # Splash screen state
│   └── theme_prov.dart      # Theme mode management
├── ui/                      # Screen-level UI components
│   ├── home.dart           # Home screen
│   └── splash.dart         # Splash screen
├── wgts/                    # Reusable widget components
│   ├── common.dart         # Common widgets (logo, glass panels, inputs)
│   ├── home.dart           # Home screen specific widgets
│   └── splash.dart         # Splash screen widgets
└── main.dart               # Application entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.10.4 or higher)
- Dart SDK (3.10.4 or higher)
- Android Studio / VS Code with Flutter extensions
- iOS development tools (for iOS builds)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd learnwithjiji
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

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## 🎨 Design System

### Theme

The application supports both light and dark themes with:
- Custom color schemes
- Google Fonts integration (Plus Jakarta Sans, Inter)
- Glassmorphic UI elements
- Consistent spacing and border radius system

### Color Palette

**Light Theme:**
- Primary: `#2C8C94` (Teal)
- Secondary: `#3B82F6` (Blue)
- Background: `#EEF2FF` (Light Blue)

**Dark Theme:**
- Primary: `#2DD4BF` (Cyan)
- Secondary: `#3B82F6` (Blue)
- Background: `#1A1F26` (Dark Gray)

### Typography

- **Display**: Plus Jakarta Sans (Bold)
- **Body**: Plus Jakarta Sans (Regular)
- **Splash**: Inter (Bold)

## 🏗️ Architecture

### State Management Pattern

The application uses **Riverpod** for state management with the following patterns:

- **NotifierProvider**: For complex state (theme mode, splash state)
- **Provider**: For static values and computed properties
- **ConsumerWidget**: For widgets that need to react to state changes

### Widget Organization

- **Feature-driven structure**: Widgets organized by feature/screen
- **Reusable components**: Common widgets extracted for reuse
- **Separation of concerns**: UI, state, and routing separated

### Code Quality

- Clean, maintainable, and scalable code
- Industry-standard best practices
- Reusable components to avoid repetition
- Comprehensive error handling

## 📱 Screens

### Splash Screen

- Animated logo with gradient effects
- Branding and tagline
- Smooth transition to home screen

### Home Screen

- **Header**: App name and tagline
- **Character Image**: AI character visualization with glow effect
- **Search Bar**: Glassmorphic input with shadow
- **Content Panel**: Scrollable learning content area
  - "Jiji says" section
  - Message cards with bullet points
  - Combined resource cards (PowerPoint & YouTube)

## 🔒 Security

- Basic security awareness in implementation
- Secure data handling practices
- Input validation
- Safe navigation patterns

## 📝 Localization

The application is prepared for multi-language support:
- Currently supports English
- Easy to add additional languages
- All user-facing strings are localized

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📦 Dependencies

See `pubspec.yaml` for the complete list of dependencies.

## 🤝 Contributing

This project follows industry-standard best practices:
- Clean code architecture
- Reusable widget components
- Feature-driven file structure
- Comprehensive documentation

## 📄 License

This project is developed for VeidaLabs assignment purposes.

## 🚧 Future Roadmap

- [ ] B2C market expansion
- [ ] Enhanced personalization features
- [ ] Advanced AI-driven content recommendations
- [ ] Collaborative learning features for teams
- [ ] Analytics and progress tracking
- [ ] User authentication and profiles
- [ ] Offline content support
- [ ] Push notifications

## 👨‍💻 Development

### Code Style

- Follows Flutter/Dart style guidelines
- Uses `flutter_lints` for code quality
- No comments in production code (as per project requirements)
- Consistent naming conventions

### AI Tools Usage

AI tools were utilized in this project for:
- Code generation and optimization
- UI/UX design implementation
- Documentation assistance
- Code review and refactoring suggestions

## 📞 Contact

Developed by **VeidaLabs**

For more information, please refer to the `context.md` file for detailed project context and requirements.

---

**Version**: 0.1.0  
**Last Updated**: 2024
