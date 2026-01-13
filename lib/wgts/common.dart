import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/const.dart';

class MeshGradientBackground extends StatelessWidget {
  final Widget child;

  const MeshGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        gradient: isDark
            ? RadialGradient(
                center: const Alignment(0.4, 0.2),
                radius: 1.0,
                colors: [const Color(0xFF1E293B), AppColors.darkBackground],
                stops: const [0.0, 0.5],
              )
            : RadialGradient(
                center: const Alignment(0.4, 0.2),
                radius: 1.0,
                colors: [const Color(0xFFE0E7FF), AppColors.lightBackground],
                stops: const [0.0, 0.5],
              ),
      ),
      child: child,
    );
  }
}

class GlassPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const GlassPanel({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? AppColors.darkGlassBg
        : AppColors.lightGlassBg;
    final borderColor = isDark
        ? AppColors.darkGlassBorder
        : AppColors.lightGlassBorder;

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        borderRadius ?? AppConstants.borderRadius2xl,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: AppConstants.glassBlur,
          sigmaY: AppConstants.glassBlur,
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              borderRadius ?? AppConstants.borderRadius2xl,
            ),
            border: Border.all(color: borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withAlpha(51)
                    : Colors.black.withAlpha(13),
                blurRadius: 32,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class GlassInput extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSend;
  final TextEditingController? controller;

  const GlassInput({
    super.key,
    this.hintText,
    this.initialValue,
    this.onChanged,
    this.onSend,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? const Color(0x990F172A)
        : const Color(0xD9FFFFFF);
    final borderColor = isDark
        ? const Color(0x0DFFFFFF)
        : const Color(0xCCFFFFFF);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius2xl),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(77),
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius2xl),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: AppConstants.glassBlurSm,
            sigmaY: AppConstants.glassBlurSm,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(AppConstants.borderRadius2xl),
              border: Border.all(color: borderColor, width: 1),
            ),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(
                color: isDark
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                  size: AppConstants.iconSizeMd,
                ),
                suffixIcon: onSend != null
                    ? IconButton(
                        icon: Transform.rotate(
                          angle: -0.785398,
                          child: Icon(
                            Icons.send_rounded,
                            color: AppColors.lightPrimary,
                            size: AppConstants.iconSizeLg,
                          ),
                        ),
                        onPressed: onSend,
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacingMd,
                  vertical: AppConstants.spacingMd,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class JijiLogo extends StatelessWidget {
  final double size;
  final bool useSplashColors;

  const JijiLogo({super.key, this.size = 120.0, this.useSplashColors = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = useSplashColors
        ? AppColors.splashPrimary
        : (isDark ? AppColors.darkPrimary : AppColors.lightPrimary);
    final secondaryColor = useSplashColors
        ? AppColors.splashSecondary
        : (isDark ? AppColors.darkSecondary : AppColors.lightSecondary);

    return CustomPaint(
      size: Size(size, size),
      painter: _JijiLogoPainter(
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
      ),
    );
  }
}

class _JijiLogoPainter extends CustomPainter {
  final Color primaryColor;
  final Color secondaryColor;

  _JijiLogoPainter({required this.primaryColor, required this.secondaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [primaryColor, secondaryColor],
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradientPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final fillGradientPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final scale = size.width / 100.0;
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final offsetX = centerX - 50 * scale;
    final offsetY = centerY - 50 * scale;

    canvas.save();
    canvas.translate(offsetX, offsetY);
    canvas.scale(scale);

    final jPath = Path()
      ..moveTo(65, 20)
      ..lineTo(65, 65)
      ..cubicTo(65, 78.8071, 53.8071, 90, 40, 90)
      ..cubicTo(26.1929, 90, 15, 78.8071, 15, 65);

    gradientPaint.strokeWidth = 12;
    canvas.drawPath(jPath, gradientPaint);

    final circleCenter = const Offset(65, 20);
    fillGradientPaint.style = PaintingStyle.fill;
    canvas.drawCircle(circleCenter, 10, fillGradientPaint);

    final sparkPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final sparkPath1 = Path()
      ..moveTo(78, 20)
      ..lineTo(88, 20);

    final sparkPath2 = Path()
      ..moveTo(65, 7)
      ..lineTo(65, 7);

    final sparkPath3 = Path()
      ..moveTo(84, 10)
      ..lineTo(78, 16);

    canvas.drawPath(sparkPath1, sparkPaint);
    canvas.drawPath(sparkPath2, sparkPaint);
    canvas.drawPath(sparkPath3, sparkPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const HomeBottomNavigationBar({super.key, this.currentIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? AppColors.darkCard.withAlpha(128)
        : AppColors.lightCard.withAlpha(204);
    final borderColor = isDark
        ? AppColors.darkGlassBorder
        : AppColors.lightGlassBorder;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.borderRadiusFull),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: AppConstants.glassBlur,
          sigmaY: AppConstants.glassBlur,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingMd,
            vertical: AppConstants.spacingSm,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusFull),
            border: Border.all(color: borderColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(26),
                blurRadius: 20,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context: context,
                index: 0,
                icon: Icons.home_rounded,
                activeIcon: Icons.home,
                label: 'Home',
                isActive: currentIndex == 0,
              ),
              _buildNavItem(
                context: context,
                index: 1,
                icon: Icons.school_rounded,
                activeIcon: Icons.school,
                label: 'Learn',
                isActive: currentIndex == 1,
              ),
              _buildNavItem(
                context: context,
                index: 2,
                icon: Icons.chat_bubble_outline_rounded,
                activeIcon: Icons.chat_bubble,
                label: 'Jiji',
                isActive: currentIndex == 2,
              ),
              _buildNavItem(
                context: context,
                index: 3,
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person,
                label: 'Profile',
                isActive: currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool isActive,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary;
    final inactiveColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: isActive
              ? BoxDecoration(color: primaryColor, shape: BoxShape.circle)
              : null,
          child: InkWell(
            onTap: () => onTap?.call(index),
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: 56,
              height: 56,
              child: Center(
                child: Icon(
                  isActive ? activeIcon : icon,
                  size: AppConstants.iconSizeMd,
                  color: isActive ? Colors.white : inactiveColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
