
import 'localization.dart';
import 'package:get/get.dart';


String getTranslatedValues(String key) {
  return DemoLocalizations.of(Get.context!)!.getTranslatedValue(key)!;
}
