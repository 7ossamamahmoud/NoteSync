import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitialState());
  static NotesCubit get(context) => BlocProvider.of(context);
  static late SharedPreferences _prefs;
  List<NoteModel>? notes;

  fetchAllNotes() {
    try {
      Box<NoteModel> notesBox = Hive.box<NoteModel>(kNotesBox);
      notes = notesBox.values.toList();
      emit(NotesSuccessfulState());
    } catch (e) {
      emit(NotesFailureState(errorMessage: e.toString()));
    }
  }

  static Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      print('Error initializing SharedPreferences: $e');
      // Handle the error as needed
    }
  }

  bool get isDarkTheme => _prefs.getBool('isDarkTheme') ?? false;

  setDarkTheme(bool value) async {
    emit(NotesThemeLoadingState());
    try {
      await _prefs
          .setBool('isDarkTheme', value)
          .then((value) => emit(NotesThemeSuccessfulState()));
    } catch (e) {
      print('Error setting dark theme preference: $e');
      // Handle the error as needed
    }
  }

  void toggleTheme(context) {
    bool isDarkTheme = BlocProvider.of<NotesCubit>(context).isDarkTheme;
    setDarkTheme(!isDarkTheme);
  }
}
