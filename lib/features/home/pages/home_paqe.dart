import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePaqe extends StatelessWidget {
  const HomePaqe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("categories").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('blad');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('ladowanie');
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              Categorywidget(documents[0]['title']),
              const Categorywidget('aaa'),
            ],
          );
        },
      ),
    );
  }
}

class Categorywidget extends StatelessWidget {
  const Categorywidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        child: Text(title),
      ),
    );
  }
}
