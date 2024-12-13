import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BmwList extends StatefulWidget {
   BmwList({super.key , required this.title});
  String title;

  @override
  State<BmwList> createState() => _BmwListState();
}

class _BmwListState extends State<BmwList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTUVRLBKuNbmxzQBsPEBkVBsnA_LKK4xpZJg&s'),
      title: Text(widget.title.toString(),style: TextStyle(fontSize: 17.sp),),
      subtitle: Text('2024',style: TextStyle(fontSize: 14.sp),),
    );
  }
}
