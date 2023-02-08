import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/record_cubit.dart';

class RecordPaqeContent extends StatelessWidget {
  const RecordPaqeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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

          return ListView(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('SortBy')),
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
        },
      ),
    );
  }
}
