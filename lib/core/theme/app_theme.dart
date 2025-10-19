import 'package:flutter/material.dart';

/// App theme constants and styles
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Colors
  static const Color primaryBlue = Color(0xFF0179CB);
  static const Color secondaryBlue = Color(0xFF0C314E);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color accent = Colors.deepOrange;
  static const Color background = Colors.white;
  static const Color divider = Color(0xFFE0E0E0);

  /// Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;

  /// Border Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 24.0;

  /// Card Elevation
  static const double cardElevation = 2.0;

  /// Icon Sizes
  static const double iconSizeS = 14.0;
  static const double iconSizeM = 24.0;
  static const double iconSizeL = 32.0;

  /// Button Styles
  static final ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryBlue,
    side: const BorderSide(color: primaryBlue),
    padding: const EdgeInsets.symmetric(
      horizontal: spacingM,
      vertical: spacingS,
    ),
  );

  /// Text Styles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: textSecondary,
  );

  static const TextStyle priceStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: accent,
  );

  /// Responsive Breakpoints
  static const double tabletBreakpoint = 768.0;
  static const double desktopBreakpoint = 1024.0;

  /// Grid Layout
  static const double maxContentWidth = 1200.0;
  static const double gridSpacing = spacingM;
  static const int gridColumns = 12;
}
