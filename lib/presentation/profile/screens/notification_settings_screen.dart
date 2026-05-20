import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool _pushOrders = true;
  bool _pushPromos = true;
  bool _pushChat = true;
  bool _pushDelivery = true;
  bool _emailOrders = false;
  bool _emailPromos = true;
  bool _emailWeekly = false;
  bool _smsDelivery = true;
  bool _smsOtp = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_notification_settings_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Text(l10n.profile_notif_push, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _toggle(l10n.profile_notif_orders, 'Alertes de confirmation et statut', _pushOrders, (v) => setState(() => _pushOrders = v), colorScheme, textTheme),
          _toggle(l10n.profile_notif_promotions, 'Offres et réductions', _pushPromos, (v) => setState(() => _pushPromos = v), colorScheme, textTheme),
          _toggle(l10n.profile_notif_chat, 'Nouveaux messages', _pushChat, (v) => setState(() => _pushChat = v), colorScheme, textTheme),
          _toggle(l10n.profile_notif_delivery, 'Mise à jour livraison', _pushDelivery, (v) => setState(() => _pushDelivery = v), colorScheme, textTheme),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_notif_email, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _toggle('Confirmation commandes', 'Reçu par email', _emailOrders, (v) => setState(() => _emailOrders = v), colorScheme, textTheme),
          _toggle(l10n.profile_notif_promotions, 'Offres et réductions', _emailPromos, (v) => setState(() => _emailPromos = v), colorScheme, textTheme),
          _toggle('Newsletter hebdo', 'Résumé de la semaine', _emailWeekly, (v) => setState(() => _emailWeekly = v), colorScheme, textTheme),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_notif_sms, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _toggle(l10n.profile_notif_delivery, 'Notifications de livraison', _smsDelivery, (v) => setState(() => _smsDelivery = v), colorScheme, textTheme),
          _toggle(l10n.profile_notif_sms_otp, 'Codes de vérification', _smsOtp, (v) => setState(() => _smsOtp = v), colorScheme, textTheme),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _toggle(String title, String subtitle, bool value, ValueChanged<bool> onChanged, ColorScheme colorScheme, TextTheme textTheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space4),
      child: SwitchListTile(
        title: Text(title, style: textTheme.titleSmall),
        subtitle: Text(subtitle, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
