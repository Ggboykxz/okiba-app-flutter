import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';

class CartItemCard extends StatelessWidget {
  final String title;
  final String price;
  final String? imageUrl;
  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;
  final VoidCallback? onTap;

  const CartItemCard({
    super.key,
    required this.title,
    required this.price,
    this.imageUrl,
    this.quantity = 1,
    this.onIncrement,
    this.onDecrement,
    this.onRemove,
    this.onTap,
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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.radius8),
              child: Container(
                width: 80,
                height: 80,
                color: colorScheme.surfaceContainerHighest,
                child: imageUrl != null
                    ? Image.network(imageUrl!, fit: BoxFit.cover)
                    : Icon(
                        Icons.image_rounded,
                        color: colorScheme.onSurfaceVariant,
                      ),
              ),
            ),
            const SizedBox(width: AppSpacing.space12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: textTheme.titleSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: onRemove,
                        child: Icon(
                          Icons.close_rounded,
                          size: 20,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space4),
                  Text(
                    price,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.space8),
                  Row(
                    children: [
                      InkWell(
                        onTap: onDecrement,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.remove_rounded,
                            size: 18,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.space12,
                        ),
                        child: Text(
                          '$quantity',
                          style: textTheme.titleSmall,
                        ),
                      ),
                      InkWell(
                        onTap: onIncrement,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_rounded,
                            size: 18,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
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
