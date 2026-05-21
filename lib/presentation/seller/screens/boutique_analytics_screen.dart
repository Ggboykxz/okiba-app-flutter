import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class BoutiqueAnalyticsScreen extends StatefulWidget {
  const BoutiqueAnalyticsScreen({super.key});

  @override
  State<BoutiqueAnalyticsScreen> createState() => _BoutiqueAnalyticsScreenState();
}

class _BoutiqueAnalyticsScreenState extends State<BoutiqueAnalyticsScreen> {
  String _selectedPeriod = '7 jours';

  final _periods = ['7 jours', '30 jours', '90 jours', '1 an'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.boutique_analytics_title),
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
              children: _periods.map((p) {
                final selected = p == _selectedPeriod;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedPeriod = p),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? colorScheme.surface : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                      child: Text(
                        p,
                        textAlign: TextAlign.center,
                        style: textTheme.labelMedium?.copyWith(
                          color: selected ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Revenue card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.boutique_analytics_revenue, style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.space16),
                  Row(
                    children: [
                      Icon(Icons.trending_up_rounded, color: colorScheme.primary, size: 32),
                      const SizedBox(width: AppSpacing.space12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('2 450 000 FCFA',
                            style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                          Text(l10n.boutique_analytics_vs_previous('15'),
                            style: textTheme.bodySmall?.copyWith(color: colorScheme.primary)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space16),
                  // Mini bar chart
                  SizedBox(
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [0.3, 0.5, 0.4, 0.7, 0.6, 0.8, 0.75].map((v) {
                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            height: 80 * v,
                            decoration: BoxDecoration(
                              color: colorScheme.primary.withValues(alpha: 0.3 + v * 0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Stats grid
          Row(
            children: [
              Expanded(child: _statCard(l10n.boutique_analytics_orders, '89', Icons.shopping_bag_rounded, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statCard(l10n.boutique_analytics_views, '12 450', Icons.visibility_rounded, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space12),
          Row(
            children: [
              Expanded(child: _statCard(l10n.boutique_analytics_conversion, '3.2%', Icons.trending_up_rounded, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statCard(l10n.boutique_analytics_avg_cart, '27 500', Icons.shopping_cart_rounded, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          // Top products
          Text(l10n.boutique_analytics_popular, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          ...['Chemise wax', 'Robe pagne', 'Sac artisanal'].asMap().entries.map((e) {
            return Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.space8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colorScheme.primaryContainer,
                  child: Text('${e.key + 1}', style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimaryContainer)),
                ),
                title: Text(e.value),
                trailing: Text('${[45, 32, 28][e.key]} ${l10n.boutique_analytics_sales}', style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary, size: 24),
          const SizedBox(height: AppSpacing.space8),
          Text(value, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          Text(label, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
