import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/paginas/login.dart';

class Intro extends StatelessWidget {
  const Intro();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF4F5),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo-intro.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              SizedBox(height: 20), // Agrega un espacio de 20px entre la imagen y el texto
              Text(
                '¡Bienvenido a Match Coffee!',
                textAlign: TextAlign.center, // Centra horizontalmente el texto
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Agrega un espacio de 10px entre el texto y el resto de los elementos
              Text(
                'Un espacio para amantes del café y las buenas conversaciones',
                textAlign: TextAlign.center, // Centra horizontalmente el texto
              ),
              SizedBox(height: 20), // Agrega un espacio de 20px entre el texto y el botón
              ElevatedButton(
                onPressed: () {
                  Get.to(Login());
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFE24E59),
                  minimumSize: Size(300, 50),
                  padding: EdgeInsets.symmetric(vertical: 26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16), // Cambia el valor de 20 según el radio que desees
                  ),
                ),
                child: Text('Seguir'),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}

