import 'dart:io';

import 'package:to_do_app/methods/todo_methods.dart';

class Userproc {
  TodoMethods methods = TodoMethods();

  int? id;
  String? note;

  // add toto

  void addTodo() {
    print("ID : ");
    id = int.tryParse(stdin.readLineSync()!);
    print("Note : ");
    note = stdin.readLineSync();
    if (id != null && note != null) {
      methods.addToDo(id!, note!);
      return;
    } else {
      print("Lütfen boş bırakma !");
      return;
    }
  }

  void showTodo() {
    print("- - - - Todos - - - - ");
    methods.showTodos();
  }

  // delete todo

  void deleteTodo() {
    print("ID : ");
    id = int.tryParse(stdin.readLineSync()!);
    if (id != null) {
      methods.deleteTodos(id!);
    } else {
      print("id bulunamadı !");
      return;
    }
  }

  // update todo

  void updateTodo() {
    print("ID : ");
    id = int.tryParse(stdin.readLineSync()!);
    print("Note : ");
    note = stdin.readLineSync();

    if (id != null && note != null) {
      methods.updateTodos(id!, note!);
    } else {
      print("hata ! update todo !");
      return;
    }
  }

  // search todo
  void searchTodo() {
    print("Enter the Search Note : ");
    note = stdin.readLineSync();

    if (note!.isNotEmpty) {
      methods.searchTodo(note!);
    } else {
      print("Hata search todo");
      return;
    }
  }

  int? number;

  void proc() {
    while (true) {
      print("1 - Todo ekle");
      print("2 - Tüm todo gör");
      print("3 - todo güncelle");
      print("4 - todo sil");
      print("5 - todo ara");

      print("99 - çıkış");

      print("Lütfen seçim yap");
      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          addTodo();
          break;
        case 2:
          showTodo();
          break;

        case 3:
          updateTodo();
          break;

        case 4:
          deleteTodo();
          break;
        case 5:
          searchTodo();
          break;

        case 99:
          print("Çıkış yapılıyor !");
          return;
        default:
          print("yanlıs secim");
          break;
      }
    }
  }
}

void main(List<String> args) {
  Userproc proc = Userproc();
  proc.proc();
}
