import 'package:mini_atm/models/user_model.dart';

class UserDatas {
  List<UserModel> users = [
    UserModel(cardNumber: 1234, name: "Halil", passwd: "halil", userMoney: 50),
    UserModel(cardNumber: 1111, name: "Duygu", passwd: "duygu", userMoney: 70),
    UserModel(cardNumber: 1112, name: "Aleyna", passwd: "aleyna", userMoney: 60),
    UserModel(cardNumber: 1113, name: "Zeynep", passwd: "zeynep", userMoney: 35),
    UserModel(cardNumber: 1114, name: "Timucin", passwd: "timucin", userMoney: 500),
  ];
}
