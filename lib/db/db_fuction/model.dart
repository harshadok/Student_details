import 'package:hive_flutter/hive_flutter.dart';
//import 'lib.g.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String nam;
  @HiveField(4)
  final String adisor;
  @HiveField(5)
  final String image;

  StudentModel({
      this.id,
    required this.name,
    required this.age,
    required this.nam,
    required this.adisor,
    required this.image
  
  });
}
