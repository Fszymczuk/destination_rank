import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destination_rank/features/auth/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_record/add_record_paqe_content.dart';
import 'cubit/record_cubit.dart';

class RecordPaqeContent extends StatelessWidget {
  const RecordPaqeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple.shade200,
        appBar: AppBar(
          title: const Text(
            'Your destanations',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.purple.shade400,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ));
                },
                icon: const Icon(Icons.person_add_alt_rounded))
          ],
        ),
        floatingActionButton: SafeArea(
          child: FloatingActionButton(
            onPressed: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddRecordPaqeContent(
                    onSave: () {},
                  ),
                  fullscreenDialog: true,
                ),
              );
            }),
            child: const Icon(Icons.add),
          ),
        ),
        body: BlocProvider(
          create: (context) => RecordCubit()..start(),
          child: BlocBuilder<RecordCubit, RecordState>(
            builder: (context, state) {
              if (state.errorMessage.isNotEmpty) {
                return Text('Error:${state.errorMessage}');
              }
              if (state.IsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final documents = state.documents;

              return ListViewItem(documents: documents);
            },
          ),
        ),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    Key? key,
    required this.documents,
  }) : super(key: key);

  final List<QueryDocumentSnapshot<Object?>> documents;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          for (final document in documents) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 30,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            document['country'],
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    document['URL'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        document['city'],
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
