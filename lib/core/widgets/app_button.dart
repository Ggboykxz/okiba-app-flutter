import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';
import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool isOutlined;
  final bool isText;
  final bool isWhatsapp;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.isOutlined = false,
    this.isText = false,
    this.isWhatsapp = false,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (isWhatsapp) {
      return _buildWhatsappButton(theme);
    }

    if (isText) {
      return TextButton(
        onPressed: isLoading ? null : onPressed,
        child: _buildContent(theme),
      );
    }

    if (isOutlined) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(width ?? double.infinity, height ?? AppSpacing.touchMin),
          foregroundColor: foregroundColor ?? colorScheme.primary,
          side: BorderSide(color: colorScheme.outline, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radius12),
          ),
        ),
        child: _buildContent(theme),
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? AppSpacing.touchMin),
        backgroundColor: backgroundColor ?? colorScheme.primary,
        foregroundColor: foregroundColor ?? colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
        ),
        elevation: 0,
      ),
      child: _buildContent(theme),
    );
  }

  Widget _buildWhatsappButton(ThemeData theme) {
    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: Image.asset(
        'assets/icons/whatsapp.png',
        width: 20,
        height: 20,
        errorBuilder: (_, a, b) => const Icon(Icons.chat, size: 20),
      ),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whatsapp,
        foregroundColor: Colors.white,
        minimumSize: Size(width ?? 160, height ?? AppSpacing.touchCompact),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
        elevation: 0,
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: isOutlined
              ? theme.colorScheme.primary
              : theme.colorScheme.onPrimary,
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label),
        ],
      );
    }

    return Text(label);
  }
}
