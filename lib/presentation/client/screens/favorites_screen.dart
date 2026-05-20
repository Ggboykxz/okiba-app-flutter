import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.order_favorites_title),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Tout retirer'),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(AppSpacing.space16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: AppSpacing.space12,
          mainAxisSpacing: AppSpacing.space12,
        ),
        itemCount: 8,
        itemBuilder: (_, i) {
          return ProductCard(
            id: 'fav_$i',
            title: ['Chemise traditionnelle', 'Poulet braisé', 'Smartphone reconditionné', 'Meuble salon',
                    'Sac en cuir', 'Chaussures tendance', 'Montre connectée', 'Parfum'][i],
            price: ['15 000 FCFA', '5 500 FCFA', '85 000 FCFA', '250 000 FCFA',
                    '45 000 FCFA', '25 000 FCFA', '65 000 FCFA', '12 000 FCFA'][i],
            sellerName: 'Vendeur ${i + 1}',
            rating: 4.5,
            reviewCount: 12 + i,
            isFavorite: true,
          );
        },
      ),
    );
  }
}
