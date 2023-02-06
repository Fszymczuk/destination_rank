import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecordPaqeContent extends StatelessWidget {
  const RecordPaqeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("records")
            .orderBy('rank', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          }
          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('SortBy')),
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.pink,
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(document['city']),
                              Text(document['country']),
                            ],
                          ),
                          Text(document['rank'].toString()),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ],
          );
        });
  }
}
