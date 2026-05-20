import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';

class InAppNotificationBanner extends StatefulWidget {
  final String title;
  final String body;
  final IconData icon;
  final Color iconColor;
  final Duration autoDismiss;
  final VoidCallback? onTap;

  const InAppNotificationBanner({
    super.key,
    required this.title,
    required this.body,
    this.icon = Icons.notifications_rounded,
    this.iconColor = Colors.blue,
    this.autoDismiss = const Duration(seconds: 4),
    this.onTap,
  });

  static void show({
    required BuildContext context,
    required String title,
    required String body,
    IconData icon = Icons.notifications_rounded,
    Color iconColor = Colors.blue,
    Duration autoDismiss = const Duration(seconds: 4),
    VoidCallback? onTap,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _BannerWidget(
        title: title,
        body: body,
        icon: icon,
        iconColor: iconColor,
        autoDismiss: autoDismiss,
        onTap: () {
          entry.remove();
          onTap?.call();
        },
        onDismiss: () => entry.remove(),
      ),
    );
    overlay.insert(entry);
  }

  @override
  State<InAppNotificationBanner> createState() => _InAppNotificationBannerState();
}

class _InAppNotificationBannerState extends State<InAppNotificationBanner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnim;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _slideAnim = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
    _dismissTimer = Timer(widget.autoDismiss, () {
      _controller.reverse().then((_) => widget.onTap);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _dismissTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SlideTransition(
      position: _slideAnim,
      child: GestureDetector(
        onTap: () {
          _dismissTimer?.cancel();
          _controller.reverse().then((_) => widget.onTap?.call());
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(
            AppSpacing.space16,
            MediaQuery.of(context).padding.top + AppSpacing.space8,
            AppSpacing.space16,
            0,
          ),
          padding: const EdgeInsets.all(AppSpacing.space16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radius16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: widget.iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 20),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.title,
                      style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text(widget.body,
                      style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                      maxLines: 2, overflow: TextOverflow.ellipsis),
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

class _BannerWidget extends StatefulWidget {
  final String title;
  final String body;
  final IconData icon;
  final Color iconColor;
  final Duration autoDismiss;
  final VoidCallback? onTap;
  final VoidCallback? onDismiss;

  const _BannerWidget({
    required this.title,
    required this.body,
    required this.icon,
    required this.iconColor,
    required this.autoDismiss,
    this.onTap,
    this.onDismiss,
  });

  @override
  State<_BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<_BannerWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnim;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _slideAnim = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
    _dismissTimer = Timer(widget.autoDismiss, () {
      _controller.reverse().then((_) => widget.onDismiss?.call());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _dismissTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SlideTransition(
      position: _slideAnim,
      child: GestureDetector(
        onTap: () {
          _dismissTimer?.cancel();
          _controller.reverse().then((_) => widget.onTap?.call());
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(
            AppSpacing.space16,
            MediaQuery.of(context).padding.top + AppSpacing.space8,
            AppSpacing.space16,
            0,
          ),
          padding: const EdgeInsets.all(AppSpacing.space16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radius16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: widget.iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.icon, color: widget.iconColor, size: 20),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.title,
                      style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text(widget.body,
                      style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _controller.reverse().then((_) => widget.onDismiss?.call());
                },
                child: Icon(Icons.close_rounded, size: 18, color: colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
