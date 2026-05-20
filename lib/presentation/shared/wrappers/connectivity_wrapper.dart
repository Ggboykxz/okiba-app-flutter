import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWrapper({super.key, required this.child});

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  bool _isOffline = false;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final result = await Connectivity().checkConnectivity();
    _update(result);
    _subscription = Connectivity().onConnectivityChanged.listen(_update);
  }

  void _update(List<ConnectivityResult> results) {
    if (!mounted) return;
    setState(() {
      _isOffline = results.every((r) => r == ConnectivityResult.none);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: AppSpacing.durationNormal,
          height: _isOffline ? 48 : 0,
          width: double.infinity,
          color: AppColors.warningContainer,
          child: AnimatedOpacity(
            opacity: _isOffline ? 1.0 : 0.0,
            duration: AppSpacing.durationNormal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.wifi_off, size: 20, color: AppColors.warning),
                const SizedBox(width: 8),
                Text(
                  'Mode hors connexion. Données en cache.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.warning,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: widget.child),
      ],
    );
  }
}
