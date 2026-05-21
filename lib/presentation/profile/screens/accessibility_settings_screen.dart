import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class AccessibilitySettingsScreen extends StatefulWidget {
  const AccessibilitySettingsScreen({super.key});

  @override
  State<AccessibilitySettingsScreen> createState() => _AccessibilitySettingsScreenState();
}

class _AccessibilitySettingsScreenState extends State<AccessibilitySettingsScreen> {
  double _textScale = 1.0;
  bool _highContrast = false;
  bool _reduceMotion = false;
  bool _largeTouchTargets = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_accessibility_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Text(l10n.profile_accessibility_display, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.profile_accessibility_text_size, style: textTheme.titleSmall),
                  const SizedBox(height: AppSpacing.space8),
                  Row(
                    children: [
                      Icon(Icons.text_fields_rounded, size: 18, color: colorScheme.onSurfaceVariant),
                      Expanded(
                        child: Slider(
                          value: _textScale,
                          min: 0.8,
                          max: 1.5,
                          divisions: 7,
                          label: '${(_textScale * 100).round()}%',
                          onChanged: (v) => setState(() => _textScale = v),
                        ),
                      ),
                      Icon(Icons.text_fields_rounded, size: 28, color: colorScheme.onSurfaceVariant),
                    ],
                  ),
                  Text('${(_textScale * 100).round()}%',
                    style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space8),
          SwitchListTile(
            title: Text(l10n.profile_accessibility_high_contrast),
            subtitle: const Text('Améliore la lisibilité'),
            value: _highContrast,
            onChanged: (v) => setState(() => _highContrast = v),
          ),
          SwitchListTile(
            title: Text(l10n.profile_accessibility_reduce_animations),
            subtitle: const Text('Diminue les mouvements'),
            value: _reduceMotion,
            onChanged: (v) => setState(() => _reduceMotion = v),
          ),
          SwitchListTile(
            title: Text(l10n.profile_accessibility_large_touch),
            subtitle: const Text('Minimum 56dp pour les boutons'),
            value: _largeTouchTargets,
            onChanged: (v) => setState(() => _largeTouchTargets = v),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.profile_accessibility_preview, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Exemple de texte', style: textTheme.titleMedium?.copyWith(fontSize: 16 * _textScale)),
                  const SizedBox(height: AppSpacing.space8),
                  Text('Ceci est un exemple de texte avec la taille sélectionnée. '
                    'Le contraste et les animations sont appliqués en temps réel.',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14 * _textScale,
                      fontWeight: _highContrast ? FontWeight.w500 : null,
                      color: _highContrast ? colorScheme.onSurface : null,
                    )),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }
}
