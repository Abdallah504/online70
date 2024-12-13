import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive App',style: TextStyle(fontSize: 20.sp),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return Padding(padding: EdgeInsets.symmetric(horizontal: 10).r,
                    child: Container(
                      height: 170.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                      ),
                    ),
                    );

                  }),
            ),
            SizedBox(height: 5.h,),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTUVRLBKuNbmxzQBsPEBkVBsnA_LKK4xpZJg&s'),
                    title: Text('Bmw',style: TextStyle(fontSize: 17.sp),),
                    subtitle: Text('2024',style: TextStyle(fontSize: 14.sp),),
                  );
                })
          ],
        ),
      ),
    );
  }
}
