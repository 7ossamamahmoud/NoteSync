import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  static String editViewID = "Edit View ID";

  @override
  Widget build(BuildContext context) {
    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;

    return SafeArea(
      child: Scaffold(
        body: EditNoteViewBody(
          note: note,
        ),
      ),
    );
  }
}
