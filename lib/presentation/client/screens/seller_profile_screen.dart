import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../widgets/product_card.dart';

class SellerProfileScreen extends StatelessWidget {
  final String sellerId;

  const SellerProfileScreen({super.key, required this.sellerId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: colorScheme.primaryContainer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CircleAvatar(
                        radius: 44,
                        backgroundImage: null,
                        child: Icon(Icons.store_rounded, size: 44),
                      ),
                      const SizedBox(height: AppSpacing.space12),
                      Text(
                        'Adélaïde Styles',
                        style: textTheme.headlineMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.space4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.verified_rounded, size: 16, color: colorScheme.primary),
                          const SizedBox(width: 4),
                          Text(
                            'Vendeur vérifié',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.space16),
                    ],
                  ),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => context.pop(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Stats row
                    Row(
                      children: [
                        _StatCard(AppLocalizations.of(context)!.seller_profile_products, '156', colorScheme, textTheme),
                        const SizedBox(width: AppSpacing.space12),
                        _StatCard('Ventes', '892', colorScheme, textTheme),
                        const SizedBox(width: AppSpacing.space12),
                        _StatCard('Note', '4.8', colorScheme, textTheme),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.space24),
                    Text(
                      'À propos',
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    Text(
                      'Créatrice de mode gabonaise passionnée depuis 2018. '
                      'Je confectionne des vêtements traditionnels modernes '
                      'avec des tissus wax de qualité.',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space24),
                    // Info
                    _InfoRow(Icons.location_on_rounded, 'Libreville, Gabon', colorScheme, textTheme),
                    const SizedBox(height: AppSpacing.space8),
                    _InfoRow(Icons.access_time_rounded, 'Réponse en quelques heures', colorScheme, textTheme),
                    const SizedBox(height: AppSpacing.space8),
                    _InfoRow(Icons.calendar_today_rounded, 'Membre depuis 2022', colorScheme, textTheme),
                    const SizedBox(height: AppSpacing.space24),
                    // Products
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Produits', style: textTheme.titleMedium),
                        TextButton(
                          onPressed: () {},
                          child: Text(AppLocalizations.of(context)!.general_see_all),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: AppSpacing.space12,
                  mainAxisSpacing: AppSpacing.space12,
                ),
                delegate: SliverChildBuilderDelegate(
                  (_, i) => ProductCard(
                    id: 's_$i',
                    title: 'Produit ${i + 1}',
                    price: '${(i + 1) * 5000} FCFA',
                    sellerName: 'Adélaïde Styles',
                    rating: 4.8,
                    reviewCount: 23,
                  ),
                  childCount: 6,
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: AppSpacing.space32)),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _StatCard(this.label, this.value, this.colorScheme, this.textTheme);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space12),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              label,
              style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const _InfoRow(this.icon, this.text, this.colorScheme, this.textTheme);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: colorScheme.onSurfaceVariant),
        const SizedBox(width: AppSpacing.space8),
        Text(text, style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        )),
      ],
    );
  }
}
