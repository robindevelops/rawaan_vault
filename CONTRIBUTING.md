# Contributing to Rawaan Vault

Thank you for your interest in contributing to Rawaan Vault! 🎉

## 🚀 How to Contribute

### Adding New Templates

1. **Fork** the repository
2. Create a new branch: `git checkout -b feature/new-template`
3. Add your template to the appropriate category in `lib/src/templates/`
4. Follow the naming convention: `{category}.v{number}.dart`
5. Submit a **Pull Request**

### Template Guidelines

- ✅ Use `RawaanColors` from `core/constants/colors.dart` for brand consistency
- ✅ Keep widgets self-contained (no external dependencies)
- ✅ Support both light and dark themes when possible
- ✅ Use Google Fonts or system fonts only
- ✅ Add meaningful comments for complex logic

### Code Style

```dart
// ✅ Good: Descriptive class names
class AuthMinimalDarkScreen extends StatelessWidget {}

// ❌ Bad: Vague names
class Screen1 extends StatelessWidget {}
```

### File Structure

```
lib/src/templates/auth/
├── auth.v1.dart        # Minimal light theme
├── auth.v2.dart        # Gradient dark theme
└── ...
```

## 🐛 Reporting Issues

- Check existing issues first
- Include Flutter version and device info
- Provide screenshots for UI issues

## 📬 Questions?

Open a discussion or reach out to the maintainers.

---

Thank you for helping make Rawaan Vault better! ❤️
