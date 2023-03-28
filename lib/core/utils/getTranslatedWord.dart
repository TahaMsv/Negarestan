
import '../constants/my_json.dart';

String getKeyFromLanguageWords(String value) {

  // String languageKey = locale.languageCode + "_" + locale.countryCode.toString();
  String languageKey = "en_US";
  var map = MyJson.translatedWordKeys[languageKey];
  String key = map!.keys.firstWhere((k) => map[k] == value, orElse: () => "");
  return key == "" ? value : key;
}