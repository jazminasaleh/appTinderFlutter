import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:matchcoffeeapp/paginas/citas.dart';
import '../controladores/usuario.dart';

class Cafes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView( // Envuelve la columna principal con un SingleChildScrollView
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/images/calendario.png'),
                    width: 140,
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: 'Selecciona el Café para tu cita \n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5387A2),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Citas());
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/cafe1.png'),
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Citas());
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/cafe2.png'),
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Citas());
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/cafe3.png'),
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Citas());
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/cafe4.png'),
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}