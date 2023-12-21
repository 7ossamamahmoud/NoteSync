import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/color_list_view.dart';
import 'package:notes/views/widgets/custom_button.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  _AddNoteFormState createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  double opacity = 0.0; // Initial opacity
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    // Start the fade-in animation when the widget is first built
    Future.delayed(const Duration(milliseconds: 80), () {
      setState(() {
        opacity = 1.0; // Set opacity to fully visible
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String? title, subTitle;

    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (value) {
              title = value?.trim();
            },
            hintText: "Title",
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value?.trim();
            },
            hintText: "Content",
            maxLines: 5,
          ),
          const SizedBox(height: 35),
          const ColorsListView(),
          const SizedBox(height: 35),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) => state is! AddNoteLoadingState
                ? CustomButton(
                    onTap: () {
                      // Check for empty or whitespace-only values
                      if (!formKey.currentState!.validate()) {
                        autoValidateMode = AutovalidateMode.always;
                      } else {
                        formKey.currentState!.save();
                        NoteModel noteModel = NoteModel(
                          title: title!.trim(),
                          subTitle: subTitle!.trim(),
                          date: DateTime.now().toString(),
                          color: Colors.blue.value,
                        );
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                        print('NON Validate');
                      }

                      setState(() {});
                    },
                  )
                : const CircularProgressIndicator(
                    color: Colors.blue,
                  ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
