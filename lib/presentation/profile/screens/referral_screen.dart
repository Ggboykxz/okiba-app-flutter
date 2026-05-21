import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_referral_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Card(
            color: colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space24),
              child: Column(
                children: [
                  Icon(Icons.card_giftcard_rounded, size: 48, color: colorScheme.onPrimary),
                  const SizedBox(height: AppSpacing.space16),
                  Text(l10n.profile_referral_subtitle, style: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary)),
                  const SizedBox(height: AppSpacing.space8),
                  Text('Vous gagnez 2 500 FCFA par ami parrainé',
                    style: textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary.withValues(alpha: 0.8))),
                  const SizedBox(height: AppSpacing.space24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.space16),
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                    ),
                    child: Column(
                      children: [
                        Text(l10n.profile_referral_code, style: textTheme.labelSmall?.copyWith(color: colorScheme.onPrimary.withValues(alpha: 0.7))),
                        const SizedBox(height: AppSpacing.space4),
                        Text('OKIBA-ALICE', style: textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onPrimary, fontWeight: FontWeight.w700, letterSpacing: 2)),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.share_rounded),
                      label: Text(l10n.profile_referral_share),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.onPrimary,
                        foregroundColor: colorScheme.primary,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Row(
            children: [
              Expanded(child: _statCard('5', l10n.profile_referral_friends, Icons.people_rounded, colorScheme.primary, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statCard('12 500', 'FCFA gagnés', Icons.monetization_on_rounded, Colors.green, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statCard('2', l10n.profile_referral_pending, Icons.hourglass_bottom_rounded, Colors.orange, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_referral_how_it_works, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _step('1', l10n.profile_referral_step1_title, 'Envoyez votre code de parrainage à vos amis', colorScheme, textTheme),
          _step('2', l10n.profile_referral_step2_title, 'Votre ami utilise votre code lors de l\'inscription', colorScheme, textTheme),
          _step('3', l10n.profile_referral_step3_title, 'Après sa première commande, vous recevez 2 500 FCFA', colorScheme, textTheme),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_referral_history, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _referral('Alice M.', l10n.profile_referral_registered, '2 500 FCFA', '12 mai 2026', colorScheme, textTheme),
          _referral('Paul D.', l10n.profile_referral_registered, '2 500 FCFA', '8 mai 2026', colorScheme, textTheme),
          _referral('Marie K.', l10n.profile_referral_pending, '—', '15 mai 2026', colorScheme, textTheme, pending: true),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label, IconData icon, Color color, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: AppSpacing.space8),
          Text(value, style: textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.w700)),
          Text(label, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _step(String num, String title, String desc, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.space16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Center(child: Text(num, style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.w700))),
          ),
          const SizedBox(width: AppSpacing.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                Text(desc, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _referral(String name, String status, String reward, String date, ColorScheme colorScheme, TextTheme textTheme, {bool pending = false}) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          child: Text(name[0], style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimaryContainer)),
        ),
        title: Text(name, style: textTheme.titleSmall),
        subtitle: Text(date, style: textTheme.bodySmall),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(reward, style: textTheme.titleSmall?.copyWith(
              color: pending ? Colors.orange : Colors.green, fontWeight: FontWeight.w600)),
            Text(status, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
