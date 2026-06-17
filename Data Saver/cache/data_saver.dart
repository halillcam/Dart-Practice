import 'dart:convert';
import 'dart:io';

class DataSaver {
  // database.json Proje ana dizini pathinde :
  File localDB = File('C:/Users/m0020/OneDrive/Desktop/dart_pratiklerim/data_saver/database.json');

  // checkFile

  void checkFile() {
    if (!localDB.existsSync()) {
      print("DB bulunamadı");
      return;
    }
  }

  // save Data

  void saveData(String? key, String? value) {
    if (key == null || value == null) return;

    Map<String, dynamic> existingData = {};

    if (localDB.existsSync()) {
      String fileContent = localDB.readAsStringSync();
      if (fileContent.isNotEmpty) {
        existingData = jsonDecode(fileContent);
      }
    }
    existingData[key] = value;

    String myData = jsonEncode(existingData);

    localDB.writeAsStringSync(myData);
  }

  // get data

  void getData(String? key) {
    if (key == null) {
      return;
    }
    checkFile();
    String fileContent = localDB.readAsStringSync();
    Map<String, dynamic> parsedData = jsonDecode(fileContent);

    print("Veri : ${parsedData[key]}");
  }
}
