import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';
import 'package:provider/provider.dart';
import '../controladores/usuario.dart';
import 'package:image_picker/image_picker.dart';
import '../provider/usuarios_provider.dart';
import '../services/auth_service.dart';
import 'login.dart';

//*Esta clase es la segunda parte del registro
class Segundopasor extends StatefulWidget {
  @override
  State<Segundopasor> createState() => _SegundopasorState();
}

class _SegundopasorState extends State<Segundopasor> {
  final Usuario usuario = Get.put(Usuario());
  DateTime dateTime = DateTime.now();
  String fecha = '';
  String fechaHoy = '';
  String genero = 'mujer', signoZodiacal = '';
  bool generoF = true, generoM = false;
  File? imagen;
  final picker = new ImagePicker();
  File? newPictureFile;
  bool imagenSeleccionada = true;
  @override
  Widget build(BuildContext context) {
    final usuariosProvier = Provider.of<UsariosProvider>(context);
    final usuariosServices = Provider.of<UsuariosSerivices>(context);
    return Scaffold(
      backgroundColor: Colors.white, // agregar esta línea
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () {
            //*Quitar el teclado
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Container(
            child: SingleChildScrollView(
              child: Form(
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
                    SizedBox(height: 40),
                    TextFormField(
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        hintText: 'demo',
                        
                        prefixIcon: Icon(
                            Icons.person_add,
                            size: 23,
                            color: Colors.red,
                          ),
                        labelStyle: const TextStyle(
                          color: Colors.grey, // color del label
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Color(0xFFFCCED1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Color(0xFFFCCED1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Color(0xFFFCCED1)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      ),
                      onChanged: (value) => usuariosProvier.name = value,
                      validator: (value) {
                        return usuariosProvier.name.length >= 3
                            ? null
                            : 'El valor ingresado no se ve como un nombre';
                      },
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        fechaHoy =
                            '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2025),
                           builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.light().copyWith(
                                  primary: Color(0xFFE24E59), // Usa el color seleccionado aquí
                                ),
                              ),
                              child: child!,
                            );
                          },
                        )
                            .then((value) {
                          setState(() {
                            dateTime = value!;
                            fecha =
                                '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                            usuariosProvier.date = fecha;
                          });
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFCCED1)),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_today),
                            const SizedBox(width: 20),
                            Text(
                              fecha == fechaHoy ? 'Fecha de nacimeinto' : fecha,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    DropdownButtonFormField<String>(
                      value: 'Aries', // valor predeterminado
                      decoration: InputDecoration(
                        labelText: 'Signo Zodiacal',
                        labelStyle: const TextStyle(
                          color: Colors.grey, // color del label
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none, // quitar borde
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Color(0xFFFCCED1)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Color(0xFFFCCED1)),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      ),

                      items: <String>[
                        'Aries',
                        'Tauro',
                        'Géminis',
                        'Cáncer',
                        'Leo',
                        'Virgo',
                        'Libra',
                        'Escorpio',
                        'Sagitario',
                        'Capricornio',
                        'Acuario',
                        'Piscis',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // hacer algo cuando el valor seleccionado cambie
                        signoZodiacal = value!;
                      },
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                generoF = false;
                                generoM = true;
                                genero = 'hombre';
                                usuariosProvier.gender = genero;
                              });
                            },
                            child: Text(
                              'Hombre',
                              style: TextStyle(
                                fontSize: 16,
                                color: generoM
                                    ? Colors.white
                                    : Color(0xFFF1858D), // Nuevo color de texto
                                fontWeight: FontWeight
                                    .bold, // agregando el fontWeight bold
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              backgroundColor: generoM
                                  ? Color(0xFFE24E59)
                                  : Colors
                                      .white, // Cambiar el color de fondo a blanco
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(
                                  color: generoM
                                      ? Colors.white
                                      : Color(
                                          0xFFF1858D), // Agregar borde de color #F1858D
                                  width: 2, // Ancho del borde
                                ),
                              ),
                              elevation: 0, // Eliminar la sombra del botón
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 20), //eliminar el espacio entre los botones
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              print('Botón 2 presionado');
                              setState(() {
                                generoF = true;
                                generoM = false;
                                genero = 'mujer';
                                usuariosProvier.gender = genero;
                              });
                            },
                            child: Text(
                              'Mujer',
                              style: TextStyle(
                                fontSize: 16,
                                color: generoF
                                    ? Colors.white
                                    : Color(0xFFF1858D), // Nuevo color de texto
                                fontWeight: FontWeight
                                    .bold, // agregando el fontWeight bold
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              backgroundColor:
                                  generoF ? Color(0xFFE24E59) : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                                side: BorderSide(
                                  color: generoF
                                      ? Colors.white
                                      : const Color(
                                          0xFFF1858D), // Agregar borde de color #F1858D
                                  width: 2, // Ancho del borde
                                ),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Container(
                      height: 150,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: imagen == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/foto.jpg',
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(imagen!),
                            ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 20.0), // Margen inferior de 20px
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFE24E59),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            10.0), // Padding de 20px en todos los lados
                        child: TextButton(
                          onPressed: () async {
                            print("prueba");
                            /*final file = await FilePicker.platform
                                .pickFiles(type: FileType.any);*/
                            final PickedFile? pickedFile =
                                await picker.getImage(
                                    source: ImageSource.gallery,
                                    imageQuality: 100);
                            setState(() {
                              if (pickedFile != null) {
                                imagenSeleccionada = true;
                                imagen = File(pickedFile.path);
                                newPictureFile =
                                    File.fromUri(Uri(path: pickedFile.path));
                                print('Esta es mi imagen $imagen');
                              } else {
                                imagenSeleccionada = false;
                                print('No se selecciono ninguna imagen');
                              }
                            });
                          },
                          child: const Text(
                            'Seleccionar Foto de perfil',
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFFE24E59),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
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
                        onPressed: () async {
                           DateTime dateHoy = DateTime.now();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          final String? errorMessage =
                              await authService.createUser(
                                  usuariosProvier.email,
                                  usuariosProvier.password);
                          //*Agregar la informacion tambien a la parte de iniciar sesion
                          if (signoZodiacal == '') {
                            usuariosProvier.zodiacSign = 'Aries';
                          } else {
                            usuariosProvier.zodiacSign = signoZodiacal;
                          }

                          if (newPictureFile != null &&
                              usuariosProvier.name.length >= 3 &&
                              fecha != fechaHoy) {
                              
                            if (errorMessage == null) {
                              String nameCapital =
                                  capitalizeFirstLetter(usuariosProvier.name);
                              usuariosProvier.name = nameCapital;
                              final String? imageUrl = await usuariosServices
                                  .uploadImage(newPictureFile!);
                              usuariosProvier.foto = imageUrl!;
                              usuariosServices.addUser(
                                  usuariosProvier.date,
                                  usuariosProvier.email,
                                  imageUrl,
                                  genero,
                                  usuariosProvier.name,
                                  usuariosProvier.zodiacSign);
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
                                    Text('No se pudo registrar',
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                                duration: Duration(seconds: 3),
                              ));
                            }
                            Get.to(Login());
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
                                  Text('Debe ingresar todos los datos',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              duration: Duration(seconds: 3),
                            ));
                          }
                        },
                        child: const Text(
                          'Regístrate',
                          style: TextStyle(
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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

  //*La primera letra del nombre en mayusula
  String capitalizeFirstLetter(String word) {
    if (word.isEmpty) {
      return word;
    }
    return word[0].toUpperCase() + word.substring(1);
  }
}
