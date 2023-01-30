import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Categorywidget extends StatelessWidget {
  const Categorywidget(this.title,{
    Key? key,
  }) : super(key: key);

final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(color: Colors.red,child:  Text(title),),
    );
  }
}