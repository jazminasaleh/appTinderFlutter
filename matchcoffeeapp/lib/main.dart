import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:matchcoffeeapp/pages/intro.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/provider/usuarios_provider.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Estados());
}

class Estados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsariosProvider()),
        ChangeNotifierProvider(create: (_) => UsuariosSerivices()),
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
      theme: ThemeData(primaryColor: Colors.red),
    );
  }
}
