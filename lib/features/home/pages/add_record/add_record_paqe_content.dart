import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destination_rank/features/home/pages/add_record/cubit/add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  String? _countryName;
  String? _cityName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: BlocBuilder<AddCubit, AddState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add new upcoming title'),
              actions: [
                IconButton(
                  onPressed: _countryName == null || _cityName == null
                      ? null
                      : () {
                          context.read<AddCubit>().add(
                                _countryName!,
                                _cityName!,
                              );
                        },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            body: _AddPageBody(
              onContryChanged: (newValue) {
                setState(() {
                  _countryName = newValue;
                });
              },
              onCityChanged: (newValue) {
                setState(() {
                  _cityName = newValue;
                });
              },
            ),
          );
          ;
        },
      ),
    );
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({
    Key? key,
    required this.onContryChanged,
    required this.onCityChanged,
  }) : super(key: key);

  final Function(String) onContryChanged;
  final Function(String) onCityChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      children: [
        TextField(
          onChanged: onContryChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Matrix 5',
            label: Text('Title'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onCityChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'http:// ... .jpg',
            label: Text('Image URL'),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text('Choose release date'),
        ),
      ],
    );
  }
}
