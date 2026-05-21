import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';
import '../widgets/product_image_gallery.dart';
import '../widgets/seller_info_card.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      ProductImageGallery(imageUrls: const []),
                      Positioned(
                        top: AppSpacing.space16,
                        left: AppSpacing.space16,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface.withValues(alpha: 0.9),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_rounded),
                            onPressed: () => context.pop(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: AppSpacing.space16,
                        right: AppSpacing.space16,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface.withValues(alpha: 0.9),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite_outline_rounded,
                              color: colorScheme.error,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.space16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chemise traditionnelle',
                          style: textTheme.headlineMedium,
                        ),
                        const SizedBox(height: AppSpacing.space8),
                        Text(
                          '15 000 FCFA',
                          style: textTheme.headlineMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.space16),
                        Row(
                          children: [
                            Icon(Icons.star_rounded, color: colorScheme.secondary),
                            const SizedBox(width: 4),
                            Text('4.8', style: textTheme.titleSmall),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () => context.push(
                                RoutePaths.reviews.replaceAll(':id', productId),
                              ),
                              child: Text(
                                '(23 avis)',
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '43 vendus',
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.space24),
                        GestureDetector(
                          onTap: () => context.push(
                            RoutePaths.sellerProfile.replaceAll(':id', 'seller_1'),
                          ),
                          child: SellerInfoCard(
                            name: 'Adélaïde Styles',
                            rating: 4.8,
                            productCount: 156,
                            responseTime: 'Quelques heures',
                            isVerified: true,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.space24),
                        Text(AppLocalizations.of(context).product_description, style: textTheme.titleMedium),
                        const SizedBox(height: AppSpacing.space8),
                        Text(
                          'Chemise traditionnelle gabonaise en pagne wax, fabriquée artisanalement. Taille unique, coupe moderne. Idéale pour les cérémonies et le quotidien.\n\n\u2022 100% coton\n\u2022 Lavage en machine 30\u00b0C\n\u2022 Livraison sous 2h',
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.space16),
                        SizedBox(
                          width: double.infinity,
                          height: AppSpacing.touchCompact,
                          child: OutlinedButton.icon(
                            onPressed: () => context.push(
                              RoutePaths.negotiate.replaceAll(':id', productId),
                            ),
                            icon: const Icon(Icons.monetization_on_rounded),
                            label: Text(AppLocalizations.of(context).product_negotiate),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.space32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.space16,
                AppSpacing.space12,
                AppSpacing.space16,
                AppSpacing.space12,
              ),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                border: Border(
                  top: BorderSide(color: colorScheme.outlineVariant),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: AppSpacing.touchMin,
                      child: OutlinedButton.icon(
                        onPressed: () => context.push(
                          RoutePaths.negotiate.replaceAll(':id', productId),
                        ),
                        icon: const Icon(Icons.chat_bubble_outline_rounded),
                        label: const Text('Contacter'),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: AppSpacing.touchMin,
                      child: ElevatedButton.icon(
                        onPressed: () => context.push(RoutePaths.cart),
                        icon: const Icon(Icons.shopping_cart_rounded),
                        label: Text(AppLocalizations.of(context).product_add_to_cart),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
