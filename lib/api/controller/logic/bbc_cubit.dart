import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:online70/api/model/bbc-model.dart';
import 'package:online70/api/model/trump-model.dart';

import '../data/repo.dart';







class BbcCubit extends Cubit<BbcState> {
  BbcCubit(this.reporesetory) : super(BbcInitial());
  BbcModel? bbcModel;
TrumpModel?trumpModel;
final Reporesetory reporesetory;



 final  url = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a081436a7034494a92c8920802ecd853';
 final urlTrump = 'https://newsapi.org/v2/top-headlines?q=trump&apiKey=a081436a7034494a92c8920802ecd853';


 Future<void>gettingNews(context)async{
   try{
   return await reporesetory.getData().then((v){
       if(v !=null){
         bbcModel = BbcModel.fromJson(v.data);
         emit(DataReach());
       }else{
         print('no data');
       }
     });
   }catch(e){
     print(e);
     var Snk  = SnackBar(content: Text('No Data Found'));
     ScaffoldMessenger.of(context).showSnackBar(Snk);
   }

 }
 //  Future<List<NewsModel>>gettingTrump()async{
 //    try{
 //      final responsing = await http.get(Uri.parse(url));
 //      final response = await http.get(Uri.parse(urlTrump));
 //      if(response.statusCode==200 && responsing.statusCode==200){
 //       final List<dynamic>data1 = json.decode(responsing.body);
 //       final List<dynamic>data2 = json.decode(response.body);
 //       final List<NewsModel> result1 = data1.map((value)=>NewsModel.fromJson(value.body['articles'])).toList();
 //       final List<NewsModel> result2 = data2.map((v)=>NewsModel.fromJson(v.body['articles'])).toList();
 //
 //        return [...result1,...result2];
 //      }else{
 //        throw Exception('Failed to get data');
 //      }
 //
 //      // if(response.statusCode ==200){
 //      //   final data = jsonDecode(response.body);
 //      //   bbcModel = BbcModel.fromJson(data);
 //      //   emit(DataTrump());
 //      // }
 //    }catch(e){
 //      print(e);
 //      return [];
 //      // var Snk  = SnackBar(content: Text('No Data Found'));
 //      // ScaffoldMessenger.of(context).showSnackBar(Snk);
 //    }
 //  }

}
