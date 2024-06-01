import 'package:flutter/material.dart';
import 'package:auroth_notes/entity/note_entity.dart';
import 'package:auroth_notes/usecase/hive_db.dart';

class NoteUsecase extends ChangeNotifier {
  final db = HiveDB();
  // This is where all notes are stored locally
  List<NoteEntity> allNotes = [];

  void initializeNotes() {
    allNotes = db.loadNotes();
  }

  // CRUD
  void addNote(NoteEntity note) {
    allNotes.add(note);
    db.saveNotes(allNotes);
    notifyListeners();
  }

  void deleteNote(NoteEntity note) {
    allNotes.remove(note);
    db.saveNotes(allNotes);
    notifyListeners();
  }

  void updateNote(NoteEntity oldNote, NoteEntity newNote) {
    int index = allNotes.indexOf(oldNote);
    if (index != -1) {
      allNotes[index] = newNote;
    }
    db.saveNotes(allNotes);
    notifyListeners();
  }
}