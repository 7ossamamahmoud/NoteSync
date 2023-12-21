import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.only(
            top: 22.0,
            bottom: 16,
          ),
          child: notes.isNotEmpty
              ? ListView.builder(
                  itemCount: notes.length,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      notes[index].delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      showNoNotesSnackBar(context, notes, index);
                    },
                    child: NoteItem(
                      note: notes[index],
                    ),
                  ),
                )
              : const Center(
                  child: Text(
                    'There are no notes, Start capturing your thoughts and ideas now 😊',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'JosefinSans',
                    ),
                  ),
                ),
        );
      },
    );
  }
}
