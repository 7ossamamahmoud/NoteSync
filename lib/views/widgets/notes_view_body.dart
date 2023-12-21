import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';
import 'package:notes/views/widgets/notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
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
              title: 'NoteSync',
              icon: NotesCubit.get(context).isDarkTheme
                  ? Icons.dark_mode_outlined
                  : FontAwesomeIcons.sun,
              onPressed: () {
                setState(() {
                  NotesCubit.get(context).toggleTheme(context);
                });
              }),
          const Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
