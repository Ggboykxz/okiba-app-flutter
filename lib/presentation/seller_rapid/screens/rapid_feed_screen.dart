import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class RapidFeedScreen extends StatelessWidget {
  const RapidFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.seller_rapid_feed_title),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Barre de recherche feed
          TextField(
            decoration: InputDecoration(
              hintText: l10n.seller_rapid_feed_search,
              prefixIcon: const Icon(Icons.search_rounded),
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radius12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Filtres rapides
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _filterChip(l10n.seller_rapid_filter_all, true, colorScheme, textTheme),
                _filterChip(l10n.seller_rapid_filter_fashion, false, colorScheme, textTheme),
                _filterChip(l10n.seller_rapid_filter_tech, false, colorScheme, textTheme),
                _filterChip(l10n.seller_rapid_filter_home, false, colorScheme, textTheme),
                _filterChip(l10n.seller_rapid_filter_services, false, colorScheme, textTheme),
                _filterChip(l10n.seller_rapid_filter_food, false, colorScheme, textTheme),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Feed items
          _feedItem(
            'iPhone 13 reconditionné',
            '250 000 FCFA',
            'Libreville, Louis',
            'Il y a 2h',
            'Très bon état',
            colorScheme,
            textTheme,
          ),
          _feedItem(
            'Lit simple avec matelas',
            '85 000 FCFA',
            'Libreville, Centre',
            'Il y a 1j',
            'Bon état',
            colorScheme,
            textTheme,
          ),
          _feedItem(
            'Cours particuliers maths',
            '10 000 FCFA/h',
            'Libreville, Nzeng Ayong',
            'Il y a 3j',
            'Service',
            colorScheme,
            textTheme,
          ),
          _feedItem(
            'Vélo tout terrain',
            '120 000 FCFA',
            'Owendo',
            'Il y a 4j',
            'Très bon état',
            colorScheme,
            textTheme,
          ),
          _feedItem(
            'Canapé 3 places',
            '200 000 FCFA',
            'Libreville, Batterie IV',
            'Il y a 5j',
            'Bon état',
            colorScheme,
            textTheme,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RoutePaths.rapidPublish),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Widget _filterChip(
    String label,
    bool active,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.space8),
      child: Material(
        color: active ? colorScheme.primary : colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space16,
              vertical: AppSpacing.space8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              border: Border.all(
                color: active ? colorScheme.primary : colorScheme.outline,
              ),
            ),
            child: Text(
              label,
              style: textTheme.labelLarge?.copyWith(
                color: active
                    ? colorScheme.onPrimary
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _feedItem(
    String title,
    String price,
    String location,
    String time,
    String condition,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space12),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.space4),
                    Text(
                      price,
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            location,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: 14,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.space8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusFull),
                          ),
                          child: Text(
                            condition,
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
