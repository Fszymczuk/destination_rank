part of 'record_cubit.dart';

@immutable
class RecordState {
  final List<QueryDocumentSnapshot<Object?>> documents;

// ignore: non_constant_identifier_names
  final bool IsLoading;
  final String errorMessage;

  // ignore: non_constant_identifier_names
  const RecordState(
      {required this.documents,
      // ignore: non_constant_identifier_names
      required this.IsLoading,
      required this.errorMessage});
}
