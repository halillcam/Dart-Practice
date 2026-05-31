import 'package:starter_pack/model/app_model.dart';
import 'package:starter_pack/model/category_model.dart';

class AppDatas {
  List<CategoryModel> apps() {
    return [
      CategoryModel(
        categoryName: "Social Media",
        apps: [
          AppModel(
            appName: "WhatsApp",
            packageName: "com.whatsapp",
            description: "Chatting app",
            url: "https://play.google.com/store/apps/details?id=com.whatsapp",
          ),
          AppModel(
            appName: "Instagram",
            packageName: "com.meta.instagram",
            description: "Chatting app",
            url: "https://play.google.com/store/apps/details?id=com.instagram.android",
          ),
        ],
      ),
      CategoryModel(
        categoryName: "Editing",
        apps: [
          AppModel(
            appName: "Capcut",
            packageName: "com.lemon.lvoverseas",
            description: "Editing",
            url: "https://play.google.com/store/apps/details?id=com.lemon.lvoverseas",
          ),
          AppModel(
            appName: "Canva",
            packageName: "com.canva.editor",
            description: "Chatting app",
            url: "https://play.google.com/store/apps/details?id=com.canva.editor",
          ),
        ],
      ),
      CategoryModel(
        categoryName: "Software",
        apps: [
          AppModel(
            appName: "Github",
            packageName: "com.github.android",
            description: "Software App",
            url: "https://play.google.com/store/apps/details?id=com.github.android",
          ),
          AppModel(
            appName: "Termux",
            packageName: "com.termux",
            description: "Software app",
            url: "https://play.google.com/store/apps/details?id=com.termux",
          ),
        ],
      ),
    ];
  }
}
