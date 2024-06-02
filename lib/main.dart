import 'package:flutter/material.dart';
import 'package:auroth_notes/pages/note_page.dart';
import 'package:auroth_notes/usecase/note_usecase.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';


void main() async {
  await Hive.initFlutter();

  await Hive.openBox('notesBox');
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteUsecase(),
        )
      ],
      child: const MaterialApp(
        color: Colors.blue,
        debugShowCheckedModeBanner: false,
        home: NotePage(),
      ),
    );
  }
}