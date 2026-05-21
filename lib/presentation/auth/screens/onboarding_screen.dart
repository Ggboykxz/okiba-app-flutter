import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';
import '../../../core/widgets/onboarding_image.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  static const _steps = [
    OnboardingStep.buy,
    OnboardingStep.sell,
    OnboardingStep.deliver,
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
                child: Text(AppLocalizations.of(context).general_skip),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _steps.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (_, i) {
                  final step = _steps[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OnboardingImage(step: step, size: 200),
                        const SizedBox(height: AppSpacing.space40),
                        Text(
                          _titleForStep(step),
                          style: textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.space16),
                        Text(
                          _subtitleForStep(step, AppLocalizations.of(context)),
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
              children: List.generate(_steps.length, (i) {
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
                if (_currentPage < _steps.length - 1) {
                  _controller.nextPage(
                    duration: AppSpacing.durationNormal,
                    curve: Curves.easeInOut,
                  );
                } else {
                  context.go(RoutePaths.roleSelection);
                }
              },
              child: Text(
                _currentPage < _steps.length - 1
                        ? AppLocalizations.of(context).general_next
                        : AppLocalizations.of(context).onboarding_start,
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

String _titleForStep(OnboardingStep step) {
  switch (step) {
    case OnboardingStep.buy:
      return 'Achetez localement';
    case OnboardingStep.sell:
      return 'Vendez facilement';
    case OnboardingStep.deliver:
      return 'Livraison rapide';
    case OnboardingStep.trust:
      return 'Paiement sécurisé';
  }
}

String _subtitleForStep(OnboardingStep step, AppLocalizations l10n) {
  switch (step) {
    case OnboardingStep.buy:
      return 'Commandez chez les commerçants de votre quartier\net soutenez l\'économie gabonaise.';
    case OnboardingStep.sell:
      return 'Créez votre boutique en ligne en 2 minutes.\nPas de stock ? Pas de problème.';
    case OnboardingStep.deliver:
      return 'Suivez votre commande en temps réel.\nLivré en 2h chez vous.';
    case OnboardingStep.trust:
      return 'Transactions sécurisées via Mobile Money\net paiement à la livraison.';
  }
}
