import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState());

  Future<void> add(
    String countryName,
    String cityName,
    String imageURL,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('records').add(
        {
          'country': countryName,
          'city': cityName,
          'URL': imageURL,
        },
      );
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
