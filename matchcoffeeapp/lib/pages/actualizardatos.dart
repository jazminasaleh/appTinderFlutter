import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchcoffeeapp/pages/login.dart';
import 'package:matchcoffeeapp/pages/perfil.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';

class Actualizardatos extends StatefulWidget {
  @override
  State<Actualizardatos> createState() => _ActualizardatosState();
}

class _ActualizardatosState extends State<Actualizardatos> {
  File? imagen;
  final picker = ImagePicker();

  Future selImagen(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
        print(' tenemos imagen $imagen');
      } else {
        print('No se selecciono ninguna imagen');
      }
    });
  }

  UsuariosSerivices usuariosServices = new UsuariosSerivices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 199, 198, 198),
                              borderRadius: BorderRadius.circular(20)),
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 199, 198, 198),
                            child: imagen == null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/foto.jpg',
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(imagen!),
                                  ),
                          )),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.red,
                            onPressed: () {
                              opciones(context);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: [
                      Text(
                        'usuario',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        'monica R',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        'email',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        'alilondo@gmail.com',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        'celular',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        '+57 3005964565',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        'Fecha de Nacimiento',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        '16.06.1955',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(Login());
                          },
                          icon: Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                            size: 30,
                          )),
                      TextButton(
                          onPressed: () => Get.to(Login()),
                          child: Text(
                            'Cerrar sesion',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                Get.to(Perfil(usuariosSerivices: usuariosServices,));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.red,
              ),
              label: ''),
        ],
      ),
    );
  }

  void opciones(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      selImagen(1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Tomar una foto',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      selImagen(2);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Seleccionar una foto',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Icon(
                            Icons.image,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
