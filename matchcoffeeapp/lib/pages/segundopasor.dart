import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../controladores/usuario.dart';
import 'package:file_picker/file_picker.dart';
import '../provider/usuarios_provider.dart';
import 'login.dart';

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
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
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
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      fechaHoy =
                          '${dateTime.year}/${dateTime.month}/${dateTime.day}';
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2025))
                          .then((value) {
                        setState(() {
                          dateTime = value!;
                          fecha =
                              '${dateTime.year}/${dateTime.month}/${dateTime.day}';
                          usuariosProvier.date = fecha;
                        });
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFFCCED1)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 20),
                          Text(
                            fecha == fechaHoy ? 'Fecha de nacimeinto' : fecha,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  DropdownButtonFormField<String>(
                    value: 'Aries', // valor predeterminado
                    decoration: InputDecoration(
                      labelText: 'Signo Zodiacal',
                      labelStyle: TextStyle(
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
                      print('Signo seleccionado seleccionado: $signoZodiacal');
                    },
                  ),
                  SizedBox(height: 40),
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
                      SizedBox(
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
                            padding: EdgeInsets.symmetric(vertical: 30),
                            backgroundColor:
                                generoF ? Color(0xFFE24E59) : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(
                                color: generoF
                                    ? Colors.white
                                    : Color(
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
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 20.0), // Margen inferior de 20px
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE24E59),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          10.0), // Padding de 20px en todos los lados
                      child: TextButton(
                        onPressed: () async {
                          print("prueba");
                          final file = await FilePicker.platform
                              .pickFiles(type: FileType.any);
                          if (file != null) {
                            print(file.files.single.name);
                            final fileName = file.files.single.name;
                            usuario.guardarfile.value = fileName;
                            print(usuario.guardarfile);
                            usuariosProvier.foto = fileName;
                          }
                        },
                        child: Text(
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
                  Obx(() => Text(
                      "Archivo seleccionado: ${usuario.guardarfile.value}")),
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
                        Get.to(Login());
                      },
                      child: Text(
                        'Regístrate',
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(usuario.email.text),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
