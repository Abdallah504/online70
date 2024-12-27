import 'package:flutter/material.dart';
import 'package:online70/logic/data/sql-db.dart';
import 'package:online70/model/note-model.dart';
import 'package:online70/screens/note-detail.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  SqlDB sqlDB = SqlDB();
  List<Note>notes = [];

  @override
  void initState() {
    // TODO: implement initState
    loadNotes();
    super.initState();
  }



  loadNotes()async{
    var response = await sqlDB.readData("SELECT * FROM notes");
    setState(() {
      notes = response.map((xyz)=> Note.fromMap(xyz)).toList();
      // List<Map<String,dynamic>> =>  Note
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Note App',style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context , index){
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteDetail(note: notes[index],))).then((v){
                  loadNotes();
                });
              },
              title: Text(notes[index].title.toString()),
              subtitle: Text(notes[index].subtitle.toString()),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteDetail())).then((v){
            loadNotes();
          });
        },
      child: Center(
        child: Icon(Icons.add,color: Colors.white,),
      ),
      ),
    );
  }
}
