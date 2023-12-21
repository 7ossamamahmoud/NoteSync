import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
  });
  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value != null && value.trim().isEmpty) {
          return 'Please enter a non-empty value.';
        }
        return null;
      },
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: NotesCubit.get(context).isDarkTheme
              ? kPrimaryColor
              : Colors.black,
        ),
        border: buildOutlineInputBorder(context),
        enabledBorder: buildOutlineInputBorder(context),
        focusedBorder: buildOutlineInputBorder(context, kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(BuildContext context, [color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
        borderSide: BorderSide(
          color: NotesCubit.get(context).isDarkTheme
              ? color ?? Colors.white
              : Colors.blueGrey,
        ));
  }
}
