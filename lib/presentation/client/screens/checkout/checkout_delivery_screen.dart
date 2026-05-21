import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';

class CheckoutDeliveryScreen extends StatefulWidget {
  const CheckoutDeliveryScreen({super.key});

  @override
  State<CheckoutDeliveryScreen> createState() => _CheckoutDeliveryScreenState();
}

class _CheckoutDeliveryScreenState extends State<CheckoutDeliveryScreen> {
  int _selected = 0;

  static const _modes = [
    _DeliveryMode(
      Icons.delivery_dining_rounded,
      'Standard',
      'Livraison en 2-4h',
      '2 000 FCFA',
      'Suivi en temps réel\nContact livreur par chat',
    ),
    _DeliveryMode(
      Icons.flash_on_rounded,
      'Express',
      'Livraison en 30min-1h',
      '5 000 FCFA',
      'Priorité absolue\nContact téléphonique\nSi vous êtes pressé',
    ),
    _DeliveryMode(
      Icons.store_rounded,
      'Retrait magasin',
      'Gratuit',
      '0 FCFA',
      'Retirez vous-même\nchez le vendeur\nÉvitez les frais',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(AppLocalizations.of(context).checkout_delivery_mode),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: List.generate(_modes.length, (i) {
          final m = _modes[i];
          final selected = _selected == i;
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.space12),
            child: Material(
              color: selected ? colorScheme.primaryContainer : colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppSpacing.radius16),
                onTap: () => setState(() => _selected = i),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.space20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSpacing.radius16),
                    border: Border.all(
                      color: selected ? colorScheme.primary : colorScheme.outline,
                      width: selected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: selected ? colorScheme.primary : colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(AppSpacing.radius12),
                        ),
                        child: Icon(m.icon, color: selected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant),
                      ),
                      const SizedBox(width: AppSpacing.space16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(m.name, style: selected
                                    ? textTheme.titleMedium?.copyWith(color: colorScheme.onPrimaryContainer)
                                    : textTheme.titleMedium),
                                const Spacer(),
                                Text(m.price, style: textTheme.titleSmall?.copyWith(
                                  color: selected ? colorScheme.onPrimaryContainer : colorScheme.primary,
                                  fontWeight: FontWeight.w700,
                                )),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(m.subtitle, style: textTheme.bodySmall?.copyWith(
                              color: selected ? colorScheme.onPrimaryContainer.withValues(alpha: 0.7) : colorScheme.onSurfaceVariant,
                            )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(AppSpacing.space16, AppSpacing.space12, AppSpacing.space16, AppSpacing.space32),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: ElevatedButton(
              onPressed: () => context.push(RoutePaths.checkoutPayment),
              child: const Text('Continuer vers le paiement'),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeliveryMode {
  final IconData icon;
  final String name;
  final String subtitle;
  final String price;
  final String description;
  const _DeliveryMode(this.icon, this.name, this.subtitle, this.price, this.description);
}
