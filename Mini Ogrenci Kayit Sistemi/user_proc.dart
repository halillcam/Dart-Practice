import 'dart:io';

import 'package:ogrenci_kayit/methods/student_methods.dart';

class UserProc {
  StudentMethods studentMethods = StudentMethods();

  String? fullName;
  int? age;
  String? phoneNumber;

  int? number;

  Future<void> delay({String text = "Kontroller Sağlanıyor ..."}) async {
    print(text);
    await Future.delayed(Duration(seconds: 2));
  }

  // Add Student

  Future<void> addStudent() async {
    print("Öğrencinin adı ve Soyadı : ");
    fullName = stdin.readLineSync();

    print("Öğrencin yaşı : ");
    age = int.tryParse(stdin.readLineSync()!);

    print("Telefon numarası");
    phoneNumber = stdin.readLineSync();

    await delay();
    studentMethods.addStudent(fullName, age, phoneNumber);
  }

  // update student

  Future<void> updateStudent() async {
    print("Öğrencinin adı ve Soyadı : ");
    fullName = stdin.readLineSync();

    await delay();

    if (studentMethods.checkStudent(fullName) == true) {
      print("Öğrencin yaşı : ");
      age = int.tryParse(stdin.readLineSync()!);

      print("Telefon numarası");
      phoneNumber = stdin.readLineSync();

      await delay();

      studentMethods.updateStudent(fullName, age, phoneNumber);
    }
    return;
  }

  // delete student

  Future<void> deleteStudent() async {
    print("Öğrencinin adı ve Soyadı : ");
    fullName = stdin.readLineSync();
    await delay();
    studentMethods.deleteStudent(fullName);
  }

  // check Student

  Future<void> checkStudent() async {
    print("Öğrencinin adı ve Soyadı : ");
    fullName = stdin.readLineSync();

    await delay();
    studentMethods.checkStudent(fullName);
  }

  // list student

  Future<void> showStudents() async {
    await delay();
    studentMethods.showStudents();
  }

  // proc

  Future<void> proc() async {
    while (true) {
      print("#######  Ogrenci kayit Sistemi ! #######");
      print("");
      print("1- Ogrenci Ekle");
      print("2- Ogrenci Güncelle");
      print("3- Ogrenci Sil");
      print("4- Ogrenci kontrol et");
      print("5- Kayıtlı tüm öğrencileri göster");
      print("99- Cikis ");

      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          await addStudent();
          break;

        case 2:
          await updateStudent();
          break;

        case 3:
          await deleteStudent();
          break;

        case 4:
          await checkStudent();
          break;

        case 5:
          await showStudents();
          break;

        case 99:
          return;

        default:
          print("Hatali secim !");
          break;
      }
    }
  }
}
