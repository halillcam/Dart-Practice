import 'package:mini_spor_salonu_uyelik_sistemi/datas/member_data.dart';
import 'package:mini_spor_salonu_uyelik_sistemi/model/member_model.dart';

class MemberMethods {
  MemberData members = MemberData();

  // add Member

  MemberModel addMember(
    int id,
    String fullName,
    int age,
    String phoneNumber,
    String membershipType,
    bool isActive,
  ) {
    final MemberModel newMember = MemberModel(
      id: id,
      fullName: fullName,
      age: age,
      phoneNumber: phoneNumber,
      membershipType: membershipType,
      isActive: isActive,
    );
    members.memberData.add(newMember);
    return newMember;
  }

  // show Members

  void showMembers() {
    for (int i = 0; i < members.memberData.length; i++) {
      print(members.memberData[i]);
    }
  }

  // search member

  MemberModel? searchMember(String fullname) {
    for (int i = 0; i < members.memberData.length; i++) {
      final MemberModel member = members.memberData[i];
      if (member.fullName == fullname) {
        print(member.fullName);
        return member;
      }
    }
    return null;
  }

  // update member

  MemberModel? updateMember(
    int id,
    String fullName,
    int age,
    String phoneNumber,
    String membershipType,
    bool isActive,
  ) {
    for (int i = 0; i < members.memberData.length; i++) {
      final MemberModel member = members.memberData[i];

      if (member.id == id) {
        member.fullName = fullName;
        member.age = age;
        member.phoneNumber = phoneNumber;
        member.membershipType = membershipType;
        member.isActive = isActive;

        return member;
      }
    }

    return null;
  }
  // delete member

  void deleteMember(int id) {
    for (int i = 0; i < members.memberData.length; i++) {
      final MemberModel member = members.memberData[i];
      if (member.id == id) {
        members.memberData.remove(member);
        print("Kullanici silindi ! ${member.fullName}");
        return;
      }
    }
    return;
  }

  // üyeliği aktif pasif yap

  bool changeActivity(int id, bool isActive) {
    for (int i = 0; i < members.memberData.length; i++) {
      final MemberModel member = members.memberData[i];

      if (member.id == id) {
        member.isActive = isActive;
        return true;
      }
    }

    return false;
  }

  // active/passive members

  List<MemberModel> activePassive(String state) {
    final List<MemberModel> filteredMembers = [];

    for (int i = 0; i < members.memberData.length; i++) {
      final MemberModel member = members.memberData[i];

      if (state == "Active" && member.isActive == true) {
        filteredMembers.add(member);
      }

      if (state == "Passive" && member.isActive == false) {
        filteredMembers.add(member);
      }
    }

    return filteredMembers;
  }

  // member type

  List<MemberModel> memberType(String memberShipType) {
    final List<MemberModel> filteredMembers = [];

    for (int i = 0; i < members.memberData.length; i++) {
      final MemberModel member = members.memberData[i];

      if (member.membershipType == memberShipType) {
        filteredMembers.add(member);
      }
    }

    return filteredMembers;
  }
}
