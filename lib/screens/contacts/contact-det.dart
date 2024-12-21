import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online70/model/contact.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ContactDetail extends StatefulWidget {
   ContactDetail({super.key,this.data});
  final Contact? data;
  @override
  State<ContactDetail> createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  TextEditingController titleController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  File? _imageFile;
  @override
  void initState() {
    if(widget.data !=null){
      titleController.text = widget.data!.title ??'';
      numberController.text = widget.data!.phone ??'';
      _imageFile = File(widget.data!.imagePath!);
    }
    super.initState();
  }
  Future<void>_pickImage()async{
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile !=null){
      final directory = await getApplicationDocumentsDirectory();
      final savedImage = await File(pickedFile.path).copy(
        join(directory.path, basename(pickedFile.path))
      );
      setState(() {
        _imageFile = savedImage;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile !=null?
                Image.file(_imageFile!,height: 50,width: 50,):
                Text('no image selected'),

            SizedBox(height: 10,),
            ElevatedButton(onPressed: _pickImage, child: Text('Pick image')),
            SizedBox(height: 10,),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title'
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                  hintText: 'Number'
              ),
            ),

            ElevatedButton(onPressed: (){

              if(titleController.text.isNotEmpty&& numberController.text.isNotEmpty && _imageFile!=null){
                final box = Hive.box<Contact>('contact');
                if(widget.data==null){
                  final newData = Contact(title: titleController.text, phone: numberController.text,imagePath: _imageFile?.path);
                  box.add(newData);
                  print(newData);
                  Navigator.pop(context);
                }else{
                  widget.data!
                    ..title = titleController.text
                    ..phone = numberController.text
                    ..imagePath = _imageFile?.path
                    ..save();
                  Navigator.pop(context);
                }

              }
            }, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
