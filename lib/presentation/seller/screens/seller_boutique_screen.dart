import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';
import 'package:go_router/go_router.dart';

class SellerBoutiqueScreen extends StatelessWidget {
  const SellerBoutiqueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.boutiqueTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () => context.push(RoutePaths.boutiqueSettings),
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            onPressed: () => context.push(RoutePaths.boutiqueAnalytics),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // En-tête boutique
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                    ),
                    child: Icon(
                      Icons.store_rounded,
                      size: 32,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adélaïde Styles',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Mode & Accessoires',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 16,
                              color: colorScheme.secondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.8 (156 avis)',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_rounded),
                    onPressed: () => context.push(RoutePaths.boutiqueSettings),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Statistiques
          Text(l10n.boutiqueOverview, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Row(
            children: [
              Expanded(
                child: _statCard(
                  '156',
                  l10n.boutiqueProducts,
                  Icons.inventory_2_rounded,
                  colorScheme.primary,
                  colorScheme,
                  textTheme,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _statCard(
                  '1 230',
                  l10n.sellerOrders,
                  Icons.shopping_bag_rounded,
                  colorScheme.secondary,
                  colorScheme,
                  textTheme,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space12),
          Row(
            children: [
              Expanded(
                child: _statCard(
                  '2,5 M',
                  '${l10n.currencyFcfa} ${l10n.boutiqueSales}',
                  Icons.trending_up_rounded,
                  colorScheme.tertiary,
                  colorScheme,
                  textTheme,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _statCard(
                  '4.8',
                  l10n.boutiqueRating,
                  Icons.star_rounded,
                  colorScheme.secondary,
                  colorScheme,
                  textTheme,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          // Actions rapides
          Text(l10n.boutiqueActions, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  l10n.boutiqueAddProduct,
                  Icons.add_circle_rounded,
                  colorScheme.primary,
                  colorScheme,
                  textTheme,
                  () => context.push(RoutePaths.boutiqueProductCreate),
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _actionButton(
                  l10n.boutiqueManageStock,
                  Icons.inventory_rounded,
                  colorScheme.secondary,
                  colorScheme,
                  textTheme,
                  () => context.push(RoutePaths.boutiqueInventory),
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _actionButton(
                  l10n.boutiqueViewReviews,
                  Icons.rate_review_rounded,
                  colorScheme.tertiary,
                  colorScheme,
                  textTheme,
                  () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          // Produits récents
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.boutiqueRecentProducts, style: textTheme.titleLarge),
              TextButton(
                onPressed: () => context.push(RoutePaths.boutiqueCatalog),
                child: Text(l10n.boutiqueManage),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space12),
          _productItem(
            'Chemise traditionnelle',
            '15 000 FCFA',
            '42 en stock',
            true,
            colorScheme,
            textTheme,
            context,
          ),
          _productItem(
            'Robe pagne wax',
            '25 000 FCFA',
            '18 en stock',
            true,
            colorScheme,
            textTheme,
            context,
          ),
          _productItem(
            'Sac artisanal',
            '12 000 FCFA',
            'Épuisé',
            false,
            colorScheme,
            textTheme,
            context,
          ),
          _productItem(
            'Boucles d\'oreilles',
            '8 000 FCFA',
            '35 en stock',
            true,
            colorScheme,
            textTheme,
            context,
          ),
          const SizedBox(height: AppSpacing.space24),
          // Performance
          Text(l10n.boutiquePerformance, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                children: [
                  _perfRow(
                    l10n.boutiqueViewsThisWeek,
                    '1 245',
                    '+12%',
                    true,
                    textTheme,
                    colorScheme,
                  ),
                  const Divider(height: AppSpacing.space20),
                  _perfRow(
                    l10n.boutiqueConversionRate,
                    '3.2%',
                    '+0.5%',
                    true,
                    textTheme,
                    colorScheme,
                  ),
                  const Divider(height: AppSpacing.space20),
                  _perfRow(
                    l10n.boutiqueResponseTime,
                    '~15 min',
                    '-2 min',
                    true,
                    textTheme,
                    colorScheme,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _statCard(
    String value,
    String label,
    IconData icon,
    Color color,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
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
          Icon(icon, color: color, size: 24),
          const SizedBox(height: AppSpacing.space8),
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(
    String label,
    IconData icon,
    Color color,
    ColorScheme colorScheme,
    TextTheme textTheme,
    VoidCallback onTap,
  ) {
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(AppSpacing.radius12),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: AppSpacing.space8),
              Text(
                label,
                style: textTheme.labelMedium?.copyWith(color: color),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productItem(
    String name,
    String price,
    String stock,
    bool inStock,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () => context.push(RoutePaths.boutiqueProductEdit.replaceFirst(':id', '1')),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space12),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSpacing.radius8),
                ),
                child: Icon(
                  Icons.image_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: textTheme.titleSmall),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: inStock
                                ? colorScheme.primary
                                : colorScheme.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          stock,
                          style: textTheme.bodySmall?.copyWith(
                            color: inStock
                                ? colorScheme.onSurfaceVariant
                                : colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {},
            ),
          ],
        ),
      ),
      ),
    );
  }

  Widget _perfRow(
    String label,
    String value,
    String change,
    bool isPositive,
    TextTheme textTheme,
    ColorScheme colorScheme,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        Text(
          value,
          style: textTheme.titleSmall,
        ),
        const SizedBox(width: AppSpacing.space8),
        Container(
            padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space8,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: isPositive
                ? colorScheme.primary.withValues(alpha: 0.1)
                : colorScheme.error.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          ),
          child: Text(
            change,
            style: textTheme.labelSmall?.copyWith(
              color: isPositive
                  ? colorScheme.primary
                  : colorScheme.error,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
