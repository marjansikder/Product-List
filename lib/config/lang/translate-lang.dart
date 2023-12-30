import 'package:get/get.dart';

import 'eng-lang.dart';


class LangConfig extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': engLangMap,
  };
}