import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class HomePaqe extends StatefulWidget {
  const HomePaqe({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePaqe> createState() => _HomePaqeState();
}

class _HomePaqeState extends State<HomePaqe> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const Center(
            child: Text('zero'),
          );
        }
        if (currentIndex == 1) {
          return const Center(
            child: Text('jeden'),
          );
        }
        if (currentIndex == 2) {
          return const Center(
            child: Text('dwa'),
          );
        }
        return const Center(
          child: Text('dwa'),
        );
      }),
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'My Account'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
      ),
    );
  }
}


      
      /*StreamBuilder<QuerySnapshot>(
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
*/
