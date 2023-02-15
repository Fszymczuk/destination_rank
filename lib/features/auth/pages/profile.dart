import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProfileScreen(
        providerConfigs: const [
          EmailProviderConfiguration(),
        ],
        actions: [
          SignedOutAction((context) {
            Navigator.of(context).pop();
          }),
        ],
        avatarSize: 24,
      ),
    );
  }
}
