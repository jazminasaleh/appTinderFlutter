import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/paginas/login.dart';
import 'package:matchcoffeeapp/paginas/segundopasor.dart';
import 'package:provider/provider.dart';

import '../provider/usuarios_provider.dart';

class Registro extends StatelessWidget {
  const Registro();

  @override
  Widget build(BuildContext context) {
    final usuariosProvier = Provider.of<UsariosProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white, // agregar esta línea
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 140,
                    ),
                  ),
                  SizedBox(height: 40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Registrate',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('Botón 1 presionado');
                          },
                          child: Text(
                            'FACEBOOK',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF3E6AB2), // Nuevo color de texto
                              fontWeight: FontWeight
                                  .bold, // agregando el fontWeight bold
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            backgroundColor: Colors
                                .white, // Cambiar el color de fondo a blanco
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                bottomLeft: Radius.circular(18),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 0), //eliminar el espacio entre los botones
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('Botón 2 presionado');
                          },
                          child: Text(
                            'GOOGLE',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF39A751), // Nuevo color de texto
                              fontWeight: FontWeight
                                  .bold, // agregando el fontWeight bold
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 30),
                            backgroundColor: Colors
                                .white, // Cambiar el color de fondo a blanco
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(18),
                                bottomRight: Radius.circular(18),
                                bottomLeft: Radius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.grey, // color del label
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Color(0xFFFCCED1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Color(0xFFE24E59)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Color(0xFFFCCED1)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      ),
                      onChanged: (value) => usuariosProvier.email = value,
                      validator: (value) {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = new RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                            ? null
                            : 'El valor ingresado no se ve como un correo';
                      }),
                  SizedBox(height: 40),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                        color: Colors.grey, // color del label
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Color(0xFFFCCED1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Color(0xFFE24E59)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: Color(0xFFFCCED1)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    ),
                    onChanged: (value) => usuariosProvier.password = value,
                      validator: (value) {
                        String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExp = new RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                          ? null
                          : 'El valor ingresado no se ve como una contraseña';
                      },
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFE24E59), //color de fondo
                        padding: EdgeInsets.symmetric(vertical: 26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ), //aumento del padding
                      ),
                      onPressed: () {
                        Get.to(Segundopasor());
                        print('Botón Continuar presionado');
                      },
                      child: Text(
                        'Continuar',
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Login()); //navegar a la nueva página
                      },
                      child: Text(
                        '¿Ya tienes cuenta? Iniciar sesión',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
