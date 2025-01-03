import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
  Future<void>getUserData()async{
    try{

    }catch(e){

    }
  }

  Future<void>login()async{

    try{
      print(emailController.text);
      print(passController.text);
      emit(lgoinSuccess());

    }catch(e){
      print(e);

    }
  }



}
