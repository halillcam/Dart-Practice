import 'package:ogrenci_kayit/methods/methods.dart';
import 'package:ogrenci_kayit/models/student_model.dart';

class StudentMethods implements IMethods {
  List<StudentModel> students = [];

  StudentModel? student;

  @override
  StudentModel? addStudent(String? fullName, int? age, String? phoneNumber) {
    if (fullName == null || age == null || phoneNumber == null) {
      return null;
    }
    student = StudentModel(fullName: fullName, age: age, phoneNumber: phoneNumber);
    students.add(student!);

    print("Öğrenci Eklendi = $fullName, $age, $phoneNumber");

    return student;
  }

  @override
  StudentModel? deleteStudent(String? fullName) {
    if (fullName == null) {
      return null;
    }

    for (int i = 0; i < students.length; i++) {
      if (students[i].fullName == fullName) {
        student = students[i];

        students.remove(student);

        print("$fullName silindi");

        return student;
      }
    }

    print("Kayıtlarda $fullName isimli biri bulunmuyor");
    return null;
  }

  @override
  void showStudents() {
    if (students.isEmpty) {
      print("Kayıtlı Öğrenci bulunmuyor");
      return;
    }
    print("------ Kayıtlı Öğrenciler -------");
    for (int i = 0; i < students.length; i++) {
      print("${students[i].fullName}, ${students[i].age}, ${students[i].phoneNumber}");
    }
  }

  @override
  StudentModel? updateStudent(String? fullName, int? age, String? phoneNumber) {
    if (checkStudent(fullName) == true) {
      student?.fullName = fullName;
      student?.age = age;
      student?.phoneNumber = phoneNumber;

      print("Kullanıcı güncellendi $fullName, $age $phoneNumber");
      return student;
    }

    return null;
  }

  @override
  bool? checkStudent(String? fullName) {
    if (fullName == null) {
      print("Lütfen boş bırakmayınız !");
      return false;
    }
    for (int i = 0; i < students.length; i++) {
      if (fullName == students[i].fullName) {
        student = students[i];
        print(
          "Kullanıcı bulundu ! ${students[i].fullName}, ${students[i].age}, ${students[i].phoneNumber}",
        );
        return true;
      }
    }
    return false;
  }
}
