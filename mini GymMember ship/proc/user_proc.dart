import 'dart:io';

import 'package:mini_spor_salonu_uyelik_sistemi/methods/member_methods.dart';

class UserProc {
  MemberMethods methods = MemberMethods();

  int? id;
  String? fullName;
  int? age;
  String? phoneNumber;
  String? membershipType;
  bool? isActive;
  String? state;

  // add member

  void addMember() {
    print("id : ");
    id = int.tryParse(stdin.readLineSync()!);
    print("Ad soyad : ");
    fullName = stdin.readLineSync();
    print("Yas : ");
    age = int.tryParse(stdin.readLineSync()!);
    print("Telefon : ");
    phoneNumber = stdin.readLineSync();
    print("Üyelik Tipi : ");
    membershipType = stdin.readLineSync();
    print("Aktif/pasif (true/false) : ");
    isActive = bool.tryParse(stdin.readLineSync()!);

    if (id == null ||
        fullName == null ||
        age == null ||
        phoneNumber == null ||
        membershipType == null ||
        isActive == null) {
      print("Lütfen boş bırakmayınız !");
      return;
    }
    methods.addMember(id!, fullName!, age!, phoneNumber!, membershipType!, isActive!);
    print("Üye Eklendi !");
    return;
  }

  // üye sil

  void deleteMember() {
    methods.showMembers();
    print("id : ");
    id = int.tryParse(stdin.readLineSync()!);
    if (id != null) {
      methods.deleteMember(id!);
      print("Silme İşlemi Başarılı !");
      return;
    }
    print("Silme İşlemi başarısız !");
    return;
  }

  // üye güncelle

  void updateMember() {
    methods.showMembers();
    print("id : ");
    id = int.tryParse(stdin.readLineSync()!);
    print("Ad soyad : ");
    fullName = stdin.readLineSync();
    print("Yas : ");
    age = int.tryParse(stdin.readLineSync()!);
    print("Telefon : ");
    phoneNumber = stdin.readLineSync();
    print("Üyelik Tipi : ");
    membershipType = stdin.readLineSync();
    print("Aktif/pasif (true/false) : ");
    isActive = bool.tryParse(stdin.readLineSync()!);

    if (id == null ||
        fullName == null ||
        age == null ||
        phoneNumber == null ||
        membershipType == null ||
        isActive == null) {
      print("Lütfen boş bırakmayınız !");
      return;
    }
    methods.updateMember(id!, fullName!, age!, phoneNumber!, membershipType!, isActive!);
    print("Üye güncellendi ! ");
    return;
  }

  // search member

  void searchMember() {
    print("Lütfen aramak istediğiniz ismi giriniz : ");
    fullName = stdin.readLineSync();
    final result = methods.searchMember(fullName!);
    if (result == null) {
      print("Bulunamadı !");
    } else {
      print("Üye bulundu: ${result.fullName}");
    }
  }

  // active/passive members

  void activePassive() {
    print("Aktif pasif arama yap (Active/Passive) : ");
    state = stdin.readLineSync();
    if (state == null) {
      print("Lütfen boş bırakmayınız !");
      return;
    }
    methods.activePassive(state!);
  }

  // üyeliği aktif pasif yap

  void changeActivity() {
    print("id : ");
    id = int.tryParse(stdin.readLineSync()!);
    if (id == null) {
      print("id boş bırakılamaz !");
      return;
    } else {
      print("Lütfen aktiflik durumunu giriniz ! true/false : ");
      isActive = bool.tryParse(stdin.readLineSync()!);

      if (isActive == null) {
        print("Lütfen true veya false giriniz!");
        return;
      }

      methods.changeActivity(id!, isActive!);
    }
  }

  // member type

  int? number;

  void proc() {
    while (true) {
      print("1 - Üye Ekle ");
      print("2 - Üye Sil");
      print("3 - Üye Güncelle");
      print("4 - Üye Ara ");
      print("5 - Tüm üyeleri gör");
      print("6 - Aktif/Pasif filtrele");
      print("7 - Üye Aktiflik durumunu değiştir ");
      print("99 - Çıkış");

      print("Lütfen Seçim yapınız ! : ");
      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          addMember();
          break;
        case 2:
          deleteMember();
          break;
        case 3:
          updateMember();
          break;
        case 4:
          searchMember();
          break;
        case 5:
          methods.showMembers();
          break;
        case 6:
          activePassive();
          break;

        case 7:
          changeActivity();
          break;

        case 99:
          return;

        default:
          print("Hatalı işlem !");
          break;
      }
    }
  }
}

void main() {
  UserProc proc = UserProc();
  proc.proc();
}
