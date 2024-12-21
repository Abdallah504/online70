

import 'package:hive/hive.dart';
part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact extends HiveObject{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  String? imagePath;

  Contact({required this.title,required this.phone, required this.imagePath});
}