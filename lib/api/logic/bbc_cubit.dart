import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:online70/api/model/bbc-model.dart';
import 'package:online70/api/model/trump-model.dart';
part 'bbc_state.dart';

class BbcCubit extends Cubit<BbcState> {
  BbcCubit() : super(BbcInitial());
BbcModel? bbcModel;
TrumpModel?trumpModel;

 final  url = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a081436a7034494a92c8920802ecd853';
 final urlTrump = 'https://newsapi.org/v2/top-headlines?q=trump&apiKey=a081436a7034494a92c8920802ecd853';


 Future<void>gettingNews(context)async{
   try{
     final response = await http.get(Uri.parse(url));
     if(response.statusCode ==200){
       final data = jsonDecode(response.body);
       bbcModel = BbcModel.fromJson(data);
       emit(DataReach());
     }
   }catch(e){
     print(e);
     var Snk  = SnackBar(content: Text('No Data Found'));
     ScaffoldMessenger.of(context).showSnackBar(Snk);
   }
 }
  Future<void>gettingTrump(context)async{
    try{
      final response = await http.get(Uri.parse(urlTrump));
      if(response.statusCode ==200){
        final data = jsonDecode(response.body);
        trumpModel = TrumpModel.fromJson(data);
        emit(DataTrump());
      }
    }catch(e){
      print(e);
      var Snk  = SnackBar(content: Text('No Data Found'));
      ScaffoldMessenger.of(context).showSnackBar(Snk);
    }
  }

}
