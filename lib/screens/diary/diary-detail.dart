import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:online70/model/diary.dart';

class DiaryDetail extends StatefulWidget {
  final Diary? data;
   DiaryDetail({super.key,  this.data});

  @override
  State<DiaryDetail> createState() => _DiaryDetailState();
}

class _DiaryDetailState extends State<DiaryDetail> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    if(widget.data !=null){
      titleController.text = widget.data!.title ??'';
      contentController.text = widget.data!.content ??'';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: titleController,
          ),
          SizedBox(height: 10,),
          TextField(
            controller: contentController,
          ),

          ElevatedButton(onPressed: (){
            final box = Hive.box<Diary>('diary');
            if(titleController.text.isNotEmpty&& contentController.text.isNotEmpty){
              if(widget.data==null){
                final newData = Diary(title: titleController.text, content: contentController.text);
                box.add(newData);
              }else{
                widget.data!
                    ..title = titleController.text
                    ..content = contentController.text
                    ..save();
              }
              Navigator.pop(context);
            }
          }, child: Text('Submit'))
        ],
      ),
      ),
    );
  }
}
