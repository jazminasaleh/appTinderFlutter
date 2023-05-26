import 'package:flutter/material.dart';
import 'package:matchcoffeeapp/paginas/actualizardatos.dart';
import 'package:matchcoffeeapp/paginas/intro.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/paginas/login.dart';
import 'package:matchcoffeeapp/paginas/segundopasor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(GetMaterialApp(
    home: Intro(),
    debugShowCheckedModeBanner: false,
  ));
}
