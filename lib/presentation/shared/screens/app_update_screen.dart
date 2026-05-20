import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class AppUpdateScreen extends StatelessWidget {
  const AppUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.app_update_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space32),
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 100, height: 100,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppSpacing.radius20),
                  ),
                  child: Icon(Icons.system_update_rounded, size: 56, color: colorScheme.onPrimaryContainer),
                ),
                const SizedBox(height: AppSpacing.space24),
                Text('Version 2.0.0 disponible', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: AppSpacing.space8),
                Text('Vous utilisez actuellement la version 1.0.0',
                  style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                const SizedBox(height: AppSpacing.space32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.download_rounded),
                    label: Text(l10n.app_update_button),
                    onPressed: () {},
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.app_update_later),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
          Text('Nouveautés de la version 2.0.0', style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _changelogItem('Nouveau design de la boutique vendeur', colorScheme, textTheme),
          _changelogItem('Mode vente rapide : publiez en 2 minutes', colorScheme, textTheme),
          _changelogItem('Suivi de livraison en temps réel sur la carte', colorScheme, textTheme),
          _changelogItem('Paiement par Airtel Money maintenant disponible', colorScheme, textTheme),
          _changelogItem('Amélioration des performances et corrections de bugs', colorScheme, textTheme),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _changelogItem(String text, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.space12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_rounded, size: 20, color: colorScheme.primary),
          const SizedBox(width: AppSpacing.space12),
          Expanded(child: Text(text, style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant))),
        ],
      ),
    );
  }
}
