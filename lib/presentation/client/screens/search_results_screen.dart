import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../widgets/category_chip.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/product_card.dart';

class SearchResultsScreen extends StatefulWidget {
  final String query;

  const SearchResultsScreen({super.key, required this.query});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  int _viewMode = 0;
  int _selectedCategory = -1;

  static const _categories = [
    ('Tout', Icons.explore_rounded),
    ('Mode', Icons.checkroom_rounded),
    ('Alimentation', Icons.restaurant_rounded),
    ('Tech', Icons.devices_rounded),
    ('Maison', Icons.chair_rounded),
    ('Services', Icons.handyman_rounded),
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Résultats', style: textTheme.titleMedium),
            Text(
              '"${widget.query}"',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(_viewMode == 0 ? Icons.grid_view_rounded : Icons.view_list_rounded),
            onPressed: () => setState(() => _viewMode = _viewMode == 0 ? 1 : 0),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filters row
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
                children: [
                  ...List.generate(_categories.length, (i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.space8),
                      child: CategoryChip(
                        icon: _categories[i].$2,
                        label: _categories[i].$1,
                        isSelected: _selectedCategory == i,
                        onTap: () => setState(() => _selectedCategory = i),
                      ),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.space8),
                    child: CategoryChip(
                      icon: Icons.tune_rounded,
                      label: AppLocalizations.of(context)!.general_filters,
                      onTap: () => FilterBottomSheet.show(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space16),
            // Results count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              child: Row(
                children: [
                  Text(
                    '12 résultats',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Trier par : Pertinence',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  Icon(Icons.expand_more_rounded, color: colorScheme.primary, size: 18),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space12),
            // Products
            Expanded(
              child: _viewMode == 0
                  ? GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: AppSpacing.space12,
                        mainAxisSpacing: AppSpacing.space12,
                      ),
                      itemCount: 12,
                      itemBuilder: (_, i) {
                        return ProductCard(
                          id: 'r$i',
                          title: 'Produit ${i + 1}',
                          price: '${(i + 1) * 5000} FCFA',
                          sellerName: 'Vendeur ${i + 1}',
                          rating: 4.5,
                          reviewCount: 12,
                        );
                      },
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
                      itemCount: 12,
                      itemBuilder: (_, i) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.space12),
                          child: ProductCard(
                            id: 'r$i',
                            title: 'Produit ${i + 1}',
                            price: '${(i + 1) * 5000} FCFA',
                            sellerName: 'Vendeur ${i + 1}',
                            rating: 4.5,
                            reviewCount: 12,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
