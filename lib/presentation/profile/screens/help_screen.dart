import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_colors.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.help_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
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
                  l10n.help_need_help,
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.space8),
                Text(
                  l10n.help_team_here,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onPrimary.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: AppSpacing.space16),
                SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_rounded),
                    label: Text(l10n.help_contact),
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
          Text(l10n.help_faq, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space8),
          _faqItem(
            'Comment passer une commande ?',
            'Sélectionnez un produit, ajoutez-le au panier, puis suivez les étapes de paiement.',
            colorScheme,
            textTheme,
          ),
          _faqItem(
            'Quels sont les moyens de paiement ?',
            'Nous acceptons Orange Money, MTN MoMo, Airtel Money, carte bancaire et espèces à la livraison.',
            colorScheme,
            textTheme,
          ),
          _faqItem(
            'Comment fonctionne la livraison ?',
            'La livraison est effectuée par nos livreurs partenaires. Suivez votre commande en temps réel.',
            colorScheme,
            textTheme,
          ),
          _faqItem(
            'Puis-je retourner un produit ?',
            'Oui, sous 14 jours. Contactez le vendeur directement via le chat.',
            colorScheme,
            textTheme,
          ),
          _faqItem(
            'Comment devenir vendeur ?',
            'Allez dans votre profil, sélectionnez "Devenir vendeur" et suivez les étapes.',
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: AppSpacing.space24),
          Text('Nous contacter', style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Row(
            children: [
              Expanded(
                child: _contactButton(
                  Icons.email_rounded,
                  l10n.help_contact_email,
                  colorScheme.primary,
                  colorScheme,
                  textTheme,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _contactButton(
                  Icons.chat_rounded,
                  l10n.help_contact_whatsapp,
                  AppColors.whatsapp,
                  colorScheme,
                  textTheme,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _contactButton(
                  Icons.phone_rounded,
                  l10n.help_contact_call,
                  colorScheme.secondary,
                  colorScheme,
                  textTheme,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space32),
          Center(
            child: Text(
              'Okiba v1.0.0',
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space8),
        ],
      ),
    );
  }

  Widget _faqItem(
    String question,
    String answer,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: ExpansionTile(
        title: Text(question, style: textTheme.titleSmall),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.space16,
              0,
              AppSpacing.space16,
              AppSpacing.space16,
            ),
            child: Text(
              answer,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contactButton(
    IconData icon,
    String label,
    Color color,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(AppSpacing.radius12),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: AppSpacing.space8),
              Text(
                label,
                style: textTheme.labelMedium?.copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
