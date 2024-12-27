


import 'package:flutter/material.dart';
import 'package:online70/logic/data/cache-helper.dart';

class MainAppProvider extends ChangeNotifier{
  int result = 0;
  int? x;
  var cach = CacheHelper();

  Future<void>Increment()async{
    result++;
    await cach.setData(key: 'result', value: result);
    notifyListeners();
  }

  Future<void>Decrement()async{
    if(result>0){
      result--;
      await cach.setData(key: 'result', value: result);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void>getDataResult()async{

    x= await cach.getData(key: 'result');
    if(x!=null){
      result = x!;
      notifyListeners();
    }
    notifyListeners();
  }
}