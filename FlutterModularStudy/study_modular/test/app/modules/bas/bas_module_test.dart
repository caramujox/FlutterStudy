import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_modular/app/modules/bas/bas_module.dart';
 
void main() {

  setUpAll(() {
    initModule(BasModule());
  });
}