import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  static const _chats = [
    _ChatData(
      id: '1', name: 'Adélaïde Styles', avatar: 'A',
      lastMessage: 'Bonjour, la chemise est toujours disponible ?',
      time: '12:30', unread: 2, isOnline: true,
      product: 'Chemise traditionnelle', orderId: '#OKB-2024-001',
    ),
    _ChatData(
      id: '2', name: 'Maman Binta', avatar: 'B',
      lastMessage: "D'accord, je vous prépare ça pour 14h.",
      time: '11:15', unread: 0, isOnline: true,
      product: 'Poulet braisé',
    ),
    _ChatData(
      id: '3', name: 'Tech Gabon', avatar: 'T',
      lastMessage: 'Oui, nous avons encore le modèle en stock.',
      time: 'Hier', unread: 1, isOnline: false,
      product: 'Smartphone reconditionné',
    ),
    _ChatData(
      id: '4', name: 'Bois & Design', avatar: 'B',
      lastMessage: 'La livraison est prévue demain matin.',
      time: 'Hier', unread: 0, isOnline: false,
      product: 'Meuble salon', orderId: '#OKB-2024-002',
    ),
    _ChatData(
      id: '5', name: 'Support Okiba', avatar: 'O',
      lastMessage: 'Merci de patienter, nous traitons votre demande.',
      time: 'Mar 14', unread: 0, isOnline: true,
      product: 'Support client',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.chat_title),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
        itemCount: _chats.length,
        separatorBuilder: (_, _) => const Divider(height: 1, indent: 80),
        itemBuilder: (_, i) {
          final c = _chats[i];
          return _ChatTile(
            name: c.name,
            avatar: c.avatar,
            lastMessage: c.lastMessage,
            time: c.time,
            unread: c.unread,
            isOnline: c.isOnline,
            product: c.product,
            onTap: () {
              if (c.id == '5') {
                context.push(RoutePaths.supportChat);
              } else {
                context.push('${RoutePaths.chatList}/${c.id}');
              }
            },
          );
        },
      ),
    );
  }
}

class _ChatData {
  final String id;
  final String name;
  final String avatar;
  final String lastMessage;
  final String time;
  final int unread;
  final bool isOnline;
  final String product;
  final String? orderId;

  const _ChatData({
    required this.id,
    required this.name,
    required this.avatar,
    required this.lastMessage,
    required this.time,
    this.unread = 0,
    this.isOnline = false,
    required this.product,
    this.orderId,
  });
}

class _ChatTile extends StatelessWidget {
  final String name;
  final String avatar;
  final String lastMessage;
  final String time;
  final int unread;
  final bool isOnline;
  final String product;
  final VoidCallback onTap;

  const _ChatTile({
    required this.name,
    required this.avatar,
    required this.lastMessage,
    required this.time,
    required this.unread,
    required this.isOnline,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space16,
        vertical: AppSpacing.space4,
      ),
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: colorScheme.primaryContainer,
            child: Text(
              avatar,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          if (isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.surface, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(name, style: textTheme.titleSmall),
          ),
          Text(
            time,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  lastMessage,
                  style: textTheme.bodyMedium?.copyWith(
                    color: unread > 0
                        ? colorScheme.onSurface
                        : colorScheme.onSurfaceVariant,
                    fontWeight: unread > 0 ? FontWeight.w600 : FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (unread > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: colorScheme.error,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$unread',
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.onError,
                  fontSize: 10,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
