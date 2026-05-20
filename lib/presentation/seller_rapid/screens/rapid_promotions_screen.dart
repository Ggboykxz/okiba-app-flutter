import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class RapidPromotionsScreen extends StatefulWidget {
  const RapidPromotionsScreen({super.key});

  @override
  State<RapidPromotionsScreen> createState() => _RapidPromotionsScreenState();
}

class _RapidPromotionsScreenState extends State<RapidPromotionsScreen> {
  final _promos = [
    _Promo('Mise en avant', '7 jours', '5 000 FCFA', true, Icons.trending_up_rounded),
    _Promo('Mise en avant', '30 jours', '15 000 FCFA', false, Icons.trending_up_rounded),
    _Promo('Badge "Urgent"', 'Jusqu\'à vente', '2 000 FCFA', false, Icons.flash_on_rounded),
    _Promo('Badge "Nouveauté"', '7 jours', '1 000 FCFA', false, Icons.fiber_new_rounded),
    _Promo('Pack visibilité +', '30 jours', '25 000 FCFA', false, Icons.workspace_premium_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.sellerRapidPromotionsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Banner explicatif
          Container(
            padding: const EdgeInsets.all(AppSpacing.space16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorScheme.secondary, colorScheme.secondary.withValues(alpha: 0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.lightbulb_rounded, color: colorScheme.onSecondary),
                    const SizedBox(width: AppSpacing.space8),
                    Text(l10n.sellerRapidPromotionsBoost, style: textTheme.titleMedium?.copyWith(color: colorScheme.onSecondary)),
                  ],
                ),
                const SizedBox(height: AppSpacing.space8),
                Text(l10n.sellerRapidPromotionsBoostDesc,
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onSecondary.withValues(alpha: 0.8))),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Liste promos
          ..._promos.map((p) => Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.space8),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
              onTap: () {
                if (!p.active) _showConfirmSheet(context, p);
              },
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space16),
                child: Row(
                  children: [
                    Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(
                        color: (p.active ? colorScheme.primary : colorScheme.surfaceContainerHighest).withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(AppSpacing.radius12),
                      ),
                      child: Icon(p.icon, color: p.active ? colorScheme.primary : colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(width: AppSpacing.space12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p.name, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 2),
                          Text('${p.duration} • ${p.price}', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        ],
                      ),
                    ),
                    if (p.active)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_rounded, size: 14, color: colorScheme.primary),
                            const SizedBox(width: 4),
                            Text(l10n.sellerRapidPromotionsActive, style: textTheme.labelSmall?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )
                    else
                      Icon(Icons.chevron_right_rounded, color: colorScheme.onSurfaceVariant),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }

  void _showConfirmSheet(BuildContext context, _Promo promo) {
    final l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(AppSpacing.space16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(promo.name, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.space8),
            Text('${promo.duration} • ${promo.price}',
              style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(color: Theme.of(ctx).colorScheme.onSurfaceVariant)),
            const SizedBox(height: AppSpacing.space16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () { Navigator.pop(ctx); },
                child: Text(l10n.sellerRapidPromotionsActivate),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}

class _Promo {
  final String name;
  final String duration;
  final String price;
  final bool active;
  final IconData icon;
  const _Promo(this.name, this.duration, this.price, this.active, this.icon);
}
