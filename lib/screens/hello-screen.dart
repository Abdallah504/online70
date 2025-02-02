import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:online70/main.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
                  if(context.locale.languageCode == 'en'){
                    context.setLocale(Locale('ar'));
                  }else{
                    context.setLocale(Locale('en'));
                  }
          },
      child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('hello'.tr()),
      ),
    );
  }
}
