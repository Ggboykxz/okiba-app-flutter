import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selected = 'fr';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    final languages = [
      ('fr', l10n.settings_language_fr, 'FR', l10n.profile_language_default),
      ('en', l10n.settings_language_en, 'EN', 'Default language'),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.profile_language_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.space16),
            child: Text(
              l10n.profile_language_choose,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          ...List.generate(languages.length, (i) {
            final lang = languages[i];
            final selected = _selected == lang.$1;
            return Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.space8),
              child: InkWell(
                onTap: () => setState(() => _selected = lang.$1),
                borderRadius: BorderRadius.circular(AppSpacing.radius12),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.space16),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: selected
                              ? colorScheme.primaryContainer
                              : colorScheme.surfaceContainerHighest,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            lang.$3,
                            style: textTheme.titleMedium?.copyWith(
                              color: selected
                                  ? colorScheme.onPrimaryContainer
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.space12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lang.$2,
                              style: textTheme.titleSmall?.copyWith(
                                color: selected
                                    ? colorScheme.onSurface
                                    : colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              lang.$4,
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        selected
                            ? Icons.radio_button_checked_rounded
                            : Icons.radio_button_off_rounded,
                        color: selected
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
