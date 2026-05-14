import 'package:mini_atm/datas/user_datas.dart';
import 'package:mini_atm/models/user_model.dart';

class UserMethods {
  UserModel? currentUser;

  UserDatas datas = UserDatas();

  bool _isSign = false;

  // Giriş işlemi
  void signIn(int? cardNumber, String? passwd) {
    if (cardNumber == null || passwd == null) {
      print("Lütfen boş alan bırakmayınız");
      return;
    }

    checkUsers(cardNumber, passwd);
  }

  // Kullanıcı kontrolü
  void checkUsers(int cardNumber, String passwd) {
    for (int i = 0; i < datas.users.length; i++) {
      if (cardNumber == datas.users[i].cardNumber && passwd == datas.users[i].passwd) {
        currentUser = datas.users[i];

        _isSign = true;

        print("Hoşgeldiniz ${currentUser?.name}");

        return;
      }
    }

    print("Kart numarası veya şifre hatalı");
  }

  // Bakiye görüntüleme
  void checkMoney() {
    if (_isSign == false || currentUser == null) {
      print("Lütfen giriş yapınız");
      return;
    }

    print("Güncel bakiye : ${currentUser?.userMoney} TL");
  }

  // Para yatırma
  void addMoney(int money) {
    if (_isSign == false || currentUser == null) {
      print("Lütfen giriş yapınız");
      return;
    }

    if (money <= 0) {
      print("Geçerli bir miktar giriniz");
      return;
    }

    currentUser!.userMoney = currentUser!.userMoney! + money;

    print("Para yatırıldı. Güncel bakiye : ${currentUser?.userMoney} TL");
  }

  // Para çekme
  void withdrawMoney(int money) {
    if (_isSign == false || currentUser == null) {
      print("Lütfen giriş yapınız");
      return;
    }
    if (money <= 0) {
      print("Geçerli bir miktar giriniz");
      return;
    }
    if (money > currentUser!.userMoney!) {
      print("Yetersiz bakiye");
      return;
    }

    currentUser!.userMoney = currentUser!.userMoney! - money;

    print("Para çekildi. Güncel bakiye : ${currentUser?.userMoney} TL");
  }
}
