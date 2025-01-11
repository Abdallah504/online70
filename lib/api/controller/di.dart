
import 'package:get_it/get_it.dart';
import 'package:online70/api/controller/data/dio-helper.dart';
import 'package:online70/api/controller/data/repo.dart';

import 'logic/bbc_cubit.dart';

GetIt di = GetIt.instance..allowReassignment=true;

Future init()async{
  di.registerFactory<DioHelper>(
      ()=>DioImplementation()
  );
  di.registerFactory<Reporesetory>(
      ()=>RepoImplementation(di<DioHelper>())
  );
  di.registerFactory<BbcCubit>(
      ()=>BbcCubit(di<Reporesetory>())
  );

}