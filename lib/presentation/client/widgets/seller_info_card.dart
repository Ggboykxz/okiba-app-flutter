import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';

class SellerInfoCard extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final double rating;
  final int productCount;
  final String responseTime;
  final bool isVerified;

  const SellerInfoCard({
    super.key,
    required this.name,
    this.avatarUrl,
    this.rating = 0,
    this.productCount = 0,
    this.responseTime = 'Quelques heures',
    this.isVerified = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space16,
        vertical: AppSpacing.space8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: colorScheme.surfaceContainerHighest,
              backgroundImage:
                  avatarUrl != null ? NetworkImage(avatarUrl!) : null,
              child: avatarUrl == null
                  ? Icon(
                      Icons.store_rounded,
                      color: colorScheme.onSurfaceVariant,
                    )
                  : null,
            ),
            const SizedBox(width: AppSpacing.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: textTheme.titleSmall,
                      ),
                      if (isVerified) ...[
                        const SizedBox(width: AppSpacing.space4),
                        Icon(
                          Icons.verified_rounded,
                          size: 16,
                          color: colorScheme.secondary,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 14,
                        color: colorScheme.secondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toStringAsFixed(1),
                        style: textTheme.bodySmall,
                      ),
                      const SizedBox(width: AppSpacing.space12),
                      Text(
                        '$productCount produits',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Réponse sous $responseTime',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline_rounded),
              color: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
