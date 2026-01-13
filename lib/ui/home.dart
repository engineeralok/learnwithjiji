import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/const.dart';
import '../l10n/app_localizations.dart';
import '../wgts/common.dart';
import '../wgts/home.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: HookBuilder(
        builder: (context) {
          final l10n = AppLocalizations.of(context);
          final searchController = useTextEditingController(
            text: l10n.explainRAG,
          );
          final isDark = Theme.of(context).brightness == Brightness.dark;
          return Container(
            color: isDark ? AppColors.darkBackground : Colors.white,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.spacingMd,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: AppConstants.spacingLg),
                      const HomeHeader(),
                      const SizedBox(height: AppConstants.spacingSm),
                      const CharacterImage(),
                      Column(
                        children: [
                          GlassInput(
                            controller: searchController,
                            onSend: () {},
                          ),
                          const SizedBox(height: AppConstants.spacingLg),
                          Container(
                            constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppConstants.borderRadius2xl,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(51),
                                  blurRadius: 30,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: GlassPanel(
                              padding: const EdgeInsets.all(
                                AppConstants.spacingLg,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const JijiSaysSection(),

                                    MessageCard(
                                      message: l10n.ragMessage,
                                      bulletPoints: [
                                        l10n.ragBullet1,
                                        l10n.ragBullet2,
                                        l10n.ragBullet3,
                                      ],
                                    ),
                                    CombinedResourceCard(
                                      presentationTitle: l10n.presentationTitle,
                                      presentationSubtitle:
                                          l10n.presentationSubtitle,
                                      videoTitle: l10n.videoTitle,
                                      videoSubtitle: l10n.videoSubtitle,
                                      openButtonText: l10n.openButton,
                                      watchButtonText: l10n.watchButton,
                                      onPresentationTap: () {},
                                      onVideoTap: () {},
                                    ),
                                    const SizedBox(
                                      height: AppConstants.spacingLg,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.spacingXl),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
