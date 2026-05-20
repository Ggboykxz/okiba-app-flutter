import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  String? _reason;
  bool _confirmed = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    final reasons = [
      l10n.profile_delete_account_not_using,
      l10n.profile_delete_account_too_many_notif,
      l10n.profile_delete_account_delivery_issues,
      l10n.profile_delete_account_payment_issues,
      l10n.profile_delete_account_new_account,
      l10n.profile_delete_account_other,
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_delete_account_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Card(
            color: colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning_rounded, color: colorScheme.onErrorContainer),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.profile_delete_account_warning, style: textTheme.titleSmall?.copyWith(color: colorScheme.onErrorContainer, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Text('Cette action est irréversible. Toutes vos données seront supprimées après 30 jours.',
                          style: textTheme.bodySmall?.copyWith(color: colorScheme.onErrorContainer)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_delete_account_why, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          ...reasons.map((r) => ListTile(
            leading: Icon(
              _reason == r ? Icons.radio_button_checked_rounded : Icons.radio_button_unchecked_rounded,
              color: _reason == r ? Theme.of(context).colorScheme.primary : null,
            ),
            title: Text(r, style: textTheme.bodyMedium),
            onTap: () => setState(() => _reason = r),
            contentPadding: EdgeInsets.zero,
            dense: true,
          )),
          const SizedBox(height: AppSpacing.space16),
          CheckboxListTile(
            title: Text(l10n.profile_delete_account_understand,
              style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500)),
            value: _confirmed,
            onChanged: (v) => setState(() => _confirmed = v ?? false),
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: AppSpacing.space24),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: FilledButton(
              style: FilledButton.styleFrom(backgroundColor: colorScheme.error),
              onPressed: (_reason != null && _confirmed) ? () => _confirmDelete(context) : null,
              child: Text(l10n.profile_delete_account_button),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.profile_delete_account_last_step),
        content: const Text('Votre compte sera définitivement supprimé après 30 jours. D\'ici là, vous pouvez vous reconnecter pour annuler.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l10n.general_cancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(ctx).colorScheme.error),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
              context.go(RoutePaths.welcome);
            },
            child: Text(l10n.profile_delete_account_confirm),
          ),
        ],
      ),
    );
  }
}
