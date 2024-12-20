import 'package:flutter/material.dart';
import 'package:online70/logic/sql-db.dart';

import '../model/note-model.dart';

class NoteDetail extends StatefulWidget {
   NoteDetail({super.key, this.note});
  final Note? note;

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  SqlDB sqlDB = SqlDB();
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  void initState() {
    if(widget.note !=null){
      titleController.text = widget.note!.title ??'';
      subtitleController.text = widget.note!.subtitle ??'';
      descController.text = widget.note!.description ??'';
    }
    super.initState();
  }

  saveNote()async{
    if(titleController.text.isNotEmpty && subtitleController.text.isNotEmpty && descController.text.isNotEmpty){
      if(widget.note ==null){
        await sqlDB.insertData("INSERT INTO notes (title,subtitle,description) VALUES ('${titleController.text}','${subtitleController.text}','${descController.text}')");
      }else{
        await sqlDB.updateData("UPDATE notes SET title = '${titleController.text}', subtitle = '${subtitleController.text}', description = '${descController.text}' WHERE id = ${widget.note!.id}");
      }

    }
    Navigator.pop(context);
  }

  deleteNote()async{
    if(widget.note !=null){
      await sqlDB.deleteData("DELETE FROM notes WHERE ID = ${widget.note!.id}");
    }
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Note Detail',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(onPressed: deleteNote, icon: Icon(Icons.delete,color: Colors.red,))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                helperText: 'Title'
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                  helperText: 'Subtitle'
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                  helperText: 'Description'
              ),
            ),
            SizedBox(height: 10,),

            ElevatedButton(onPressed: saveNote, child: Center(child: Text('Submit'),))
          ],
        ),
      ),
    );
  }
}
