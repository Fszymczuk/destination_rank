import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddRecordPaqeContent extends StatefulWidget {
  const AddRecordPaqeContent({
    Key? key,
    required this.onSave,
  }) : super(key: key);
  final Function onSave;
  @override
  State<AddRecordPaqeContent> createState() => _AddRecordPaqeContentState();
}

class _AddRecordPaqeContentState extends State<AddRecordPaqeContent> {
  var countryName = '';
  var cityName = '';
  var rank = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (newValue) {
                setState(() {
                  countryName = newValue;
                });
              },
              decoration: const InputDecoration(hintText: 'Type Country'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (newValue) {
                setState(() {
                  cityName = newValue;
                });
              },
              decoration: const InputDecoration(hintText: 'Type City'),
            ),
          ),
          Slider(
              label: rank.toString(),
              divisions: 9,
              min: 1.0,
              max: 10.0,
              value: rank,
              onChanged: ((newValue) {
                setState(() {
                  rank = newValue;
                });
              })),
          ElevatedButton(
              onPressed: countryName.isEmpty || cityName.isEmpty
                  ? null
                  : (() {
                      FirebaseFirestore.instance.collection('records').add({
                        'country': countryName,
                        'city': cityName,
                        'rank': rank,
                      });
                      widget.onSave();
                    }),
              child: const Text('Add'))
        ],
      ),
    );
  }
}
