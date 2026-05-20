import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class RapidProductDetailScreen extends StatelessWidget {
  final String productId;
  const RapidProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.sellerRapidProductDetailTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Image principale
          Container(
            height: 280,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
            ),
            child: Center(
              child: Icon(Icons.image_rounded, size: 64, color: colorScheme.onSurfaceVariant),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Prix et temps
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('250 000 FCFA',
                      style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: colorScheme.primary)),
                    const SizedBox(height: 4),
                    Text('Publié il y a 2h • Libreville',
                      style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(l10n.sellerRapidProductDetailFeatured, style: textTheme.labelSmall?.copyWith(color: colorScheme.onPrimaryContainer)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space16),
          // Titre
          Text('iPhone 13 reconditionné — État neuf',
            style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          // Description
          Text(
            'iPhone 13 bleu 128 Go reconditionné par un professionnel. Batterie 92%. '
            'Livré avec chargeur et coque de protection. Garantie 6 mois.',
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Vendeur
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: colorScheme.primaryContainer,
                child: Icon(Icons.person_rounded, color: colorScheme.onPrimaryContainer),
              ),
              title: const Text('Jean Mba'),
              subtitle: Text(l10n.sellerRapidProductDetailMemberSince('mars 2025')),
              trailing: Icon(Icons.verified_rounded, color: colorScheme.primary),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Stats
          Row(
            children: [
              _statChip('45 ${l10n.sellerRapidProductDetailViews}', Icons.visibility_rounded, colorScheme, textTheme),
              const SizedBox(width: AppSpacing.space8),
              _statChip('12 ${l10n.sellerRapidProductDetailFavs}', Icons.favorite_rounded, colorScheme, textTheme),
              const SizedBox(width: AppSpacing.space8),
              _statChip('3 ${l10n.sellerRapidProductDetailMessagesCount}', Icons.chat_rounded, colorScheme, textTheme),
            ],
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.chat_rounded),
                  label: Text(l10n.sellerRapidProductDetailContact),
                  onPressed: () => context.push(RoutePaths.rapidMessages),
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: FilledButton.icon(
                  icon: const Icon(Icons.phone_rounded),
                  label: Text(l10n.productCall),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statChip(String label, IconData icon, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space8, vertical: AppSpacing.space4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(label, style: textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
