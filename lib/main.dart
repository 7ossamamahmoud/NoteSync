import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/simple_bloc_observer.dart';
import 'package:notes/views/notes_view.dart';
import 'package:notes/views/widgets/edit_note_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotesCubit.init();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: BlocProvider.of<NotesCubit>(context).isDarkTheme
                ? buildDarkThemeData()
                : buildThemeLightData(),
            routes: {
              NotesView.notesHomeViewID: (context) => const NotesView(),
              EditNoteView.editViewID: (context) => const EditNoteView(),
            },
            initialRoute: NotesView.notesHomeViewID,
          );
        },
      ),
    );
  }
}
