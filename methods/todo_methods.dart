import 'package:to_do_app/mock%20data/to_do_data.dart';
import 'package:to_do_app/model/to_do_model.dart';

class TodoMethods {
  ToDoModel? model;
  ToDoData toDoData = ToDoData();

  // add todos
  ToDoModel addToDo(int id, String note) {
    model = ToDoModel(id: id, note: note);
    toDoData.todos.add(model!);
    return model!;
  }

  void showTodos() {
    for (int i = 0; i < toDoData.todos.length; i++) {
      print("id = ${toDoData.todos[i].id} - Note : ${toDoData.todos[i].note}");
    }
  }

  // delete todos

  ToDoModel? deleteTodos(int? id) {
    if (id == null) {
      return null;
    }

    for (int i = 0; i < toDoData.todos.length; i++) {
      if (toDoData.todos[i].id == id) {
        model = toDoData.todos[i];
        toDoData.todos.remove(model);

        print("Silindi ! $id");
        return model;
      }
    }
    print("Kayıtlarda böyle bir ID bulunmuyor !");
    return null;
  }

  // update todos

  ToDoModel? updateTodos(int? id, String? note) {
    if (id == null) {
      print("id boş olamaz !");
      return null;
    }
    for (int i = 0; i < toDoData.todos.length; i++) {
      if (toDoData.todos[i].id == id) {
        model = toDoData.todos[i];
        if (note != null) {
          model?.id = id;
          model?.note = note;
          return model;
        } else {
          print("Hata not boş bırakılamaz !");
          return null;
        }
      }
    }
    return null;
  }

  // search todo

  ToDoModel? searchTodo(String? note) {
    if (note == null) {
      print("Arama Kelimesi boş bırakılamaz !");
      return null;
    }
    for (int i = 0; i < toDoData.todos.length;) {
      if (toDoData.todos[i].note == note) {
        model = toDoData.todos[i];
        print("Not bulundu ! ${model?.note}");
        return model;
      } else {
        print("Not Bulunamadı");
        return null;
      }
    }
    return null;
  }
}
