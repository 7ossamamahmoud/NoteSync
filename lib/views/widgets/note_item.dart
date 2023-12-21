import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMMd().format(
      DateTime.parse(note.date),
    ); // Date
    String formattedTime = DateFormat.Hm().format(
      DateTime.parse(note.date),
    );
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            EditNoteView.editViewID,
            arguments: note,
          );
        },
        child: Container(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 24.0,
            left: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              18,
            ),
            color: Color(
              note.color,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title.trim(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: 12,
                    right: 10,
                  ),
                  child: Text(
                    note.subTitle.trim(),
                    maxLines: 8,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black.withOpacity(
                        0.65,
                      ),
                      fontSize: 17,
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 28,
                  ),
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    ScaffoldMessenger.of(context).showSnackBar(
                      buildDeleteNoteSnackBar(note),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 26.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedTime,
                      style: TextStyle(
                        color: Colors.black.withOpacity(
                          0.68,
                        ),
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        color: Colors.black.withOpacity(
                          0.68,
                        ),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
