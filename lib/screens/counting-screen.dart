import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online70/logic/counters/counters_bloc.dart';
import 'package:online70/logic/counting/counting_cubit.dart';
import 'package:online70/logic/statemang/main-app-provider.dart';
import 'package:provider/provider.dart';

class CountingScreen extends StatefulWidget {
  const CountingScreen({super.key});

  @override
  State<CountingScreen> createState() => _CountingScreenState();
}

class _CountingScreenState extends State<CountingScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CountersBloc>();

  return BlocConsumer<CountersBloc,CountttttState>(builder: (context,state){
     return Scaffold(
       backgroundColor: Colors.white,

       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(state.value.toString()),

             SizedBox(height: 20.h,),
             Row(
               children: [
                 IconButton(onPressed: (){
                   bloc.add(IncrementEvent());
                 }, icon: Icon(Icons.add)),
                 SizedBox(width: 30.w,),
                 TextButton(onPressed: (){
                   bloc.add(DecrementEvent());
                 }, child: Text('-'))
               ],
             ),

             SizedBox(height: 10,),

            state is InreasingState? Container(
               height: 100.h,
               width: MediaQuery.of(context).size.width/2,
               color: Colors.red,
             ):
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width/2,
              color: Colors.blue,
            )
           ],
         ),
       ),
     );
   }, listener: (context,state){});
  }
}
// Bloc Builder = > Build ui depending state

// Bloc listner => Listen state

// Bloc Consumer