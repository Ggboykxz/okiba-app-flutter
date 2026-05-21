import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class NegotiateScreen extends StatefulWidget {
  final String productId;

  const NegotiateScreen({super.key, required this.productId});

  @override
  State<NegotiateScreen> createState() => _NegotiateScreenState();
}

class _NegotiateScreenState extends State<NegotiateScreen> {
  final _priceController = TextEditingController();
  int _selectedPreset = -1;

  static const _presets = [12000, 10000, 8000, 5000];

  @override
  void dispose() {
    _priceController.dispose();
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
        title: Text(AppLocalizations.of(context).product_negotiate),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product summary
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(AppSpacing.radius16),
                      ),
                      child: Icon(Icons.image_rounded, size: 48, color: colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: AppSpacing.space16),
                    Text('Chemise traditionnelle', style: textTheme.titleLarge),
                    const SizedBox(height: AppSpacing.space4),
                    Text('15 000 FCFA', style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      decoration: TextDecoration.lineThrough,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.space32),
              Text('Proposez votre prix', style: textTheme.titleMedium),
              const SizedBox(height: AppSpacing.space8),
              Text(
                'Le vendeur recevra votre offre et pourra l\'accepter, la refuser ou faire une contre-proposition.',
                style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.space24),
              // Preset buttons
              Row(
                children: _presets.asMap().entries.map((e) {
                  final i = e.key;
                  final p = e.value;
                  final selected = _selectedPreset == i;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: i > 0 ? AppSpacing.space8 : 0),
                      child: Material(
                        color: selected ? colorScheme.primaryContainer : colorScheme.surface,
                        borderRadius: BorderRadius.circular(AppSpacing.radius12),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(AppSpacing.radius12),
                          onTap: () {
                            setState(() {
                              _selectedPreset = i;
                              _priceController.text = '$p';
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: AppSpacing.space12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSpacing.radius12),
                              border: Border.all(
                                color: selected ? colorScheme.primary : colorScheme.outline,
                                width: selected ? 2 : 1,
                              ),
                            ),
                            child: Text(
                              '$p FCFA',
                              style: textTheme.labelLarge?.copyWith(
                                color: selected
                                    ? colorScheme.onPrimaryContainer
                                    : colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSpacing.space24),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).checkout_negotiate_your_price,
                  prefixIcon: const Icon(Icons.monetization_on_rounded),
                  prefixText: '${AppLocalizations.of(context).currency_fcfa} ',
                ),
                onChanged: (_) => setState(() => _selectedPreset = -1),
              ),
              const SizedBox(height: AppSpacing.space32),
              // Suggested price info
              Container(
                padding: const EdgeInsets.all(AppSpacing.space16),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(AppSpacing.radius12),
                  border: Border.all(color: colorScheme.secondaryContainer),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline_rounded, color: colorScheme.secondary),
                    const SizedBox(width: AppSpacing.space12),
                    Expanded(
                      child: Text(
                        'Les offres raisonnables (10-30% de réduction) sont plus souvent acceptées.',
                        style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: AppSpacing.touchMin,
                child: ElevatedButton.icon(
                  onPressed: _priceController.text.isNotEmpty
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Offre envoyée au vendeur')),
                          );
                          context.pop();
                        }
                      : null,
                  icon: const Icon(Icons.send_rounded),
                  label: Text(AppLocalizations.of(context).general_submit),
                ),
              ),
              const SizedBox(height: AppSpacing.space8),
            ],
          ),
        ),
      ),
    );
  }
}
