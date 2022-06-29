import 'package:database_saple/db/db_fuction/model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDb.add(value);
  value.id = _id;
  studentListNotifier.value.add(value);
  studentDb.put(value.id, value);
  studentListNotifier.notifyListeners();  
}

Future<void> getStudent() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deletestudent(int id) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  await studentDb.deleteAt(id);
  getStudent();
}

Future <void> editedItems(int index1, StudentModel value) async
{
 final studentDb= await Hive.openBox<StudentModel>('student_db');
   await studentDb.putAt(index1,value);
   getStudent();

}