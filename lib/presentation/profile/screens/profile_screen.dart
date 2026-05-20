import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space20),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: colorScheme.primaryContainer,
                        child: Icon(
                          Icons.person_rounded,
                          size: 40,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.surface,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 14,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: AppSpacing.space16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alice Mbazoghe',
                          style: textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '+241 62 00 00 01',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 16,
                              color: colorScheme.secondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(23 avis)',
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
                    icon: const Icon(Icons.edit_rounded),
                    onPressed: () => context.push(RoutePaths.editProfile),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.shopping_bag_rounded,
                color: colorScheme.primary,
              ),
              title: Text(
                l10n.profile_role_client,
                style: textTheme.titleSmall,
              ),
              subtitle: Text(
                'Vous êtes connecté en tant que client',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {},
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_settings, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _menuItem(
            Icons.notifications_rounded,
            l10n.profile_notifications,
            null,
            () => context.push(RoutePaths.notificationSettings),
            colorScheme,
            textTheme,
          ),
          _menuItem(
            Icons.language_rounded,
            l10n.profile_language,
            l10n.settings_language_fr,
            () => context.push(RoutePaths.language),
            colorScheme,
            textTheme,
          ),
          _menuItem(
            Icons.battery_saver_rounded,
            l10n.profile_low_data_mode,
            'Économiser les données',
            () => context.push(RoutePaths.lowDataMode),
            colorScheme,
            textTheme,
          ),
          _menuItem(
            Icons.lock_rounded,
            l10n.profile_privacy_security,
            null,
            () => context.push(RoutePaths.privacySecurity),
            colorScheme,
            textTheme,
          ),
          _menuItem(
            Icons.payment_rounded,
            l10n.profile_payment,
            null,
            () => context.push(RoutePaths.paymentMethods),
            colorScheme,
            textTheme,
          ),
          _menuItem(
            Icons.location_on_rounded,
            l10n.profile_addresses,
            null,
            () => context.push(RoutePaths.addressBook),
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_social, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _menuItem(
            Icons.card_giftcard_rounded,
            l10n.profile_referral,
            'Gagnez 2 500 FCFA par ami',
            () => context.push(RoutePaths.referral),
            colorScheme,
            textTheme,
          ),
          _menuItem(
            Icons.notifications_active_rounded,
            'Centre de notifications',
            null,
            () => context.push(RoutePaths.notifications),
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_support, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _menuItem(
            Icons.help_rounded,
            l10n.profile_help,
            null,
            () => context.push(RoutePaths.help),
            colorScheme,
            textTheme,
          ),
          _menuItem(
            Icons.info_rounded,
            l10n.profile_about,
            'Version 1.0.0',
            () => context.push(RoutePaths.about),
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_account, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _menuItem(
            Icons.delete_forever_rounded,
            l10n.profile_delete_account,
            null,
            () => context.push(RoutePaths.deleteAccount),
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: AppSpacing.space16),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: OutlinedButton.icon(
              onPressed: () => context.go(RoutePaths.welcome),
              icon: const Icon(Icons.logout_rounded),
              label: Text(l10n.profile_logout_action),
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.error,
                side: BorderSide(color: colorScheme.error),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
        ],
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title,
    String? subtitle,
    VoidCallback onTap,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return ListTile(
      leading: Icon(icon, color: colorScheme.onSurfaceVariant),
      title: Text(title, style: textTheme.titleSmall),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            )
          : null,
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
