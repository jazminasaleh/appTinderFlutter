import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/pages/olvideContrasena.dart';
import 'package:matchcoffeeapp/pages/perfil.dart';
import 'package:matchcoffeeapp/pages/registro.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';
import 'package:provider/provider.dart';
import '../controladores/usuario.dart';
import '../provider/usuarios_provider.dart';
import '../services/auth_service.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Usuario usuario = Get.put(Usuario());
  UsuariosSerivices usuariosServices = new UsuariosSerivices();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final usuariosProvier = Provider.of<UsariosProvider>(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white, // agregar esta línea
      body: Padding(
        padding: EdgeInsets.all(20),
        child: GestureDetector(
          onTap: (){
             final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                //key: loginFormProvider.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                        width: 140,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              backgroundColor: Colors
                                  .white, // Cambiar el color de fondo a blanco
                              shape: const RoundedRectangleBorder(
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
                        const SizedBox(
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
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              backgroundColor: Colors
                                  .white, // Cambiar el color de fondo a blanco
                              shape: const RoundedRectangleBorder(
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: TextFormField(
                        key: Key("email"),
                        cursorColor: Colors.red,
                        controller: usuario.email,
                        keyboardType: TextInputType.emailAddress,
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
                            borderSide:
                                const BorderSide(color: Color(0xFFFCCED1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Color(0xFFE24E59)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Color(0xFFFCCED1)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                        ),
                        onChanged: (value) => usuariosProvier.email = value,
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
                    const SizedBox(height: 40),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: TextFormField(
                        cursorColor: Colors.red,
                        key: Key("contrasena"),
                        controller: usuario.contrasena,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          hintText: '******',
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 23,
                            color: Colors.red,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.grey, // color del label
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Color(0xFFFCCED1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Color(0xFFE24E59)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:
                                const BorderSide(color: Color(0xFFFCCED1)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                        ),
                        onChanged: (value) => usuariosProvier.password = value,
                        validator: (value) {
                          String pattern =
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        
                          RegExp regExp = new RegExp(pattern);
                          return regExp.hasMatch(value ?? '')
                              ? null
                              : 'El valor ingresado no se ve como una contraseña';
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(const OlvideContrasena()); //navegar a la nueva página
                          },
                          child: const Text(
                            'He olvidado mi contraseña',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
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
                          
                          String patternContrasena =
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regExp = new RegExp(patternContrasena);
                          RegExp regExpCorreo = new RegExp(pattern);
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          if (regExp.hasMatch(usuariosProvier.password ?? '') &&
                              regExpCorreo
                                  .hasMatch(usuariosProvier.email ?? '')) {
                            final String? errorMessage = await authService.login(
                                usuariosProvier.email, usuariosProvier.password);
                            if (errorMessage == null) {
                              Get.to(Perfil(
                                usuariosSerivices: usuariosServices,
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text('Correo o contraseña incorrecta',
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                                duration: Duration(seconds: 3),
                              ));
                            }
                            //TODO usuario.validar();
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Row(
                                children: [
                                  Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text('Correo o contraseña incorrecta',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              duration: Duration(seconds: 3),
                            ));
                          }
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
                    const SizedBox(height: 30),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const Registro()); //navegar a la nueva página
                        },
                        child: const Text(
                          '¿No tienes cuenta? Registrate',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
