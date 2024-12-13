import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences sharedPreferences;
  static Future<void> cacheIntialization ()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setData({required String key, required dynamic value}) async{
    if(value is String){
      return await sharedPreferences.setString(key, value);
    }
    if(value is int){
      return await sharedPreferences.setInt(key, value);
    }
    if(value is double){
      return await sharedPreferences.setDouble(key, value);
    }
    if(value is bool){
      return await sharedPreferences.setBool(key, value);
    }

    return false;

}

dynamic getData({required String key}){
    return sharedPreferences.get(key);
}

Future<bool> deleteData({required String key})async{
    return await sharedPreferences.remove(key);
}


}

//CRUD => set