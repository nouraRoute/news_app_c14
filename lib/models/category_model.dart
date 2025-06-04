import 'package:news_app_c14/common/assets/app_assets.dart';

enum CategoryType {
  sports,
  general,
  business,
  entertainment,
  health,
  science,
  technology;

  String getCategoryImage() {
    return AppAssets.generalImage;
  }

  String getCategoryTypeName() {
    return name.substring(0, 1).toUpperCase() + name.substring(1);
  }
}
