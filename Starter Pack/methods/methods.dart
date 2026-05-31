import 'package:starter_pack/Mock%20Data/app_datas.dart';

class Methods {
  // Show Apps
  AppDatas appDatas = AppDatas();

  void showApps() {
    for (var category in appDatas.apps()) {
      print("\n ${category.categoryName}");

      for (var app in category.apps!) {
        print("   • ${app.appName} - ${app.description}");
      }
    }
  }
}

void main(List<String> args) {
  Methods methods = Methods();
  methods.showApps();
}
