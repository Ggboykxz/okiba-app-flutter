import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class RapidDashboardScreen extends StatelessWidget {
  const RapidDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.seller_rapid_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Message d'accueil
          Container(
            padding: const EdgeInsets.all(AppSpacing.space20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.primary.withValues(alpha: 0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.seller_rapid_publish,
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.space8),
                Text(
                  l10n.seller_rapid_desc,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimary.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: AppSpacing.space16),
                SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () => context.push(RoutePaths.rapidPublish),
                    icon: const Icon(Icons.add_a_photo_rounded),
                    label: Text(l10n.seller_rapid_post_ad),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.onPrimary,
                      foregroundColor: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Actions
          Row(
            children: [
              Expanded(
                child: _actionCard(l10n.seller_rapid_promotions_title, Icons.local_offer_rounded, colorScheme.secondary, colorScheme, textTheme, () => context.push(RoutePaths.rapidPromotions)),
              ),
              const SizedBox(width: AppSpacing.space8),
              Expanded(
                child: _actionCard(l10n.seller_rapid_flash_title, Icons.timer_rounded, Colors.deepOrange, colorScheme, textTheme, () => context.push(RoutePaths.rapidFlashSales)),
              ),
              const SizedBox(width: AppSpacing.space8),
              Expanded(
                child: _actionCard(l10n.seller_rapid_messages, Icons.chat_rounded, colorScheme.tertiary, colorScheme, textTheme, () => context.push(RoutePaths.rapidMessages)),
              ),
              const SizedBox(width: AppSpacing.space8),
              Expanded(
                child: _actionCard(l10n.seller_rapid_analytics_title, Icons.analytics_rounded, colorScheme.primary, colorScheme, textTheme, () => context.push(RoutePaths.rapidAnalytics)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          // Mes annonces actives
          Text(l10n.seller_rapid_active_ads, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _listingCard(
            'iPhone 13 reconditionné',
            '250 000 FCFA',
            'Il y a 2h',
            '45 vues',
            colorScheme,
            textTheme,
            context,
          ),
          _listingCard(
            'Lit simple avec matelas',
            '85 000 FCFA',
            'Il y a 1j',
            '23 vues',
            colorScheme,
            textTheme,
            context,
          ),
          _listingCard(
            'Cours particuliers maths',
            '10 000 FCFA/h',
            'Il y a 3j',
            '12 vues',
            colorScheme,
            textTheme,
            context,
          ),
          const SizedBox(height: AppSpacing.space24),
          // Feed
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: OutlinedButton.icon(
              onPressed: () => context.push(RoutePaths.rapidFeed),
              icon: const Icon(Icons.explore_rounded),
              label: Text(l10n.seller_rapid_explore_feed),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Statistiques
          Text(l10n.seller_rapid_total_views, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Row(
            children: [
              Expanded(
                child: _statBox(
                  '3',
                  l10n.seller_rapid_active_ads,
                  Icons.dashboard_rounded,
                  colorScheme.primary,
                  colorScheme,
                  textTheme,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _statBox(
                  '80',
                  l10n.seller_rapid_total_views,
                  Icons.visibility_rounded,
                  colorScheme.secondary,
                  colorScheme,
                  textTheme,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _statBox(
                  '5',
                  l10n.seller_rapid_messages,
                  Icons.chat_rounded,
                  colorScheme.tertiary,
                  colorScheme,
                  textTheme,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _listingCard(
    String title,
    String price,
    String time,
    String views,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () => context.push(RoutePaths.rapidProductDetail.replaceFirst(':id', '1')),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space12),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(AppSpacing.radius8),
                ),
                child: Icon(
                  Icons.image_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.space12),
                        Icon(
                          Icons.visibility_rounded,
                          size: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          views,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.more_vert_rounded),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionCard(
    String label, IconData icon, Color color, ColorScheme colorScheme, TextTheme textTheme, VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: AppSpacing.space4),
            Text(label, style: textTheme.labelSmall?.copyWith(color: color), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _statBox(
    String value,
    String label,
    IconData icon,
    Color color,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: AppSpacing.space8),
          Text(
            value,
            style: textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
