import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../widgets/category_chip.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: SizedBox(
          height: 44,
          child: TextField(
            controller: _searchController,
            autofocus: true,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.search_hint,
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest,
              prefixIcon: const Icon(Icons.search_rounded, size: 20),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close_rounded, size: 20),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radius12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppSpacing.space12,
              ),
            ),
            onChanged: (_) => setState(() {}),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.space16,
              ),
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
          Expanded(
            child: GridView.builder(
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
                  id: '$i',
                  title: 'Produit exemple $i',
                  price: '${(i + 1) * 5000} FCFA',
                  sellerName: 'Vendeur ${i + 1}',
                  rating: 4.5,
                  reviewCount: 12,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
