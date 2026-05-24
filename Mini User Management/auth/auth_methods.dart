import 'package:mini_user_management/auth/auth_data.dart';
import 'package:mini_user_management/user/user_model.dart';

class AuthMethods {
  AuthData authData = AuthData();
  List<UserModel> users = [];
  UserModel? user;

  // admin login
  bool login(String? userName, String? password) {
    if (userName == null || password == null) {
      print("Lütfen boş bırakmayınız!");
      return false;
    }

    if (userName == "admin" && password == "admin") {
      print("Giriş başarılı");
      return true;
    }

    print("Giriş başarısız");
    return false;
  }

  // add user

  void addUser(String? fullname, String? category) {
    if (fullname == null || category == null) {
      print("Lütfen boş bırakmayınız !");
    } else {
      for (int i = 0; i < users.length; i++) {
        if (users[i].fullName == fullname && users[i].category == category) {
          print("Bu kişi daha önce eklenmiş lütfen tekrardan deneyin !");
          return;
        }
      }
      user = UserModel(fullName: fullname, category: category);
      users.add(user!);
      print("Succesfull $fullname - $category");
    }
  }

  // list users

  void listUsers() {
    if (users.isEmpty) {
      print("Hiç kullanıcı yok");
      return;
    }

    for (int i = 0; i < users.length; i++) {
      print("${users[i].fullName} - ${users[i].category}");
    }
  }

  // delete user
  void deleteUser(String? fullname) {
    user = checkUser(fullname);

    if (user == null) return;

    users.remove(user);

    print("Kullanıcı silindi");
  }

  // update user

  void updateUser(String? fullname, String? newCategory) {
    user = checkUser(fullname);

    if (user == null || newCategory == null) {
      print("Güncelleme başarısız");
      return;
    }
    user!.category = newCategory;

    print("Güncellendi: ${user?.fullName} - ${user?.category}");
  }

  // check user
  UserModel? checkUser(String? fullname) {
    if (fullname == null) {
      print("Lütfen boş bırakmayınız!");
      return null;
    }

    for (int i = 0; i < users.length; i++) {
      if (users[i].fullName == fullname) {
        print("Kullanıcı bulundu - ${users[i].fullName}");
        return users[i];
      }
    }

    print("Kullanıcı bulunamadı");
    return null;
  }

  // check has user
  bool isUserEmpty() {
    if (users.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
