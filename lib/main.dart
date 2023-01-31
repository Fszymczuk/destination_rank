import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destination_rank/features/auth/pages/auth_gate.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/home/pages/home_paqe/home_paqe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: const MyApp(),
    theme: ThemeData(primarySwatch: Colors.red),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePaqe();
  }
}
