import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  static const _categories = [
    ('Mode', Icons.checkroom_rounded),
    ('Alimentation', Icons.restaurant_rounded),
    ('Tech', Icons.devices_rounded),
    ('Maison', Icons.chair_rounded),
    ('Services', Icons.handyman_rounded),
    ('Santé', Icons.favorite_rounded),
    ('Sports', Icons.fitness_center_rounded),
    ('Auto', Icons.directions_car_rounded),
  ];

  static const _featuredProducts = [
    ('1', 'Chemise traditionnelle', '15 000 FCFA', 'Adélaïde Styles', 4.8, 23),
    ('2', 'Poulet braisé', '5 500 FCFA', 'Maman Binta', 4.9, 156),
    ('3', 'Smartphone reconditionné', '85 000 FCFA', 'Tech Gabon', 4.5, 42),
    ('4', 'Meuble salon', '250 000 FCFA', 'Bois & Design', 4.7, 18),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Okiba'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded),
            onPressed: () => context.push(RoutePaths.favorites),
          ),
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () => context.push(RoutePaths.search),
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_rounded),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDC2626),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: AppSpacing.space16),
          children: [
            // Catégories
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16,
                ),
                children: _categories.map((c) {
                  return Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.space8),
                    child: CategoryChip(
                      icon: c.$2,
                      label: c.$1,
                      onTap: () => context.push(RoutePaths.categories),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: AppSpacing.space24),
            // Section Vedette
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.space16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'En vedette',
                    style: textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () => context.push(RoutePaths.search),
                    child: Text(AppLocalizations.of(context).general_see_all),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space12),
            SizedBox(
              height: 290,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16,
                ),
                itemCount: _featuredProducts.length,
                separatorBuilder: (_, _) => const SizedBox(
                  width: AppSpacing.space12,
                ),
                itemBuilder: (_, i) {
                  final p = _featuredProducts[i];
                  return SizedBox(
                    width: 180,
                    child: ProductCard(
                      id: p.$1,
                      title: p.$2,
                      price: p.$3,
                      sellerName: p.$4,
                      rating: p.$5,
                      reviewCount: p.$6,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.space24),
            // Section À proximité
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.space16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'À proximité',
                    style: textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context).general_see_all),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.space12),
            ...List.generate(_featuredProducts.length, (i) {
              final p = _featuredProducts[i];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.space16,
                  vertical: AppSpacing.space4,
                ),
                child: ProductCard(
                  id: p.$1,
                  title: p.$2,
                  price: p.$3,
                  sellerName: p.$4,
                  rating: p.$5,
                  reviewCount: p.$6,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
