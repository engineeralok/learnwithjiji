import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;
import '../core/const.dart';
import '../l10n/app_localizations.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Text(
          l10n.appName,
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: AppConstants.spacingXs),
        Text(
          l10n.appTagline,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface.withAlpha(153),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class CharacterImage extends ConsumerWidget {
  const CharacterImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.0, 0.5),
                radius: 0.75,
                colors: [colorScheme.primary.withAlpha(51), Colors.transparent],
              ),
            ),
            transform: Matrix4.translationValues(0, 40, 0)
              ..scaleByVector3(vector_math.Vector3.all(0.75)),
          ),
        ),
        Image.asset(
          'assets/images/ai-character.png',
          height: 160,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}

class JijiSaysSection extends ConsumerWidget {
  const JijiSaysSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return HookBuilder(
      builder: (context) {
        final controller = useAnimationController(
          duration: const Duration(milliseconds: 1000),
        );

        useEffect(() {
          controller.repeat(reverse: true);
          return null;
        }, [controller]);

        return Row(
          children: [
            Text(
              l10n.jijiSays,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        );
      },
    );
  }
}

class MessageCard extends ConsumerWidget {
  final String message;
  final List<String> bulletPoints;

  const MessageCard({
    super.key,
    required this.message,
    required this.bulletPoints,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final backgroundColor = isDark
        ? colorScheme.surface.withAlpha(102)
        : colorScheme.surface.withAlpha(128);

    return Container(
      padding: const EdgeInsets.all(AppConstants.spacingLg),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius2xl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withAlpha(isDark ? 204 : 179),
              height: 1.6,
            ),
          ),
          const SizedBox(height: AppConstants.spacingMd),
          ...bulletPoints.map(
            (point) => Padding(
              padding: const EdgeInsets.only(bottom: AppConstants.spacingMd),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 6,
                      right: AppConstants.spacingMd,
                    ),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: colorScheme.onSurface.withAlpha(102),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      point,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withAlpha(
                          isDark ? 204 : 179,
                        ),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PowerPointLogo extends StatelessWidget {
  final double size;

  const PowerPointLogo({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon/powerpoin_logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE5CC),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'P',
              style: TextStyle(
                fontSize: size * 0.45,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFEA580C),
              ),
            ),
          ),
        );
      },
    );
  }
}

class YouTubeLogo extends StatelessWidget {
  final double size;

  const YouTubeLogo({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon/youtube_logo.png',
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color(0xFFFEE2E2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(
              Icons.play_circle_filled,
              size: size * 0.6,
              color: const Color(0xFFDC2626),
            ),
          ),
        );
      },
    );
  }
}

class ResourceCard extends ConsumerWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback? onTap;

  const ResourceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.buttonText,
    required this.buttonColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final backgroundColor = isDark
        ? colorScheme.surface.withAlpha(128)
        : colorScheme.surface.withAlpha(128);

    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.spacingSm),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius2xl),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius2xl),
          child: Container(
            padding: const EdgeInsets.all(AppConstants.spacingSm),
            child: Row(
              children: [
                icon,
                const SizedBox(width: AppConstants.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppConstants.spacingXs),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          color: colorScheme.onSurface.withAlpha(153),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppConstants.spacingSm),
                Material(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.spacingMd,
                        vertical: AppConstants.spacingSm,
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CombinedResourceCard extends ConsumerWidget {
  final String presentationTitle;
  final String presentationSubtitle;
  final String videoTitle;
  final String videoSubtitle;
  final String openButtonText;
  final String watchButtonText;
  final VoidCallback? onPresentationTap;
  final VoidCallback? onVideoTap;

  const CombinedResourceCard({
    super.key,
    required this.presentationTitle,
    required this.presentationSubtitle,
    required this.videoTitle,
    required this.videoSubtitle,
    required this.openButtonText,
    required this.watchButtonText,
    this.onPresentationTap,
    this.onVideoTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final backgroundColor = isDark
        ? colorScheme.surface.withAlpha(128)
        : colorScheme.surface.withAlpha(128);

    return Container(
      padding: const EdgeInsets.all(AppConstants.spacingSm),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius2xl),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: AppConstants.glassBlur,
            offset: const Offset(
              AppConstants.spacingXs,
              AppConstants.spacingXs,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPresentationTap,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppConstants.borderRadius2xl),
                topRight: Radius.circular(AppConstants.borderRadius2xl),
              ),
              child: Container(
                padding: const EdgeInsets.all(AppConstants.spacingSm),
                child: Row(
                  children: [
                    const PowerPointLogo(),
                    const SizedBox(width: AppConstants.spacingMd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            presentationTitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppConstants.spacingXs),
                          Text(
                            presentationSubtitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              color: colorScheme.onSurface.withAlpha(153),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppConstants.spacingSm),
                    Material(
                      color: colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: onPresentationTap,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.spacingMd,
                            vertical: AppConstants.spacingSm,
                          ),
                          child: Text(
                            openButtonText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: colorScheme.onSurface.withAlpha(26),
            indent: AppConstants.spacingSm + 40 + AppConstants.spacingMd,
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onVideoTap,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppConstants.borderRadius2xl),
                bottomRight: Radius.circular(AppConstants.borderRadius2xl),
              ),
              child: Container(
                padding: const EdgeInsets.all(AppConstants.spacingSm),
                child: Row(
                  children: [
                    const YouTubeLogo(),
                    const SizedBox(width: AppConstants.spacingMd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            videoTitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppConstants.spacingXs),
                          Text(
                            videoSubtitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              color: colorScheme.onSurface.withAlpha(153),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppConstants.spacingSm),
                    Material(
                      color: colorScheme.secondary,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: onVideoTap,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.spacingMd,
                            vertical: AppConstants.spacingSm,
                          ),
                          child: Text(
                            watchButtonText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
