import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matchcoffeeapp/pages/perfil.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';
import '../controladores/usuario.dart';
import 'actualizardatos.dart';
import 'cafes.dart';
import 'calificacion.dart';

class Citas extends StatefulWidget {
  String nombre;
  Citas({required this.nombre});
  @override
  State<Citas> createState() => _CitasState(nombre: nombre);
}

class _CitasState extends State<Citas> {
  String nombre;
  _CitasState({required this.nombre});
  final Usuario usuario = Get.put(Usuario());

  final TextEditingController _timeController = TextEditingController();
  UsuariosSerivices usuariosServices = new UsuariosSerivices();
  DateTime dateTime = DateTime.now();

  String fecha = '';

  String fechaHoy = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          child: SingleChildScrollView(
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
                SizedBox(height: 40),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: 'Vas a invitar a $nombre \n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5387A2),
                        ),
                      ),
                      TextSpan(
                        text: 'a vivir la experiencia Match Coffee',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5387A2),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          fechaHoy =
                               '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2025))
                              .then((value) {
                            setState(() {
                              dateTime = value!;
                              fecha =
                                   '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                            });
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF5387A2)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 20),
                              Text(
                                fecha == fechaHoy ? 'Fecha' : fecha,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    // Espacio entre los campos de fecha y hora
                    Expanded(
                      child: TextFormField(
                        controller: _timeController,
                        readOnly: true,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((pickedTime) {
                            if (pickedTime != null) {
                              _timeController.text = pickedTime.format(context);
                            }
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Hora',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF5387A2)),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          prefixIcon: Icon(Icons.access_time),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 30), // Aumenta el alto del campo
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.white, // Cambiar el color de fondo a blanco
                      onPrimary: Color(
                          0xFF5387A2), // Cambiar el color del texto e icono a 0xFF5387A2
                      padding: EdgeInsets.symmetric(vertical: 26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(
                            color: Color(
                                0xFF5387A2)), // Agregar un borde de color 0xFF5387A2
                      ),
                    ),
                    onPressed: () {
                      print('Botón Continuar presionado');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFF5387A2),
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Get.to(Cafes(
                              nombre: nombre,
                            ));
                          },
                          child: Text(
                            'Seleccionar lugar',
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),

                /* TextFormField(
                  controller: _textInputController,
                  decoration: InputDecoration(
                    labelText: 'Texto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF5387A2)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    prefixIcon: Icon(Icons.text_fields),
                    contentPadding: EdgeInsets.symmetric(vertical: 30),
                  ),
                ),*/
                SizedBox(height: 20),
                SizedBox(
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF5387A2)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          maxLines:
                              null, // Permite que el campo de texto se expanda automáticamente
                          textAlignVertical: TextAlignVertical
                              .top, // Alinea el texto en la parte superior
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5387A2),
                          ),
                          decoration: InputDecoration(
                            hintText: 'Enviale un mensaje',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5387A2), //color de fondo
                      padding: EdgeInsets.symmetric(vertical: 26),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ), //aumento del padding
                    ),
                    onPressed: () {
                      print('Botón Continuar presionado funca');
                      Get.to(RatingScreen());
                    },
                    child: Text(
                      'Invitar',
                      style: TextStyle(
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Get.to(Perfil(
                    usuariosSerivices: usuariosServices,
                  ));
                },
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Get.to(Actualizardatos());
                },
              ),
              label: ''),
        ],
      ),
    );
  }
}
