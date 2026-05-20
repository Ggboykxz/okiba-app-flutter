import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_about_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppSpacing.radius20),
                  ),
                  child: Icon(Icons.shopping_bag_rounded, size: 48, color: colorScheme.onPrimaryContainer),
                ),
                const SizedBox(height: AppSpacing.space16),
                Text('Okiba', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text('Version 1.0.0 (build 1)', style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                const SizedBox(height: AppSpacing.space24),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(l10n.profile_about_terms),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  title: Text(l10n.profile_about_privacy),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  title: Text(l10n.profile_about_legal),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  title: Text(l10n.profile_about_licenses),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => showLicensePage(
                    context: context,
                    applicationName: 'Okiba',
                    applicationVersion: '1.0.0',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.star_rounded, color: colorScheme.secondary),
                  title: Text(l10n.profile_about_rate),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.bug_report_rounded, color: colorScheme.error),
                  title: Text(l10n.profile_about_report),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Center(
            child: Text(l10n.profile_about_made_in, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }
}
