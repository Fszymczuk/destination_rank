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
  String? _imageURL;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AddCubit(),
        child: BlocListener<AddCubit, AddState>(
          listener: (context, state) {
            if (state.saved) {
              Navigator.of(context).pop();
            }
          },
          child: BlocBuilder<AddCubit, AddState>(
            builder: (context, state) {
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.purple.shade400,
                    title: const Text('Add new destination'),
                    actions: [
                      IconButton(
                        onPressed: _countryName == null || _cityName == null
                            ? null
                            : () {
                                context
                                    .read<AddCubit>()
                                    .add(_countryName!, _cityName!, _imageURL!);
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
                    onimageURL: (newValue) {
                      setState(() {
                        _imageURL = newValue;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AddPageBody extends StatelessWidget {
  const _AddPageBody({
    Key? key,
    required this.onContryChanged,
    required this.onCityChanged,
    required this.onimageURL,
  }) : super(key: key);

  final Function(String) onContryChanged;
  final Function(String) onCityChanged;
  final Function(String) onimageURL;
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
            hintText: 'Name',
            label: Text('Country'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onCityChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name',
            label: Text('City'),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          onChanged: onimageURL,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'http:// ... .jpg',
            label: Text('Image URL'),
          ),
        ),
      ],
    );
  }
}
