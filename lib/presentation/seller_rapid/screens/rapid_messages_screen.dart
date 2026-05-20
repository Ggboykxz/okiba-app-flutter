import 'package:flutter/material.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class RapidMessagesScreen extends StatefulWidget {
  const RapidMessagesScreen({super.key});

  @override
  State<RapidMessagesScreen> createState() => _RapidMessagesScreenState();
}

class _RapidMessagesScreenState extends State<RapidMessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.sellerRapidMessagesTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          _messageCard(
            'Marie Obiang',
            'Bonjour, toujours dispo ?',
            'Il y a 10min',
            'iPhone 13',
            true,
            colorScheme,
            textTheme,
          ),
          _messageCard(
            'Paul Mba',
            'Ok je prends, livrez quand ?',
            'Il y a 2h',
            'Lit simple',
            false,
            colorScheme,
            textTheme,
          ),
          _messageCard(
            'Awa Diallo',
            'Merci ! Reçu en super état',
            'Il y a 1j',
            'Sac artisanal',
            false,
            colorScheme,
            textTheme,
          ),
          _messageCard(
            'Jean Eyeghe',
            'Est-ce que c\'est toujours disponible ?',
            'Il y a 2j',
            'Cours maths',
            false,
            colorScheme,
            textTheme,
          ),
        ],
      ),
    );
  }

  Widget _messageCard(
    String name, String message, String time, String product, bool unread,
    ColorScheme colorScheme, TextTheme textTheme,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space12),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: colorScheme.primaryContainer,
                    child: Text(name[0], style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimaryContainer)),
                  ),
                  if (unread)
                    Positioned(
                      top: 0, right: 0,
                      child: Container(
                        width: 12, height: 12,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(name, style: textTheme.titleSmall?.copyWith(
                          fontWeight: unread ? FontWeight.w700 : FontWeight.normal)),
                        Text(time, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(product, style: textTheme.bodySmall?.copyWith(color: colorScheme.primary, fontSize: 11)),
                    Text(message, style: textTheme.bodyMedium?.copyWith(
                      color: unread ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                      fontWeight: unread ? FontWeight.w500 : FontWeight.normal),
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
