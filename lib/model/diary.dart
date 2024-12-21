

import 'package:hive/hive.dart';
part 'diary.g.dart';

@HiveType(typeId: 0)
class Diary extends HiveObject{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? content;

  Diary({required this.title,required this.content});
}