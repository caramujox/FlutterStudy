import 'package:clean_demo/app_widget.dart';
import 'package:clean_demo/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_demo/modules/search/external/datasources/github_datasource.dart';
import 'package:clean_demo/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class AppModule extends Module{


 @override
  List<Module>  imports = [];

  @override
  final List<Bind> binds = [
    Bind((i) => SearchByTextImpl(i())),
    Bind((i) => SearchRepositoryImpl(i())),
    Bind((i) => GitHubDataSource(i())),
    Bind((i)=> Dio())
  ];

  @override
  final List<ModularRoute> routes = [];  

  Widget get bootstrap => AppWidget();
}