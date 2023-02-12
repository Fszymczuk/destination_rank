import 'package:cloud_firestore/cloud_firestore.dart';
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
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      floatingActionButton: FloatingActionButton(
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
              child: Container(
                color: Colors.pink,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            image: DecorationImage(
                              image: NetworkImage(
                                document['url'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
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
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                              ),
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: const [
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('days left'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
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
