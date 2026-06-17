import 'dart:io';

import 'package:data_saver/cache/data_saver.dart';

class UserProc {
  DataSaver saver = DataSaver();
  String? key;
  String? value;
  int? number;

  // delay

  Future<void> delay(String text) async {
    print(text);

    await Future.delayed(Duration(seconds: 2));
  }

  // saveData

  Future<void> saveData() async {
    print("Key : ");
    key = stdin.readLineSync();

    print("value : ");
    value = stdin.readLineSync();
    await delay("Kontroller sağlanıyor ... ");
    saver.saveData(key, value);
  }

  // get data

  Future<void> getData() async {
    print("Key : ");
    key = stdin.readLineSync();

    await delay("Kontroller sağlanıyor ... ");

    saver.getData(key);
  }

  Future<void> proc() async {
    while (true) {
      print("\n====== Data Saver =======");
      print("1 - Save data");
      print("2 - Get data");
      print("99 - Exit");

      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          await saveData();
          break;

        case 2:
          await getData();
          break;

        case 99:
          return;

        default:
          print("Error !");
          return;
      }
    }
  }
}
