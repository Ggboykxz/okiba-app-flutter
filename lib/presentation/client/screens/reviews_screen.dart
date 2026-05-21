import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class ReviewsScreen extends StatelessWidget {
  final String productId;

  const ReviewsScreen({super.key, required this.productId});

  static const _reviews = [
    _ReviewData('Marie K.', 5.0, 'Super qualité, livraison rapide ! Je recommande vivement.', '2026-05-15', true),
    _ReviewData('Jean-Paul O.', 4.0, 'Très beau produit, conforme à la description. Juste un peu long.', '2026-05-12', true),
    _ReviewData('Sarah M.', 5.0, 'Parfait ! Exactement ce que je cherchais.', '2026-05-10', true),
    _ReviewData('Pierre A.', 3.0, 'Produit correct mais emballage abîmé à la livraison.', '2026-05-08', false),
    _ReviewData('Grace L.', 5.0, 'Magnifique ! Ma 3ème commande chez ce vendeur.', '2026-05-05', true),
    _ReviewData('David N.', 4.0, 'Bon rapport qualité-prix. Je recommande.', '2026-05-03', true),
    _ReviewData('Ruth B.', 5.0, 'Livraison en 1h30, produit impeccable. Merci !', '2026-04-28', true),
    _ReviewData('Fabrice E.', 2.0, 'Taille trop grande, retour compliqué.', '2026-04-25', false),
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
        title: Text(AppLocalizations.of(context).reviews_title),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.space16),
          children: [
            // Rating summary
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '4.5',
                      style: textTheme.headlineLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: List.generate(5, (i) => Icon(
                        i < 4 ? Icons.star_rounded : Icons.star_half_rounded,
                        size: 20,
                        color: colorScheme.secondary,
                      )),
                    ),
                    Text(
                      '23 avis',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: AppSpacing.space32),
                Expanded(
                  child: Column(
                    children: List.generate(5, (i) {
                      final star = 5 - i;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Text('$star', style: textTheme.bodySmall),
                            const SizedBox(width: 4),
                            Icon(Icons.star_rounded, size: 14, color: colorScheme.secondary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: [0.6, 0.2, 0.1, 0.05, 0.05][i],
                                  backgroundColor: colorScheme.surfaceContainerHighest,
                                  color: colorScheme.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space24),
            const Divider(),
            // Review list
            ..._reviews.map((r) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.space12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: colorScheme.primaryContainer,
                    child: Text(
                      r.name[0],
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(r.name, style: textTheme.titleSmall),
                            if (r.verified) ...[
                              const SizedBox(width: 4),
                              Icon(Icons.verified_rounded, size: 14, color: colorScheme.primary),
                            ],
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            ...List.generate(5, (i) => Icon(
                              i < r.rating.floor() ? Icons.star_rounded : Icons.star_border_rounded,
                              size: 14,
                              color: colorScheme.secondary,
                            )),
                            const SizedBox(width: AppSpacing.space8),
                            Text(r.date, style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            )),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.space8),
                        Text(r.comment, style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          height: 1.4,
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class _ReviewData {
  final String name;
  final double rating;
  final String comment;
  final String date;
  final bool verified;
  const _ReviewData(this.name, this.rating, this.comment, this.date, this.verified);
}
