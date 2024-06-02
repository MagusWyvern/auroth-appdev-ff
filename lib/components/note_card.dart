import 'package:flutter/material.dart';
import 'package:auroth_notes/entity/note_entity.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:auroth_notes/usecase/note_usecase.dart';
import 'package:provider/provider.dart'; // For state management

// This takes a `NoteEntity` object as an input and display its title, content and creation date
class NoteCard extends StatefulWidget {
  final NoteEntity note;
  const NoteCard({super.key, required this.note});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    Future<void> _showNoteDialog(BuildContext ctx, NoteEntity note) async {
      TextEditingController titleController =
          TextEditingController(text: note.title);
      TextEditingController contentController =
          TextEditingController(text: note.content);
      return showDialog<void>(
        context: ctx,
        barrierDismissible: true, // User can tap outside of the dialogue to 'cancel'
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Edit Note'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                    controller: contentController,
                    decoration: const InputDecoration(
                      labelText: 'Content',
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  NoteUsecase provider =
                      Provider.of<NoteUsecase>(context, listen: false);
                  provider.deleteNote(note);

                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      contentController.text.isNotEmpty) {
                    NoteEntity newNote = NoteEntity(
                        title: titleController.text,
                        content: contentController.text,
                        createdAt: DateTime.now());

                    NoteUsecase provider =
                        Provider.of<NoteUsecase>(context, listen: false);
                    provider.updateNote(widget.note, newNote);
                  }
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

    return InkWell(
      onTap: () {
        _showNoteDialog(context, widget.note);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 5),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.note.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),

                    Text(
                      widget.note.content,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ],
                ),
              ),

              Text(
                DateFormat('EEE, dd/MM/yyyy').format(widget.note.createdAt),
                style: const TextStyle(color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic), 
              )

            ],
          ),
        ),
      ),
    );
  }
}