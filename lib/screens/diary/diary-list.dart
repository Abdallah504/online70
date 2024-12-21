import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../model/diary.dart';
import '../../model/note-model.dart';
import 'diary-detail.dart';

class DiaryList extends StatefulWidget {
  const DiaryList({super.key});

  @override
  State<DiaryList> createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  final Box<Diary> diaryBox = Hive.box<Diary>('diary');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diary')),
      body: ValueListenableBuilder(
        valueListenable: diaryBox.listenable(),
        builder: (context, Box<Diary> box, _) {
          if (box.values.isEmpty) {
            return Center(child: Text('No entries yet.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final data = box.getAt(index);
              return ListTile(
                title: Text(data!.title.toString()),
                subtitle: Text(data.content.toString()),
                trailing: IconButton(onPressed: (){
                  box.deleteAt(index);
                }, icon: Icon(Icons.delete,color: Colors.red,)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiaryDetail(data: data,),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DiaryDetail()),
          );
        },
      ),
    );
  }
}
