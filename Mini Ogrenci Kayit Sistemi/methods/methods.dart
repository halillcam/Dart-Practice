import 'package:ogrenci_kayit/models/student_model.dart';

abstract class IMethods {
  StudentModel? addStudent(String? fullName, int? age, String? phoneNumber);
  StudentModel? deleteStudent(String? fullName);
  StudentModel? updateStudent(String? fullName, int? age, String? phoneNumber);
  void showStudents();
  bool? checkStudent(String? fullName);
}
