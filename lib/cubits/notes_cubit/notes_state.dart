part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitialState extends NotesState {}

class NotesSuccessfulState extends NotesState {}

class NotesThemeLoadingState extends NotesState {}

class NotesThemeSuccessfulState extends NotesState {}

class NotesFailureState extends NotesState {
  final String errorMessage;

  NotesFailureState({required this.errorMessage});
}
