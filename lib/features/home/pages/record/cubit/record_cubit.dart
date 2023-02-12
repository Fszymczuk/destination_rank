import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit()
      : super(const RecordState(
          documents: [],
          errorMessage: '',
          IsLoading: true,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(const RecordState(
      documents: [],
      errorMessage: '',
      IsLoading: true,
    ));
    _streamSubscription = FirebaseFirestore.instance
        .collection("records")
        .snapshots()
        .listen((data) {
      emit(RecordState(
        documents: data.docs,
        errorMessage: '',
        IsLoading: false,
      ));
    })
      ..onError((error) {
        emit(RecordState(
          documents: const [],
          errorMessage: error.toString(),
          IsLoading: false,
        ));
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
