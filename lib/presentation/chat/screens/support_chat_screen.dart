import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  final _messageController = TextEditingController();
  final _messages = <_Message>[
    _Message('Bonjour, comment puis-je vous aider ?', true, '14:00'),
    _Message('J\'ai un problème avec ma commande #OKB-2024-001', false, '14:05'),
    _Message('Je vois. De quel type de problème s\'agit-il ?', true, '14:05'),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    final quickReplies = [
      l10n.chat_support_quick_reply_late,
      l10n.chat_support_quick_reply_defective,
      l10n.chat_support_quick_reply_payment,
      l10n.chat_support_quick_reply_cancel,
      l10n.chat_support_quick_reply_other,
    ];

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
              child: Icon(Icons.support_agent_rounded, color: colorScheme.onPrimaryContainer),
            ),
            const SizedBox(width: AppSpacing.space12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.chat_support_title, style: textTheme.titleSmall),
                Text(l10n.chat_support_online, style: textTheme.bodySmall?.copyWith(color: colorScheme.primary)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () => _showTicketMenu(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppSpacing.space16),
            padding: const EdgeInsets.all(AppSpacing.space12),
            decoration: BoxDecoration(
              color: colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
            ),
            child: Row(
              children: [
                Icon(Icons.confirmation_number_rounded, color: colorScheme.onSecondaryContainer),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ticket #TKT-2024-0089', style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                      Text(l10n.chat_support_processing, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSecondaryContainer)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Text(l10n.chat_support_open, style: textTheme.labelSmall?.copyWith(color: Colors.orange, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16),
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final m = _messages[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.space8),
                  child: _buildBubble(m, colorScheme, textTheme),
                );
              },
            ),
          ),
          if (_messages.length <= 3)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16, vertical: AppSpacing.space8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Que puis-je pour vous ?', style: textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: AppSpacing.space8),
                  Wrap(
                    spacing: AppSpacing.space8,
                    runSpacing: AppSpacing.space8,
                    children: quickReplies.map((r) => ActionChip(
                      label: Text(r, style: const TextStyle(fontSize: 12)),
                      onPressed: () {
                        setState(() {
                          _messages.add(_Message(r, false, '14:06'));
                        });
                      },
                    )).toList(),
                  ),
                ],
              ),
            ),
          Container(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.space12, AppSpacing.space8, AppSpacing.space12,
              MediaQuery.of(context).padding.bottom + AppSpacing.space8,
            ),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: l10n.chat_support_input_placeholder,
                      filled: true,
                      fillColor: colorScheme.surfaceContainerHighest,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.space16, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.space8),
                IconButton(
                  icon: const Icon(Icons.send_rounded),
                  color: colorScheme.primary,
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _messages.add(_Message(_messageController.text, false, '14:07'));
                        _messageController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBubble(_Message m, ColorScheme colorScheme, TextTheme textTheme) {
    final width = MediaQuery.of(context).size.width;
    return Align(
      alignment: m.isSupport ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: width * 0.75),
        padding: const EdgeInsets.all(AppSpacing.space12),
        decoration: BoxDecoration(
          color: m.isSupport ? colorScheme.surfaceContainerHighest : colorScheme.primary,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(AppSpacing.radius16),
            topRight: const Radius.circular(AppSpacing.radius16),
            bottomLeft: Radius.circular(m.isSupport ? 4 : AppSpacing.radius16),
            bottomRight: Radius.circular(m.isSupport ? AppSpacing.radius16 : 4),
          ),
        ),
        child: Column(
          crossAxisAlignment: m.isSupport ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(m.text, style: textTheme.bodyMedium?.copyWith(
              color: m.isSupport ? null : colorScheme.onPrimary,
            )),
            const SizedBox(height: 4),
            Text(m.time, style: textTheme.bodySmall?.copyWith(
              color: m.isSupport ? colorScheme.onSurfaceVariant : colorScheme.onPrimary.withValues(alpha: 0.7),
              fontSize: 10,
            )),
          ],
        ),
      ),
    );
  }

  void _showTicketMenu(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.info_rounded),
              title: Text(l10n.chat_support_view_ticket),
              onTap: () => Navigator.pop(ctx),
            ),
            ListTile(
              leading: const Icon(Icons.image_rounded),
              title: Text(l10n.chat_support_attach_photo),
              onTap: () => Navigator.pop(ctx),
            ),
            ListTile(
              leading: const Icon(Icons.close_rounded),
              title: Text(l10n.chat_support_close_ticket),
              onTap: () => Navigator.pop(ctx),
            ),
          ],
        ),
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isSupport;
  final String time;
  const _Message(this.text, this.isSupport, this.time);
}
