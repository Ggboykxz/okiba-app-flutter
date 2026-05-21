import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const _categories = [
    _CategoryData(Icons.checkroom_rounded, 'Mode', 'Vêtements, chaussures, accessoires'),
    _CategoryData(Icons.restaurant_rounded, 'Alimentation', 'Produits frais, plats, épicerie'),
    _CategoryData(Icons.devices_rounded, 'Tech', 'Smartphones, ordinateurs, gadgets'),
    _CategoryData(Icons.chair_rounded, 'Maison', 'Meubles, déco, électroménager'),
    _CategoryData(Icons.handyman_rounded, 'Services', 'Coiffure, mécanique, cours'),
    _CategoryData(Icons.favorite_rounded, 'Santé', 'Pharmacie, soins, bien-être'),
    _CategoryData(Icons.fitness_center_rounded, 'Sports', 'Équipement, vêtements de sport'),
    _CategoryData(Icons.directions_car_rounded, 'Auto', 'Pièces, entretien, accessoires'),
    _CategoryData(Icons.music_note_rounded, 'Culture', 'Instruments, livres, art'),
    _CategoryData(Icons.pets_rounded, 'Animaux', 'Alimentation, accessoires, soins'),
    _CategoryData(Icons.child_care_rounded, 'Enfants', 'Jouets, vêtements, puériculture'),
    _CategoryData(Icons.flight_rounded, 'Voyages', 'Bagages, accessoires de voyage'),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text(AppLocalizations.of(context).category_title)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppSpacing.space12,
              mainAxisSpacing: AppSpacing.space12,
              childAspectRatio: 0.85,
            ),
            itemCount: _categories.length,
            itemBuilder: (_, i) {
              final c = _categories[i];
              return Material(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(AppSpacing.radius12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(AppSpacing.radius12),
                    onTap: () => context.push(
                      RoutePaths.categoryProducts.replaceAll(':id', i.toString()),
                      extra: c,
                    ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                      border: Border.all(color: colorScheme.outlineVariant),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(AppSpacing.radius12),
                          ),
                          child: Icon(c.icon, color: colorScheme.onPrimaryContainer),
                        ),
                        const SizedBox(height: AppSpacing.space8),
                        Text(
                          c.name,
                          style: textTheme.labelLarge,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryData {
  final IconData icon;
  final String name;
  final String description;
  const _CategoryData(this.icon, this.name, this.description);
}
