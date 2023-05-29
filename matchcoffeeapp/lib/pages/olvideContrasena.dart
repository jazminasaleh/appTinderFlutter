import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OlvideContrasena extends StatefulWidget {
  const OlvideContrasena({super.key});

  @override
  State<OlvideContrasena> createState() => _OlvideContrasenaState();
}

class _OlvideContrasenaState extends State<OlvideContrasena> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    void dispose() {
      _emailController.dispose();
      super.dispose();
    }

    Future passwordReset() async {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: _emailController.text.trim());
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                    'Por favor revisa tú correo, ya fue enviado un link, para el cambio de contraseña'),
              );
            });
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.message.toString()),
              );
            });
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Ingresa tú correo electrónico, y nosotros te enviaremos un link para que puedas hacer el cambio de la contraseña',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: TextFormField(
                    cursorColor: Colors.red,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      hintText: 'demo@gmail.com',
                      labelStyle: const TextStyle(
                        color: Colors.grey, // color del label
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        size: 23,
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color(0xFFFCCED1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color(0xFFE24E59)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color(0xFFFCCED1)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 20),
                    ),
                    onChanged: (value) => email = value,
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = new RegExp(pattern);
                      return regExp.hasMatch(value ?? '')
                          ? null
                          : 'El valor ingresado no se ve como un correo';
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFE24E59), //color de fondo
                        padding: const EdgeInsets.symmetric(vertical: 26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ), //aumento del padding
                      ),
                      onPressed: () async {
                        passwordReset();
                      },
                      child: const Text(
                        'Continuar',
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
