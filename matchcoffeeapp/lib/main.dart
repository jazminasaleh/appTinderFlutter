import 'package:flutter/material.dart';
import 'package:matchcoffeeapp/paginas/actualizardatos.dart';
import 'package:matchcoffeeapp/paginas/intro.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/paginas/login.dart';
import 'package:matchcoffeeapp/paginas/segundopasor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:matchcoffeeapp/provider/usuarios_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  runApp(
    Estados()
  );
}

class Estados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsariosProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => Intro(),
      },
      
    );
  }
}
