import 'package:flutter/material.dart';
import '../constants/app_spacing.dart';
import '../constants/app_colors.dart';
import '../constants/app_animations.dart';
import '../utils/haptics.dart';

class AppButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final bool isOutlined;
  final bool isText;
  final bool isWhatsapp;
  final bool isGlass;
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
    this.isGlass = false,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppAnimations.fast,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _scaleAnim = Tween(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: AppAnimations.easeOutQuart),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.onPressed != null && !widget.isLoading) {
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
    if (widget.onPressed != null && !widget.isLoading) {
      AppHaptics.buttonRelease();
    }
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Widget button;
    if (widget.isWhatsapp) {
      button = _buildWhatsappButton(theme);
    } else if (widget.isText) {
      button = TextButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        child: _buildContent(theme),
      );
    } else if (widget.isOutlined) {
      button = OutlinedButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: Size(
            widget.width ?? double.infinity,
            widget.height ?? AppSpacing.touchMin,
          ),
          foregroundColor: widget.foregroundColor ?? colorScheme.primary,
          side: BorderSide(color: colorScheme.outline, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radius16),
          ),
        ),
        child: _buildContent(theme),
      );
    } else if (widget.isGlass) {
      button = _buildGlassButton(theme);
    } else {
      button = ElevatedButton(
        onPressed: widget.isLoading ? null : widget.onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            widget.width ?? double.infinity,
            widget.height ?? AppSpacing.touchMin,
          ),
          backgroundColor: widget.backgroundColor ?? colorScheme.primary,
          foregroundColor: widget.foregroundColor ?? colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radius16),
          ),
          elevation: 2,
          shadowColor: AppColors.accentGlow,
        ),
        child: _buildContent(theme),
      );
    }

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnim.value,
            child: child,
          );
        },
        child: button,
      ),
    );
  }

  Widget _buildGlassButton(ThemeData theme) {
    return Container(
      height: widget.height ?? AppSpacing.touchMin,
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceGlass,
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        border: Border.all(color: AppColors.surfaceGlassBorder, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radius16),
        child: _buildContent(theme),
      ),
    );
  }

  Widget _buildWhatsappButton(ThemeData theme) {
    return ElevatedButton.icon(
      onPressed: widget.isLoading ? null : widget.onPressed,
      icon: Image.asset(
        'assets/icons/whatsapp.png',
        width: 20,
        height: 20,
        errorBuilder: (_, a, b) => const Icon(Icons.chat, size: 20),
      ),
      label: Text(widget.label),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whatsapp,
        foregroundColor: Colors.white,
        minimumSize: Size(
          widget.width ?? 160,
          widget.height ?? AppSpacing.touchCompact,
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        ),
        elevation: 2,
        shadowColor: AppColors.whatsapp.withValues(alpha: 0.3),
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    if (widget.isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: widget.isOutlined
              ? theme.colorScheme.primary
              : theme.colorScheme.onPrimary,
        ),
      );
    }

    if (widget.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(widget.icon, size: 20),
          const SizedBox(width: 8),
          Text(widget.label),
        ],
      );
    }

    return Text(widget.label);
  }
}
