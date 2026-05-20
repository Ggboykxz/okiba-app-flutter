import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';

class PaymentMethodCard extends StatelessWidget {
  final String method;
  final String label;
  final IconData icon;
  final Color? iconColor;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.method,
    required this.label,
    required this.icon,
    this.iconColor,
    this.isSelected = false,
    required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space16,
        vertical: AppSpacing.space4,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.space16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radius12),
            border: Border.all(
              color: isSelected ? colorScheme.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: (iconColor ?? colorScheme.primary)
                      .withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? colorScheme.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Text(
                  label,
                  style: textTheme.titleSmall,
                ),
              ),
              Icon(
                isSelected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
