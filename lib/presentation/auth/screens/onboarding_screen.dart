import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  static const _slides = [
    _OnboardingSlide(
      icon: Icons.shopping_bag_rounded,
      title: 'Achetez localement',
      subtitle:
          'Commandez chez les commerçants de votre quartier\net soutenez l\'économie gabonaise.',
    ),
    _OnboardingSlide(
      icon: Icons.store_rounded,
      title: 'Vendez facilement',
      subtitle:
          'Créez votre boutique en ligne en 2 minutes.\nPas de stock ? Pas de problème.',
    ),
    _OnboardingSlide(
      icon: Icons.flash_on_rounded,
      title: 'Livraison rapide',
      subtitle:
          'Suivez votre commande en temps réel.\nLivré en 2h chez vous.',
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => context.go(RoutePaths.roleSelection),
                child: Text(AppLocalizations.of(context)!.generalSkip),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (_, i) {
                  final slide = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            slide.icon,
                            size: 64,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.space40),
                        Text(
                          slide.title,
                          style: textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.space16),
                        Text(
                          slide.subtitle,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (i) {
                return AnimatedContainer(
                  duration: AppSpacing.durationFast,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == i ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == i
                        ? colorScheme.primary
                        : colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                );
              }),
            ),
            const SizedBox(height: AppSpacing.space32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space32),
              child: SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage < _slides.length - 1) {
                      _controller.nextPage(
                        duration: AppSpacing.durationNormal,
                        curve: Curves.easeInOut,
                      );
                    } else {
                      context.go(RoutePaths.roleSelection);
                    }
                  },
                  child: Text(
                    _currentPage < _slides.length - 1
                        ? AppLocalizations.of(context)!.generalNext
                        : AppLocalizations.of(context)!.onboardingStart,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
          ],
        ),
      ),
    );
  }
}

class _OnboardingSlide {
  final IconData icon;
  final String title;
  final String subtitle;
  const _OnboardingSlide({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}
