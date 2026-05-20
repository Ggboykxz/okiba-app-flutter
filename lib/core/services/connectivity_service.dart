import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final ValueNotifier<bool> isOnline = ValueNotifier<bool>(true);
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  void initialize() {
    _subscription = _connectivity.onConnectivityChanged.listen(_updateStatus);
    _checkConnectivity();
  }

  void dispose() {
    _subscription?.cancel();
  }

  Future<void> _checkConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _updateStatus(results);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final online = results.any((r) => r != ConnectivityResult.none);
    isOnline.value = online;
  }
}
