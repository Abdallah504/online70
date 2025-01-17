import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online70/api/controller/di.dart';

import 'package:online70/api/view/screen/bbc-screen.dart';
import 'package:online70/logic/auth/auth_cubit.dart';
import 'package:online70/logic/counters/counters_bloc.dart';
import 'package:online70/logic/counting/counting_cubit.dart';
import 'package:online70/logic/data/cache-helper.dart';
import 'package:online70/logic/data/sql-db.dart';
import 'package:online70/logic/statemang/main-app-provider.dart';
import 'package:online70/model/contact.dart';
import 'package:online70/model/diary.dart';
import 'package:online70/screens/auth-screen.dart';
import 'package:online70/screens/contacts/contact-List.dart';
import 'package:online70/screens/counting-screen.dart';
import 'package:online70/screens/diary/diary-list.dart';
import 'package:online70/screens/login-screen.dart';
import 'package:online70/screens/map-screen.dart';
import 'package:online70/screens/new-screen.dart';
import 'package:online70/screens/note-list.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'api/controller/data/dio-helper.dart';
import 'package:easy_localization/easy_localization.dart';

import 'api/controller/logic/bbc_cubit.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await init();
  await CacheHelper.cacheIntialization();
  // SqlDB sqlDB = SqlDB();
  // await sqlDB.db;
  await Hive.initFlutter();
  //Hive.registerAdapter(DiaryAdapter());
  Hive.registerAdapter(ContactAdapter());
  //await Hive.openBox<Diary>('diary');
  await Hive.openBox<Contact>('contact');
  //await EasyLocalization.ensureInitialized();


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]).then((v){
    runApp(
      MyApp()
    );
  });


}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  // var cache = CacheHelper();
  // dynamic savedEmail;
  // dynamic savedPass;
  // @override
  // void initState() {
  //   savedEmail = cache.getData(key: 'email');
  //   savedPass = cache.getData(key: 'password');
  //   print('${savedEmail} , ${savedPass}' );
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> CountingCubit()),
      BlocProvider(create: (context)=> AuthCubit()),
      BlocProvider(create: (context)=> CountersBloc()),
    ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context ,child){
            return MaterialApp(
              title: 'Flutter Demo',
              // localizationsDelegates: context.localizationDelegates,
              // supportedLocales: context.supportedLocales,
              // locale: context.locale,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home:MapsScreen(),
            );
          },
        ),);
  }
}

class CountrScreen extends StatefulWidget {
  const CountrScreen({super.key});

  @override
  State<CountrScreen> createState() => _CountrScreenState();
}

class _CountrScreenState extends State<CountrScreen> {

  void login(){
    print('login successful');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
    drawer: Drawer(
      child: Column(
        children: [
          DrawerHeader(child:  Image.asset('assets/electro.png')),

          ListTile(
            onTap: (){},
            leading: Icon(Icons.home ,color: Colors.black,),
            title: Text('Home Screen',style: TextStyle(color: Colors.black),),
          ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.settings ,color: Colors.black,),
            title: Text('Settings Screen',style: TextStyle(color: Colors.black),),
          ),
        ],
      ),
    ),
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text('UI',style: TextStyle(color: Colors.black),),

    ),

    body: Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 500,
          margin: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)
            )
          ),
        ),

        Container(
          // height: 300,
          // width: 200,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),
                  topLeft: Radius.circular(15)
              )
          ),
        )


      ],
    ),
    ) ;
  }
}


// Center(
// child: SingleChildScrollView(
// child: ListView.builder(
// itemCount: 5,
// shrinkWrap: true,
// physics: BouncingScrollPhysics(),
// itemBuilder:(context,index){
// return Padding(
// padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// child: Container(
// height: 500,
// width: 100,
//
// // margin:EdgeInsets.all(10) ,
// // padding: EdgeInsets.all(50),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(15),
// border: Border.all(color: Colors.black)
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// CircleAvatar(
// radius: 30,foregroundColor: Colors.grey,child: Icon(Icons.person)
// ),
//
// OutlinedButton(onPressed: (){
// Fluttertoast.showToast(
// msg:'Container index = $index',
// toastLength: Toast.LENGTH_SHORT,
// textColor: Colors.white,
// backgroundColor: Colors.black
// );
// }, child: Text('Continer index'))
// ],
//
// ),
// ),
// );
// } )
// )
// )






















// snakbar

// OutlinedButton(onPressed: (){
// setState(() {
// var snak = SnackBar(content: Text('Container index  = $index',
// style: TextStyle(color: Colors.white),
// ), backgroundColor: Colors.black,);
// ScaffoldMessenger.of(context).showSnackBar(snak);
// });
// }, child: Text('Continer index'))

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// // Container(
// //   height: 100,
// //   width: 100,
// //   decoration: BoxDecoration(
// //     color: Colors.black,
// //     borderRadius: BorderRadius.circular(100)
// //   ),
// // ),
// //
// // SizedBox(height: 20,),
//
// CircleAvatar(
// radius: 105,
// backgroundColor: Colors.black,
// child: CircleAvatar(
// radius: 100,
// backgroundColor: Colors.white,
//
//
// child:
// Container(
// height: 100,
// width: 170,
// clipBehavior: Clip.antiAliasWithSaveLayer,
// decoration: BoxDecoration(
// color: Colors.white
// ),
// child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqO8L_ErFWU25ZswIrPYuEweSpUqsEEWGMIQ&s',
// fit: BoxFit.fill,
// ),
// )
// ,
// ),
// ),
//
// SizedBox(height: 10,),
// Card(
// elevation: 10,
// margin: EdgeInsets.all(10),
//
// shadowColor: Colors.grey,
// child: Container(
// height: 200,
// width: 200,
// color: Colors.red,
// child: Icon(Icons.ac_unit,color: Colors.white,),
// ),
// ),
//
//
// ],
// ),



// ListView(
// scrollDirection: Axis.horizontal,
// children: [
// Container(
// height: 100,
// width: 100,
// color: Colors.green,
// ),
// Container(
// height: 100,
// width: 100,
// color: Colors.red,
// ),
// Container(
// height: 100,
// width: 100,
// color: Colors.black,
// ),
//
// ],
// ),