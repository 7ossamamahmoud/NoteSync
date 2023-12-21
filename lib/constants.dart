import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes/models/note_model.dart';

const kPrimaryColor = Color(0xff62FCD7);
const kNotesBox = "Notes_Box";
List<Color> kColors = const [
  Color(0xff0FA3B1),
  Color(0xff62C3D6),
  Color(0xffB5E2FA),
  Color(0xffEDDEA4),
  Color(0xffF2BF8B),
  Color(0xffFAB896),
  Color(0xffF7A072),
];

ThemeData buildDarkThemeData() {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
  );
}

void showNoNotesSnackBar(
    BuildContext context, List<NoteModel> notes, int index) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color(
        notes[index].color,
      ),
      content: Text(
        '${notes[index].title} deleted',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
          letterSpacing: 1.5,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 3,
      duration: const Duration(seconds: 2),
      padding: const EdgeInsets.all(
        16,
      ),
    ),
  );
}

SnackBar buildDeleteNoteSnackBar(NoteModel note) {
  return SnackBar(
    backgroundColor: Color(
      note.color,
    ),
    content: Text(
      '${note.title.trim()} deleted',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
        letterSpacing: 1.5,
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 3,
    duration: const Duration(seconds: 2),
    padding: const EdgeInsets.all(16),
  );
}

ThemeData buildThemeLightData() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.red,
      systemNavigationBarColor: Colors.redAccent,
    )),
    brightness: Brightness.light,
    bottomSheetTheme: const BottomSheetThemeData(
      clipBehavior: Clip.hardEdge,
      shadowColor: Colors.white10,
    ),
    fontFamily: 'Poppins',
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(
      color: Colors.black,
    )),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
            enableFeedback: true,
            backgroundColor: MaterialStatePropertyAll<Color>(Color(Colors.black
                .withOpacity(
                  0.05,
                )
                .value)))),
  );
}
