import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/pages/login.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';
//*La pantalla de la bienvenida
class Intro extends StatelessWidget {
  UsuariosSerivices usuariosServices = new UsuariosSerivices();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: scaffoldKey,
      backgroundColor: const Color(0xFFFDF4F5),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Center(
                child: Image.asset(
                  'assets/images/logo-intro.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              const SizedBox(
                  height:
                      20), // Agrega un espacio de 20px entre la imagen y el texto
              const Text(
                '¡Bienvenido a Match Coffee!',
                textAlign: TextAlign.center, // Centra horizontalmente el texto
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                  height:
                      10), // Agrega un espacio de 10px entre el texto y el resto de los elementos
              const Text(
                'Un espacio para amantes del café y las buenas conversaciones',
                textAlign: TextAlign.center, // Centra horizontalmente el texto
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.20), // Agrega un espacio de 20px entre el texto y el botón
              ElevatedButton(
                onPressed: () {
                  Get.to(Login());
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFE24E59),
                  minimumSize: Size(300, 50),
                  padding: EdgeInsets.symmetric(vertical: 26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        16), // Cambia el valor de 20 según el radio que desees
                  ),
                ),
                child: const Text('Seguir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
