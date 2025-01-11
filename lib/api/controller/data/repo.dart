import 'package:http/http.dart';
import 'package:online70/api/controller/data/dio-helper.dart';

import 'end-points.dart';

abstract class Reporesetory{
  Future<Response>getData();
  Future<Response>Login({required String email, required String password});
}

class RepoImplementation extends Reporesetory{
  final DioHelper dioHelper;
  RepoImplementation(this.dioHelper);

  @override
  Future<Response> getData() async{
      return await dioHelper?.getData(url: bbcNews);
  }

  @override
  Future<Response> Login({required String email, required String password}) async{
    return await dioHelper.postData(url: url, data: {

      'email':email,
      'password':password
    })
  }

}

