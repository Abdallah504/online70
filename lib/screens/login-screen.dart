import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online70/logic/cache-helper.dart';
import 'package:online70/screens/new-screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var cache = CacheHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText:'email'
              ),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                  hintText:'password'
              ),
            ),
            SizedBox(height: 20.h,),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    cache.setData(key: 'email', value: emailController.text);
                    cache.setData(key: 'password', value: passController.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NewScreen()));
                  });
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
