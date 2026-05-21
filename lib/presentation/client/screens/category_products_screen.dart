import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../widgets/product_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryId;

  const CategoryProductsScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(AppLocalizations.of(context).category_products_title(categoryId)),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(AppSpacing.space16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: AppSpacing.space12,
            mainAxisSpacing: AppSpacing.space12,
          ),
          itemCount: 12,
          itemBuilder: (_, i) {
            return ProductCard(
              id: '${categoryId}_$i',
              title: 'Produit exemple ${i + 1}',
              price: '${(i + 1) * 5000} FCFA',
              sellerName: 'Vendeur ${i + 1}',
              rating: 4.5,
              reviewCount: 12,
            );
          },
        ),
      ),
    );
  }
}
