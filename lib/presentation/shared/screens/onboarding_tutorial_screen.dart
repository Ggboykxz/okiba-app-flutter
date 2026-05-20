import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class OnboardingTutorialScreen extends StatefulWidget {
  const OnboardingTutorialScreen({super.key});

  @override
  State<OnboardingTutorialScreen> createState() => _OnboardingTutorialScreenState();
}

class _OnboardingTutorialScreenState extends State<OnboardingTutorialScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    final steps = [
      _TutorialStep(Icons.home_rounded, l10n.tutorial_step1_title, 'Parcourez les produits près de chez vous. Utilisez la recherche pour trouver ce que vous cherchez.'),
      _TutorialStep(Icons.shopping_cart_rounded, l10n.tutorial_step2_title, 'Ajoutez au panier, négociez le prix avec le vendeur, et choisissez votre mode de livraison.'),
      _TutorialStep(Icons.payment_rounded, l10n.tutorial_step3_title, 'Payez par Orange Money, MTN MoMo, Airtel Money, carte bancaire ou espèces à la livraison.'),
      _TutorialStep(Icons.delivery_dining_rounded, l10n.tutorial_step4_title, 'Suivez votre commande en temps réel. Le livreur vous tient informé à chaque étape.'),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.general_skip),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120, height: 120,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(AppSpacing.radius20),
                      ),
                      child: Icon(steps[_currentStep].icon, size: 56, color: colorScheme.onPrimaryContainer),
                    ),
                    const SizedBox(height: AppSpacing.space32),
                    Text(steps[_currentStep].title, style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(height: AppSpacing.space16),
                    Text(steps[_currentStep].description,
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(height: AppSpacing.space48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(steps.length, (i) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: i == _currentStep ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: i == _currentStep ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => setState(() => _currentStep--),
                        child: Text(l10n.general_previous),
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (_currentStep < steps.length - 1) {
                          setState(() => _currentStep++);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(_currentStep < steps.length - 1 ? l10n.general_next : l10n.general_finish),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TutorialStep {
  final IconData icon;
  final String title;
  final String description;
  const _TutorialStep(this.icon, this.title, this.description);
}
