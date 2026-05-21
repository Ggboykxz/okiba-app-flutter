import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_colors.dart';

class WhatsAppStatsScreen extends StatelessWidget {
  const WhatsAppStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.seller_whatsapp_stats_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Period selector
          Container(
            padding: const EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Row(
              children: ['7 jours', '30 jours', '90 jours'].map((p) {
                final selected = p == '30 jours';
                return Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
                      decoration: BoxDecoration(
                        color: selected ? colorScheme.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                      child: Text(
                        p,
                        textAlign: TextAlign.center,
                        style: textTheme.labelLarge?.copyWith(
                          color: selected ? colorScheme.onPrimary : colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Main stats cards
          Row(
            children: [
              _bigStat(l10n.seller_whatsapp_views, '1 247', Icons.visibility_rounded, AppColors.primary, colorScheme, textTheme),
              const SizedBox(width: AppSpacing.space12),
              _bigStat(l10n.seller_whatsapp_clicks, '389', Icons.touch_app_rounded, AppColors.secondary, colorScheme, textTheme),
            ],
          ),
          const SizedBox(height: AppSpacing.space12),
          Row(
            children: [
              _bigStat(l10n.seller_whatsapp_orders_count, '43', Icons.shopping_bag_rounded, AppColors.whatsapp, colorScheme, textTheme),
              const SizedBox(width: AppSpacing.space12),
              _bigStat(l10n.seller_whatsapp_sales, '542 500 FCFA', Icons.trending_up_rounded, colorScheme.primary, colorScheme, textTheme),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          // Conversion rate
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.seller_whatsapp_conversion_rate, style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.space12),
                  Row(
                    children: [
                      Text('11.5%', style: textTheme.headlineLarge?.copyWith(
                        color: colorScheme.primary, fontWeight: FontWeight.w700,
                      )),
                      const SizedBox(width: AppSpacing.space12),
                      Icon(Icons.trending_up_rounded, color: colorScheme.primary, size: 20),
                      Text('+2.3%', style: textTheme.bodySmall?.copyWith(color: colorScheme.primary)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.115,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      color: colorScheme.primary,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space8),
                  Text('43 ${l10n.seller_whatsapp_orders_count.toLowerCase()} ${l10n.general_see_all.toLowerCase()} 389 ${l10n.seller_whatsapp_clicks.toLowerCase()}',
                    style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Products ranking
          Text(l10n.seller_whatsapp_top_products, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          ...List.generate(5, (i) {
            return Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.space8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colorScheme.surfaceContainerHighest,
                  child: Text('${i + 1}', style: textTheme.titleSmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                ),
                title: Text(['Chemise traditionnelle', 'Poulet braisé', 'Meuble salon', 'Sac en cuir', 'Parfum'][i]),
                subtitle: Text('${[156, 98, 67, 45, 34][i]} ${l10n.seller_whatsapp_views.toLowerCase()}'),
                trailing: Text('${[12, 8, 3, 5, 2][i]} ${l10n.seller_whatsapp_sales.toLowerCase()}', style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.primary, fontWeight: FontWeight.w700,
                )),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _bigStat(
    String label, String value, IconData icon, Color color, ColorScheme colorScheme, TextTheme textTheme,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.space16),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Column(
          children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: AppSpacing.space12),
            Text(value, style: textTheme.titleLarge?.copyWith(
              color: color, fontWeight: FontWeight.w700,
            ), textAlign: TextAlign.center),
            const SizedBox(height: 2),
            Text(label, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
