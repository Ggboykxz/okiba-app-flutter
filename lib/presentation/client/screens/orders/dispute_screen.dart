import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';

class DisputeScreen extends StatefulWidget {
  final String orderId;

  const DisputeScreen({super.key, required this.orderId});

  @override
  State<DisputeScreen> createState() => _DisputeScreenState();
}

class _DisputeScreenState extends State<DisputeScreen> {
  int? _selectedReason;
  final _descriptionController = TextEditingController();
  bool _submitted = false;

  static const _reasons = [
    'Produit non reçu',
    'Produit endommagé',
    'Produit non conforme',
    'Article manquant',
    'Erreur de commande',
    'Autre',
  ];

  static const _reasonIcons = [
    Icons.inventory_2_rounded,
    Icons.report_problem_rounded,
    Icons.swap_horiz_rounded,
    Icons.help_outline_rounded,
    Icons.error_outline_rounded,
    Icons.more_horiz_rounded,
  ];

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(AppLocalizations.of(context).order_dispute_title),
      ),
      body: _submitted
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: colorScheme.secondaryContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.hourglass_top_rounded, size: 40, color: colorScheme.secondary),
                    ),
                    const SizedBox(height: AppSpacing.space24),
                    Text('Litige soumis', style: textTheme.headlineMedium, textAlign: TextAlign.center),
                    const SizedBox(height: AppSpacing.space12),
                    Text(
                      'Notre équipe va examiner votre dossier sous 24h. Vous recevrez une notification dès qu\'une décision sera prise.',
                      style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.space32),
                    SizedBox(
                      width: double.infinity,
                      height: AppSpacing.touchMin,
                      child: ElevatedButton(
                        onPressed: () => context.pop(),
                        child: Text(AppLocalizations.of(context).general_close),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(AppSpacing.space16),
              children: [
                Icon(Icons.warning_amber_rounded, size: 48, color: colorScheme.error),
                const SizedBox(height: AppSpacing.space16),
                Text('Décrivez votre problème', style: textTheme.headlineMedium),
                const SizedBox(height: AppSpacing.space8),
                Text(
                  'Nous prendrons votre litige très au sérieux. Veuillez fournir un maximum de détails.',
                  style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: AppSpacing.space32),
                Text(AppLocalizations.of(context).order_dispute_reason, style: textTheme.titleSmall),
                const SizedBox(height: AppSpacing.space12),
                ...List.generate(_reasons.length, (i) {
                  final selected = _selectedReason == i;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.space8),
                    child: Material(
                      color: selected ? colorScheme.errorContainer : colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppSpacing.radius12),
                        onTap: () => setState(() => _selectedReason = i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.space16,
                            vertical: AppSpacing.space12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSpacing.radius12),
                            border: Border.all(
                              color: selected ? colorScheme.error : colorScheme.outline,
                              width: selected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(_reasonIcons[i], size: 22, color: selected ? colorScheme.error : colorScheme.onSurfaceVariant),
                              const SizedBox(width: AppSpacing.space12),
                              Expanded(
                                child: Text(_reasons[i], style: textTheme.titleSmall?.copyWith(
                                  color: selected ? colorScheme.onErrorContainer : colorScheme.onSurface,
                                )),
                              ),
                              Icon(
                                selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                                color: selected ? colorScheme.error : colorScheme.onSurfaceVariant,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: AppSpacing.space24),
                Text('Description détaillée', style: textTheme.titleSmall),
                const SizedBox(height: AppSpacing.space8),
                TextField(
                  controller: _descriptionController,
                  maxLines: 5,
                  maxLength: 500,
                  decoration: const InputDecoration(
                    hintText: 'Expliquez ce qui s\'est passé...',
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: AppSpacing.space16),
                SizedBox(
                  width: double.infinity,
                  height: AppSpacing.touchMin,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_photo_alternate_rounded),
                    label: Text(AppLocalizations.of(context).order_dispute_evidence),
                  ),
                ),
                const SizedBox(height: AppSpacing.space24),
                SizedBox(
                  width: double.infinity,
                  height: AppSpacing.touchMin,
                  child: ElevatedButton.icon(
                    onPressed: _selectedReason != null && _descriptionController.text.trim().length >= 10
                        ? () => setState(() => _submitted = true)
                        : null,
                    icon: const Icon(Icons.gavel_rounded),
                    label: Text(AppLocalizations.of(context).order_dispute_submit),
                  ),
                ),
                const SizedBox(height: AppSpacing.space16),
              ],
            ),
    );
  }
}
