import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'core/services/connectivity_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Pas de configuration Firebase (google-services.json manquant)
  }
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('cart');

  final connectivity = ConnectivityService();
  connectivity.initialize();

  runApp(const App());
}
