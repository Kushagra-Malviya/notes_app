import 'package:flutter/material.dart';
import 'package:notes_app/services/firestore.dart';

class SecondRoute extends StatelessWidget {
  final String docID;
  final TextEditingController textController1 =
      TextEditingController(text: "Title");
  final TextEditingController textController2 =
      TextEditingController(text: "Content");
  final FirestoreService firestoreService = FirestoreService();

  SecondRoute({super.key, this.docID = ''});
  SecondRoute.update(this.docID, String title, String content, {super.key}) {
    textController1.text = title;
    textController2.text = content;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Note'),
          leading: IconButton(
              onPressed: () {
                if (docID == '') {
                  firestoreService.addNote(
                      textController1.text, textController2.text);
                } else {
                  firestoreService.updateNote(
                      docID, textController1.text, textController2.text);
                }
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: textController1,
              ),
              TextFormField(
                controller: textController2,
                maxLines: null,
              )
            ],
          ),
        )
        //Center(
        //child: ElevatedButton(
        //onPressed: () {
        //Navigator.pop(context);
        //},
        //child: const Text('Go back!'),
        //),
        //),
        );
  }
}
