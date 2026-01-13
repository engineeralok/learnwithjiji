import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'Jiji';
  static const String appTagline = 'Your AI Friend';
  static const String appDescription = 'AI-driven learning companion';

  static const String fontFamilyDisplay = 'Plus Jakarta Sans';
  static const String fontFamilySans = 'Inter';

  static const double borderRadius = 16.0;
  static const double borderRadiusXl = 20.0;
  static const double borderRadius2xl = 24.0;
  static const double borderRadiusFull = 9999.0;

  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacing2xl = 48.0;

  static const double iconSizeSm = 16.0;
  static const double iconSizeMd = 24.0;
  static const double iconSizeLg = 32.0;

  static const Duration animationDurationFast = Duration(milliseconds: 150);
  static const Duration animationDurationNormal = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);

  static const double glassBlur = 16.0;
  static const double glassBlurSm = 10.0;
  static const double glassBlurXs = 2.0;
}

class AppColors {
  AppColors._();

  static const Color lightPrimary = Color(0xFF2C8C94);
  static const Color lightSecondary = Color(0xFF3B82F6);
  static const Color lightBackground = Color(0xFFEEF2FF);
  static const Color lightBackgroundAlt = Color(0xFFF3F4F6);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF0F2F5);
  static const Color lightTextPrimary = Color(0xFF111827);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightBorder = Color(0xFFFFFFFF);
  static const Color lightGlassBg = Color(0xB3FFFFFF);
  static const Color lightGlassBorder = Color(0x99FFFFFF);
  static const Color darkPrimary = Color(0xFF2DD4BF);
  static const Color darkSecondary = Color(0xFF3B82F6);
  static const Color darkBackground = Color(0xFF1A1F26);
  static const Color darkCard = Color(0xFF242A33);
  static const Color darkSurface = Color(0xFF2D3540);
  static const Color darkSurfaceAlt = Color(0xFF1F242B);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color darkBorder = Color(0x0DFFFFFF);
  static const Color darkGlassBg = Color(0x9932424F);
  static const Color darkGlassBorder = Color(0x1AFFFFFF);
  static const Color accentOrange = Color(0xFFFF6B35);
  static const Color accentRed = Color(0xFFEF4444);
  static const Color accentBlue = Color(0xFF3B82F6);
  static const Color accentTeal = Color(0xFF2DD4BF);

  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  static const Color splashPrimary = Color(0xFF137FEC);
  static const Color splashSecondary = Color(0xFF8B5CF6);
  static const Color splashBackgroundLight = Color(0xFFF6F7F8);
  static const Color splashBackgroundDark = Color(0xFF101922);
}

class AppGradients {
  AppGradients._();

  static const List<Color> lightMeshGradient = [Color(0xFFEEF2FF)];

  static const List<Color> darkMeshGradient = [Color(0xFF1A1F26)];
}
