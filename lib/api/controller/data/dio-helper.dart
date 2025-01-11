import 'package:dio/dio.dart';


abstract class DioHelper{
  Future<Response>postData({required String url, String?token,dynamic data});
  Future<Response>putData({required String url, String?token,dynamic data});
  Future<Response>getData({required String url, String?token,dynamic data});
  Future<Response>deleteData({required String url, String?token});

}

class DioImplementation extends DioHelper{

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2',
      queryParameters: {},
      validateStatus: (statusCode){
        if(statusCode ==null){
          return false;
        }
        if(statusCode ==422){
          return true;
        }else{
          return statusCode >=200 && statusCode<300;
        }
      }
    )
  );
  @override
  Future<Response> deleteData({required String url, String? token}) async{
    dio.options.headers = {
     
    };
    return await dio.delete(url,queryParameters: {});
  }

  @override
  Future<Response> getData({required String url, String? token, data}) async{
    dio.options.headers = {
      'Accept':'application/json'
    };
    return await dio.get(url,queryParameters: {});
  }

  @override
  Future<Response> postData({required String url, String? token, data}) async{
    dio.options.headers = {
      'Accept':'application/json',
      'Content-Type':'application/json'
    };
    return await dio.post(url,queryParameters: {},
    data: data
    );
  }

  @override
  Future<Response> putData({required String url, String? token, data}) async{
    dio.options.headers = {
      'Accept':'application/json',
      'Content-Type':'application/json'
    };
    return await dio.post(url,queryParameters: {},
    data: data
    );
  }

}