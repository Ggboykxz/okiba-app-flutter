import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../widgets/chat_offer_bubble.dart';

class ChatDetailScreen extends StatelessWidget {
  final String chatId;

  const ChatDetailScreen({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: colorScheme.primaryContainer,
              child: Text(
                'A',
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.space12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adélaïde Styles',
                  style: textTheme.titleSmall,
                ),
                Text(
                  l10n.chat_support_online,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(
              AppSpacing.space16,
              AppSpacing.space8,
              AppSpacing.space16,
              AppSpacing.space8,
            ),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
            ),
            child: ListTile(
              leading: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppSpacing.radius8),
                ),
                child: Icon(
                  Icons.image_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              title: Text(
                'Chemise traditionnelle',
                style: textTheme.titleSmall,
              ),
              subtitle: Text(
                '15 000 FCFA',
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: const Text('Voir'),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.space16),
              children: [
                _dateSeparator(l10n.notifications_today, colorScheme, textTheme),
                const SizedBox(height: AppSpacing.space8),
                _receivedMessage(
                  'Bonjour, la chemise est toujours disponible ?',
                  '12:30',
                  colorScheme,
                  textTheme,
                  context,
                ),
                const SizedBox(height: AppSpacing.space8),
                _sentMessage(
                  'Oui, toujours ! Plusieurs couleurs disponibles.',
                  '12:32',
                  colorScheme,
                  textTheme,
                  context,
                ),
                const SizedBox(height: AppSpacing.space8),
                _receivedMessage(
                  'Super ! Je peux passer la voir aujourd\'hui ?',
                  '12:33',
                  colorScheme,
                  textTheme,
                  context,
                ),
                const SizedBox(height: AppSpacing.space8),
                _sentMessage(
                  'Bien sûr, je suis au quartier Louis jusqu\'à 18h.',
                  '12:35',
                  colorScheme,
                  textTheme,
                  context,
                ),
                const SizedBox(height: AppSpacing.space8),
                _receivedMessage(
                  'Parfait, je passe vers 15h. Merci !',
                  '12:36',
                  colorScheme,
                  textTheme,
                  context,
                ),
                const SizedBox(height: AppSpacing.space8),
                ChatOfferBubble(
                  productName: 'Chemise traditionnelle',
                  originalPrice: 15000,
                  offeredPrice: 12000,
                  status: 'pending',
                ),
                const SizedBox(height: AppSpacing.space8),
                _sentMessage(
                  'D\'accord, à tout à l\'heure !',
                  '12:37',
                  colorScheme,
                  textTheme,
                  context,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.space12,
              AppSpacing.space8,
              AppSpacing.space12,
              AppSpacing.space16,
            ),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(
                top: BorderSide(color: colorScheme.outlineVariant),
              ),
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_rounded),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: l10n.chat_placeholder,
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusFull),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.space16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space8),
                  IconButton(
                    icon: const Icon(Icons.send_rounded),
                    color: colorScheme.primary,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateSeparator(
    String label,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.space12,
          vertical: AppSpacing.space4,
        ),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
        child: Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _receivedMessage(
    String text,
    String time,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context,
  ) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: width * 0.75,
        ),
        padding: const EdgeInsets.all(AppSpacing.space12),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(AppSpacing.radius16),
            bottomLeft: Radius.circular(AppSpacing.radius16),
            bottomRight: Radius.circular(AppSpacing.radius16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text, style: textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text(
              time,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sentMessage(
    String text,
    String time,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context,
  ) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: width * 0.75,
        ),
        padding: const EdgeInsets.all(AppSpacing.space12),
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSpacing.radius16),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(AppSpacing.radius16),
            bottomRight: Radius.circular(AppSpacing.radius16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onPrimary.withValues(alpha: 0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
