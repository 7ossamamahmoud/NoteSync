part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitialState extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState {}

class AddNoteSuccessfulState extends AddNoteState {}

class AddNoteFailureState extends AddNoteState {
  final String errorMessage;

  AddNoteFailureState({
    required this.errorMessage,
  });
}
