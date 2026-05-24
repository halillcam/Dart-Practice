import 'dart:io';

import 'package:mini_user_management/auth/auth_methods.dart';

class AuthProc {
  AuthMethods authMethods = AuthMethods();
  bool isLogin = false;

  String? userName;
  String? password;

  String? fullName;
  String? category;

  int? number;

  Future<void> delay(String text) async {
    print(text);
    await Future.delayed(Duration(seconds: 2));
  }

  // admin login
  Future<bool> login() async {
    print("Username : ");
    userName = stdin.readLineSync();
    print("password : ");
    password = stdin.readLineSync();
    await delay("Kontroller Sağlanıyor ...");

    isLogin = authMethods.login(userName, password);

    return isLogin;
  }

  // add User
  Future<void> addUser() async {
    print("Enter user's fullname : ");
    fullName = stdin.readLineSync();

    print("Enter user's Category : ");
    category = stdin.readLineSync();

    await delay("Kontroller Sağlanıyor ...");

    authMethods.addUser(fullName, category);
  }

  // delete user

  Future<void> deleteUser() async {
    print("Enter user full name :");
    fullName = stdin.readLineSync();
    await delay("Kontroller Sağlanıyor ...");
    authMethods.deleteUser(fullName);
  }

  //update user
  Future<void> updateUser() async {
    await delay("Kontroller Sağlanıyor ...");
    if (authMethods.isUserEmpty()) {
      print("Sistemde hiç kullanıcı yok!");
      return;
    }
    print("Kullanıcılar Bulundu");
    await listUsers();
    print("Enter fullname : ");
    fullName = stdin.readLineSync();

    print("Enter new category : ");
    category = stdin.readLineSync();

    await delay("Kontroller Sağlanıyor ...");

    authMethods.updateUser(fullName, category);
  }

  // list user

  Future<void> listUsers() async {
    await delay("Kontroller sağlanıyor ...");
    authMethods.listUsers();
  }

  // check user

  Future<void> checkUser() async {
    if (authMethods.isUserEmpty() == true) {
      return;
    } else {
      print("Enter fullname : ");
      fullName = stdin.readLineSync();
      await delay("Kontroller Sağlanıyor ...");
      authMethods.checkUser(fullName);
    }
  }

  // process

  Future<void> proc() async {
    await login();

    if (isLogin == true) {
      while (true) {
        print("1 - Add user");
        print("2 - delete user");
        print("3 - update user");
        print("4 - List user");
        print("5 - check user");
        print("99 - Exit");

        number = int.tryParse(stdin.readLineSync()!);

        switch (number) {
          case 1:
            await addUser();
            break;
          case 2:
            await deleteUser();
            break;
          case 3:
            await updateUser();
            break;
          case 4:
            await listUsers();
            break;

          case 5:
            await checkUser();
            break;

          case 99:
            return;

          default:
            print("Geçersiz seçim");
            break;
        }
      }
    }
  }
}

void main(List<String> args) {
  AuthProc proc = AuthProc();
  proc.proc();
}
