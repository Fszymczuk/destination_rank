import 'package:destination_rank/features/auth/pages/auth_gate.dart';
import 'package:destination_rank/features/home/pages/record/record_paqe_content.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
    theme:
        ThemeData(colorSchemeSeed: Colors.purple.shade200, useMaterial3: true),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthGate();
  }
}
