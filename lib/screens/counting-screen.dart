import 'package:flutter/material.dart';
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
    return Consumer<MainAppProvider>(
        builder: (context ,provider, _){
          return Scaffold(
            backgroundColor: Colors.white,

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(provider.result.toString()),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        provider.Increment();
                      }, icon: Icon(Icons.add)),
                      SizedBox(width: 20,),
                      TextButton(onPressed: (){
                        provider.Decrement();
                      }, child: Text('-'))
                    ],
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
