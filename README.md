<p align="center">
  <img src="https://via.placeholder.com/200x80/FF6B35/FFFFFF?text=RAWAAN" alt="Rawaan Vault Logo" width="200"/>
</p>

<h1 align="center">Rawaan Vault</h1>

<p align="center">
  <strong>100+ Production-Ready Flutter UI Templates</strong>
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#installation">Installation</a> •
  <a href="#templates">Templates</a> •
  <a href="#showcases">Showcases</a> •
  <a href="#contributing">Contributing</a>
</p>

---

## ✨ Features

- 🎨 **100+ UI Templates** - Auth, Splash, Welcome, Onboarding, Cart, and more
- 📱 **4 Complete App Demos** - Full app showcases with navigation flows
- 🎯 **Production Ready** - Clean, optimized code ready for your projects
- 🌙 **Dark & Light Modes** - Multiple theme variants for each template
- 📐 **Responsive Design** - Works on mobile, tablet, and web
- 🔧 **Easy Customization** - Well-organized code with consistent styling

## 📦 Installation

```bash
git clone https://github.com/yourusername/rawaan_vault.git
cd rawaan_vault
flutter pub get
flutter run
```

## 🎯 Templates

| Category      | Count | Description                     |
|---------------|-------|---------------------------------|
| Auth          | 30    | Login, Signup, OTP screens      |
| Splash        | 30    | Animated splash screens         |
| Welcome       | 14    | Hero landing screens            |
| Onboarding    | 11    | App intro flows                 |
| Cart          | 10    | Shopping cart UIs               |
| Settings      | 9     | Settings & preferences          |
| Subscription  | 5     | Paywall & pricing screens       |
| Food          | 4     | Food delivery UIs               |

## 🚀 Showcases

Complete app demos with full navigation:

| App        | Description               | Screens |
|------------|---------------------------|---------|
| Brew       | Coffee ordering app       | 3       |
| Foodpanda  | Food delivery clone       | 6       |
| Loza       | E-commerce app            | 2       |
| Maniro     | Lifestyle app             | 2       |

## 📁 Project Structure

```
lib/
├── src/
│   ├── core/               # Shared utilities & constants
│   │   └── constants/      # Colors, dimensions
│   ├── templates/          # Individual UI screens
│   │   ├── auth/           # Authentication screens
│   │   ├── splash/         # Splash screens
│   │   ├── welcome/        # Welcome screens
│   │   └── ...
│   ├── showcases/          # Complete app demos
│   │   ├── brew/
│   │   ├── foodpanda/
│   │   └── ...
│   └── widgets/            # Reusable components
├── main.dart               # Entry point
└── rawaan_vault.dart       # Library exports

assets/
├── animations/             # Lottie files
├── icons/                  # Custom icons
└── images/
    ├── branding/           # Logos & branding
    └── mockups/            # Demo images
```

## 🎨 Using Templates

1. Browse the templates in `lib/src/templates/`
2. Find a design you like
3. Copy the file to your project
4. Customize colors, fonts, and content

```dart
// Example: Using a template
import 'package:rawaan_vault/src/templates/auth/auth.v1.dart';

// Or use the brand colors
import 'package:rawaan_vault/src/core/constants/colors.dart';

Container(
  color: RawaanColors.primary, // Rawaan Orange
)
```

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Made with ❤️ by <strong>Rawaan</strong>
</p>
