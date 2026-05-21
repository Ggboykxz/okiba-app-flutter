import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class BoutiqueSettingsScreen extends StatefulWidget {
  const BoutiqueSettingsScreen({super.key});

  @override
  State<BoutiqueSettingsScreen> createState() => _BoutiqueSettingsScreenState();
}

class _BoutiqueSettingsScreenState extends State<BoutiqueSettingsScreen> {
  final _nameController = TextEditingController(text: 'Adélaïde Styles');
  final _descriptionController = TextEditingController(text: 'Mode & Accessoires faits main au Gabon.');
  final _addressController = TextEditingController(text: 'Libreville, Gabon');
  final _phoneController = TextEditingController(text: '+241 74 12 34 56');
  final _emailController = TextEditingController(text: 'contact@adelaide-styles.ga');
  TimeOfDay _openTime = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _closeTime = const TimeOfDay(hour: 18, minute: 0);

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.boutique_settings_title),
        actions: [
          TextButton(onPressed: () {}, child: Text(l10n.boutique_settings_save)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Logo
          Center(
            child: Stack(
              children: [
                Container(
                  width: 96, height: 96,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppSpacing.radius20),
                  ),
                  child: Icon(Icons.store_rounded, size: 48, color: colorScheme.onPrimaryContainer),
                ),
                Positioned(
                  bottom: 0, right: 0,
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      icon: Icon(Icons.camera_alt_rounded, color: colorScheme.primary),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Banner
          Text(l10n.boutique_settings_banner, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space8),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
              border: Border.all(color: colorScheme.outlineVariant, style: BorderStyle.solid),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate_rounded, color: colorScheme.onSurfaceVariant),
                  const SizedBox(height: 4),
                  Text(l10n.boutique_settings_add_banner, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Name
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: l10n.boutique_settings_name),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Description
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: l10n.boutique_settings_description, alignLabelWithHint: true),
            maxLines: 3,
          ),
          const SizedBox(height: AppSpacing.space16),
          // Phone & Email
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: l10n.boutique_settings_phone),
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: l10n.boutique_settings_email),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space16),
          // Address
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(labelText: l10n.boutique_settings_address),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Hours
          Text(l10n.boutique_settings_hours, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Row(
            children: [
              Expanded(
                child: _timePicker(l10n.boutique_settings_opening, _openTime, (t) => setState(() => _openTime = t), colorScheme, textTheme),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: _timePicker(l10n.boutique_settings_closing, _closeTime, (t) => setState(() => _closeTime = t), colorScheme, textTheme),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          // Delivery zone
          Text(l10n.boutique_settings_delivery_zones, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Wrap(
            spacing: AppSpacing.space8,
            runSpacing: AppSpacing.space8,
            children: ['Libreville', 'Port-Gentil', 'Franceville', 'Oyem'].map((z) {
              return FilterChip(
                label: Text(z),
                selected: true,
                onSelected: (_) {},
              );
            }).toList(),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _timePicker(
    String label, TimeOfDay time, ValueChanged<TimeOfDay> onChanged,
    ColorScheme colorScheme, TextTheme textTheme,
  ) {
    return InkWell(
      onTap: () async {
        final picked = await showTimePicker(context: context, initialTime: time);
        if (picked != null) onChanged(picked);
      },
      child: InputDecorator(
        decoration: InputDecoration(labelText: label),
        child: Text(time.format(context), style: textTheme.bodyMedium),
      ),
    );
  }
}
