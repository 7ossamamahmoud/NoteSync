import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';
import 'package:notes/views/widgets/custom_text_field.dart';
import 'package:notes/views/widgets/edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  void initState() {
    title = widget.note.title;
    content = widget.note.subTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        children: [
          CustomAppBar(
            onPressed: () {
              widget.note.title = title?.trim() ?? widget.note.title;
              widget.note.subTitle = content?.trim() ?? widget.note.subTitle;
              if (title != null || content != null) {
                widget.note.date = DateTime.now().toString();
              }
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            icon: Icons.check,
            title: 'Edit Note',
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            onChanged: (text) {
              if (text != null && text.trim().isEmpty) {
                return null;
              }
              title = text.trim();
            },
            hintText: widget.note.title,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
            onChanged: (text) {
              if (text != null && text.trim().isEmpty) {
                return null;
              }

              content = text.trim();
            },
            maxLines: 8,
            hintText: widget.note.subTitle,
          ),
          const SizedBox(
            height: 24,
          ),
          EditNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}
