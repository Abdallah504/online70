import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online70/logic/auth/auth_cubit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit,AuthState>(builder: (context,state){
      return Scaffold(
        appBar: AppBar(
          title: Text('Auth Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: auth.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black)
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: auth.passController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black)
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){
                auth.login();
              }, child: Text('Submit'))
            ],
          ),
        ),
      );
    }, listener: (context,state){});
  }
}
