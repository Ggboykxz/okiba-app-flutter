import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';
import 'package:go_router/go_router.dart';

class BoutiqueCatalogScreen extends StatefulWidget {
  const BoutiqueCatalogScreen({super.key});

  @override
  State<BoutiqueCatalogScreen> createState() => _BoutiqueCatalogScreenState();
}

class _BoutiqueCatalogScreenState extends State<BoutiqueCatalogScreen> {
  final _searchController = TextEditingController();
  String _filter = 'Tous';

  final _filters = ['Tous', 'Actif', 'Épuisé', 'Brouillon'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.boutique_catalog_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => context.push(RoutePaths.boutiqueProductCreate),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.space16, AppSpacing.space8, AppSpacing.space16, 0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: l10n.boutique_catalog_search,
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          // Filter chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              children: _filters.map((f) {
                final selected = f == _filter;
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.space8),
                  child: FilterChip(
                    label: Text(f),
                    selected: selected,
                    onSelected: (_) => setState(() => _filter = f),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          // Product count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('12 ${l10n.boutique_products.toLowerCase()}', style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                TextButton.icon(
                  icon: const Icon(Icons.sort_rounded, size: 18),
                  label: Text(l10n.general_sort),
                  onPressed: () => _showSortSheet(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space8),
          // Product list
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              children: [
                _productItem('Chemise wax', '15 000 FCFA', '42 en stock', true, colorScheme, textTheme, context),
                _productItem('Robe pagne', '25 000 FCFA', '18 en stock', true, colorScheme, textTheme, context),
                _productItem('Sac artisanal', '12 000 FCFA', 'Épuisé', false, colorScheme, textTheme, context),
                _productItem('Boucles oreilles', '8 000 FCFA', '35 en stock', true, colorScheme, textTheme, context),
                _productItem('Sandales cuir', '18 000 FCFA', '12 en stock', true, colorScheme, textTheme, context),
                _productItem('Pagne wax', '22 000 FCFA', 'Brouillon', true, colorScheme, textTheme, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _productItem(
    String name, String price, String stock, bool active,
    ColorScheme colorScheme, TextTheme textTheme, BuildContext context,
  ) {
    final isOut = stock == 'Épuisé' || stock == 'Brouillon';
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
                width: 56, height: 56,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSpacing.radius8),
                ),
                child: Icon(Icons.image_rounded, color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: textTheme.titleSmall),
                    const SizedBox(height: 4),
                    Text(price, style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.primary, fontWeight: FontWeight.w700,
                    )),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 8, height: 8,
                          decoration: BoxDecoration(
                            color: active ? colorScheme.primary : colorScheme.error,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(stock, style: textTheme.bodySmall?.copyWith(
                          color: active ? colorScheme.onSurfaceVariant : colorScheme.error,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(isOut ? Icons.unpublished_rounded : Icons.check_circle_rounded,
                  color: isOut ? colorScheme.error : colorScheme.primary),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSortSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Text(l10n.boutique_catalog_sort_name_az), leading: const Icon(Icons.sort_by_alpha_rounded), onTap: () => Navigator.pop(ctx)),
            ListTile(title: Text(l10n.boutique_catalog_sort_price_asc), leading: const Icon(Icons.arrow_upward_rounded), onTap: () => Navigator.pop(ctx)),
            ListTile(title: Text(l10n.boutique_catalog_sort_price_desc), leading: const Icon(Icons.arrow_downward_rounded), onTap: () => Navigator.pop(ctx)),
            ListTile(title: Text(l10n.boutique_catalog_sort_stock), leading: const Icon(Icons.inventory_rounded), onTap: () => Navigator.pop(ctx)),
            ListTile(title: Text(l10n.boutique_catalog_sort_recent), leading: const Icon(Icons.schedule_rounded), onTap: () => Navigator.pop(ctx)),
          ],
        ),
      ),
    );
  }
}
