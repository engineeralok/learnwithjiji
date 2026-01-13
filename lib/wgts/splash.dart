import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/const.dart';
import 'common.dart';

class SplashLogoSection extends StatelessWidget {
  final double logoSize;

  const SplashLogoSection({super.key, this.logoSize = 120.0});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final containerSize = MediaQuery.of(context).size.width * 0.5;
    final maxSize = 224.0;

    return Container(
      width: containerSize > maxSize ? maxSize : containerSize,
      height: containerSize > maxSize ? maxSize : containerSize,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1F2937) : Colors.white,
        borderRadius: BorderRadius.circular(44),
        border: Border.all(
          color: isDark ? const Color(0xFF374151) : const Color(0xFFF3F4F6),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(44),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.splashPrimary.withAlpha(51),
                    AppColors.splashSecondary.withAlpha(51),
                  ],
                ),
              ),
            ),
          ),
          JijiLogo(size: logoSize, useSplashColors: true),
        ],
      ),
    );
  }
}

class SplashTypography extends StatelessWidget {
  const SplashTypography({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF111418),
              letterSpacing: -0.5,
              height: 1.2,
            ),
            children: [
              const TextSpan(text: 'Learn with '),
              TextSpan(
                text: 'Jiji',
                style: TextStyle(
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [
                        AppColors.splashPrimary,
                        AppColors.splashSecondary,
                      ],
                    ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your AI-driven learning companion',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isDark ? const Color(0xFFD1D5DB) : const Color(0xFF111418),
            letterSpacing: -0.015,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class SplashFooter extends StatelessWidget {
  const SplashFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          width: 48,
          height: 4,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1F2937) : const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: isDark ? const Color(0xFF6B7280) : const Color(0xFF617589),
              height: 1.4,
            ),
            children: [
              const TextSpan(text: 'Developed by '),
              TextSpan(
                text: 'VeidaLabs',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.splashPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 256,
            height: 256,
            decoration: BoxDecoration(
              color: AppColors.splashPrimary.withAlpha(13),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              color: AppColors.splashSecondary.withAlpha(13),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
