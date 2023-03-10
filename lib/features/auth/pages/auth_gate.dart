// ignore: unused_import
import 'package:destination_rank/features/home/pages/record/record_paqe_content.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            // If the user is already signed-in, use it as initial data
            initialData: FirebaseAuth.instance.currentUser,
            builder: (context, snapshot) {
              // User is not signed in
              if (!snapshot.hasData) {
                return const SignInScreen(providerConfigs: [
                  EmailProviderConfiguration(),
                ]);
              }

              // Render your application if authenticated
              return const RecordPaqeContent();
            },
          );
        },
      ),
    );
  }
}
