import 'dart:io';

import 'package:mini_atm/methods/user_methods.dart';

class UserProc {
  UserMethods methods = UserMethods();

  int? cardNumber;
  String? passwd;
  int? money;

  bool isLogin = false;

  Future<void> delay() async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> signInUser() async {
    print("X Bank ATM'sine Hoşgeldiniz");

    print("Kart numarası giriniz:");
    cardNumber = int.tryParse(stdin.readLineSync()!);

    print("Şifre giriniz:");
    passwd = stdin.readLineSync();

    print("Giriş kontrolü yapılıyor ...");
    await delay();

    methods.signIn(cardNumber, passwd);

    if (methods.currentUser != null) {
      isLogin = true;
      print("Giriş başarılı Panel e yönlendiriliyorsunuz !");
      await delay();
      secim();
    } else {
      print("Giriş başarısız");
    }
  }

  Future<void> secim() async {
    while (isLogin) {
      print("\n==== ATM MENU ====");
      print("1 - Para yatır");
      print("2 - Para çek");
      print("3 - Bakiye kontrol");
      print("99 - Çıkış");
      print("Seçim yapınız:");

      int? choice = int.tryParse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          print("Yatırılacak miktar:");

          money = int.tryParse(stdin.readLineSync()!);

          if (money != null) {
            print("Kontrol ediliyor ...");
            await delay();
            methods.addMoney(money!);
          }

          break;

        case 2:
          print("Çekilecek miktar:");
          money = int.tryParse(stdin.readLineSync()!);

          if (money != null) {
            print("Kontrol ediliyor ...");
            await delay();
            methods.withdrawMoney(money!);
          }

          break;

        case 3:
          print("Kontrol ediliyor ...");
          await delay();
          methods.checkMoney();
          break;

        case 99:
          print("ATM'den çıkış yapılıyor...");
          print("Kontrol ediliyor ...");
          await delay();
          isLogin = false;
          break;

        default:
          print("Hatalı seçim");
      }
    }
  }
}
