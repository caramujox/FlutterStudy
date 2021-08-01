import 'package:flutter_modular/flutter_modular.dart';
import 'package:study_modular/app/modules/bas/bas_module.dart';


// ignore: must_be_immutable
class AppModule extends Module {

  @override
  List<Module>  imports = [
    BasModule(),
  ];

  @override
  final List<Bind> binds = [
    Bind.instance<String>('caio'),

  ];

  @override
  final List<ModularRoute> routes = [

  ];  

}
