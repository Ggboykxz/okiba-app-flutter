import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class LowDataModeScreen extends StatelessWidget {
  const LowDataModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.profile_low_data_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.space20),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.battery_saver_rounded,
                  size: 40,
                  color: colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: AppSpacing.space16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.profile_low_data_desc,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Réduisez la consommation de données\nmobiles et améliorez la vitesse.',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onPrimaryContainer
                              .withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: Text(
                    l10n.profile_low_data_title,
                    style: textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    l10n.profile_low_data_enable,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  value: true,
                  activeThumbColor: colorScheme.primary,
                  onChanged: (_) {},
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                SwitchListTile(
                  title: Text(
                    l10n.profile_low_data_low_res,
                    style: textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    'Afficher les images en qualité réduite',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  value: false,
                  activeThumbColor: colorScheme.primary,
                  onChanged: (_) {},
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                SwitchListTile(
                  title: Text(
                    l10n.profile_low_data_no_auto_video,
                    style: textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    'Ne pas lancer les vidéos automatiquement',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  value: true,
                  activeThumbColor: colorScheme.primary,
                  onChanged: (_) {},
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                SwitchListTile(
                  title: Text(
                    'Mode hors-ligne',
                    style: textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    l10n.profile_low_data_offline,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  value: false,
                  activeThumbColor: colorScheme.primary,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.profile_low_data_saved,
                        style: textTheme.titleSmall,
                      ),
                      Text(
                        '~ 45 Mo',
                        style: textTheme.titleSmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                    child: LinearProgressIndicator(
                      value: 0.45,
                      backgroundColor: colorScheme.surfaceContainerHighest,
                      color: colorScheme.primary,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space8),
                  Text(
                    '45% de données économisées cette semaine',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
