import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool _biometric = false;
  bool _twoFactor = false;
  bool _shareData = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_privacy_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Text(l10n.profile_privacy_security, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.lock_rounded, color: colorScheme.primary),
                  title: Text(l10n.profile_privacy_password),
                  subtitle: const Text('Dernière modification il y a 3 mois'),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => _showChangePasswordSheet(context),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: Icon(Icons.fingerprint_rounded, color: colorScheme.primary),
                  title: Text(l10n.profile_privacy_fingerprint),
                  subtitle: const Text('Déverrouiller avec votre empreinte'),
                  value: _biometric,
                  onChanged: (v) => setState(() => _biometric = v),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: Icon(Icons.verified_user_rounded, color: colorScheme.primary),
                  title: Text(l10n.profile_privacy_2fa),
                  subtitle: const Text('Code supplémentaire à la connexion'),
                  value: _twoFactor,
                  onChanged: (v) => setState(() => _twoFactor = v),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_privacy_privacy, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: Icon(Icons.share_rounded, color: colorScheme.primary),
                  title: Text(l10n.profile_privacy_share_data),
                  subtitle: const Text('Améliorer votre expérience'),
                  value: _shareData,
                  onChanged: (v) => setState(() => _shareData = v),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.description_rounded, color: colorScheme.primary),
                  title: Text(l10n.profile_privacy_policy),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.file_download_rounded, color: colorScheme.primary),
                  title: Text(l10n.profile_privacy_download_data),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_privacy_devices, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone_android_rounded, color: colorScheme.primary),
                  title: const Text('iPhone 15 Pro'),
                  subtitle: const Text('Libreville, GA • Actif'),
                  trailing: Icon(Icons.check_circle_rounded, color: Colors.green),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.laptop_rounded, color: colorScheme.onSurfaceVariant),
                  title: const Text('Chrome — Windows'),
                  subtitle: const Text('Dernière connexion il y a 2j'),
                  trailing: IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  void _showChangePasswordSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentCtrl = TextEditingController();
    final newCtrl = TextEditingController();
    final confirmCtrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.space16, AppSpacing.space16, AppSpacing.space16,
          MediaQuery.of(ctx).viewInsets.bottom + AppSpacing.space16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.profile_privacy_change_password, style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: AppSpacing.space16),
            TextField(controller: currentCtrl, decoration: InputDecoration(labelText: l10n.profile_privacy_current_password), obscureText: true),
            const SizedBox(height: AppSpacing.space12),
            TextField(controller: newCtrl, decoration: InputDecoration(labelText: l10n.profile_privacy_new_password), obscureText: true),
            const SizedBox(height: AppSpacing.space12),
            TextField(controller: confirmCtrl, decoration: InputDecoration(labelText: l10n.profile_privacy_confirm_password), obscureText: true),
            const SizedBox(height: AppSpacing.space24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () { Navigator.pop(ctx); },
                child: Text(l10n.profile_privacy_update_password),
              ),
            ),
            const SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }
}
