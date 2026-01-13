import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/const.dart';
import '../prov/splash_prov.dart';
import '../wgts/splash.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (context.mounted) {
          ref.read(splashProvider.notifier).completeSplash();
          context.go('/home');
        }
      });
    });

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.splashBackgroundDark
          : AppColors.splashBackgroundLight,
      body: Stack(
        children: [
          const SplashBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.info_outline,
                      color: isDark
                          ? const Color(0xFF9CA3AF)
                          : const Color(0xFF617589),
                      size: 24,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SplashLogoSection(),
                        const SizedBox(height: 40),
                        const SplashTypography(),
                      ],
                    ),
                  ),
                  const SplashFooter(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
