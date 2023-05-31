import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchcoffeeapp/pages/login.dart';
import 'package:matchcoffeeapp/pages/perfil.dart';
import 'package:matchcoffeeapp/services/firestore_services.dart';
import 'package:provider/provider.dart';

import '../provider/usuarios_provider.dart';

//*Muestra la informacion del uusario como el nombre, fecha de nacimeinto y se puede cambiar la foto
class Actualizardatos extends StatefulWidget {
  @override
  State<Actualizardatos> createState() => _ActualizardatosState();
}

class _ActualizardatosState extends State<Actualizardatos> {
  File? imagen;
  final picker = ImagePicker();
  File? newPictureFile;

  Future selImagen(op, BuildContext context) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
        newPictureFile = File.fromUri(Uri(path: pickedFile.path));
      } else {
        print('No se selecciono ninguna imagen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String nomUusraio = '',
        fechaNacieminto = '',
        foto = '',
        signo = '',
        genero = '';
    final usuariosProvier = Provider.of<UsariosProvider>(context);
    final usuariosServices = Provider.of<UsuariosSerivices>(context);
    for (var i = 0; i < usuariosServices.usuarios.length; i++) {
      if (usuariosServices.usuarios[i]['email'] == usuariosProvier.email) {
        nomUusraio = '${usuariosServices.usuarios[i]['nombre']}';
        fechaNacieminto = '${usuariosServices.usuarios[i]['date']}';
        foto = '${usuariosServices.usuarios[i]['foto']}';
        signo = '${usuariosServices.usuarios[i]['signo']}';
        genero = '${usuariosServices.usuarios[i]['genero']}';
      }
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
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
                              borderRadius: BorderRadius.circular(20)),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: imagen == null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(foto),
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
                            icon: const Icon(Icons.edit),
                            color: Colors.red,
                            onPressed: () {
                              opciones(context);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Usuario',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        '$nomUusraio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Correo',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        '${usuariosProvier.email}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Fecha de Nacimiento',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        '$fechaNacieminto',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Signo zodiacal',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        '$signo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Género',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Spacer(),
                      Text(
                        '$genero',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(Login());
                          },
                          icon: const Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                            size: 30,
                          )),
                      TextButton(
                          onPressed: () {
                           
                            
                            Get.to(Login());
                          },
                          child: const Text(
                            'Cerrar sesion',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFE24E59), //color de fondo
                            padding: const EdgeInsets.symmetric(vertical: 26),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ), //aumento del padding
                          ),
                          onPressed: () async {
                            for (var i = 0;
                                i < usuariosServices.usuarios.length;
                                i++) {
                              if (usuariosServices.usuarios[i]['email'] ==
                                  usuariosProvier.email) {
                                if (newPictureFile != null) {
                                  final String? imageUrl =
                                      await usuariosServices
                                          .uploadImage(newPictureFile!);
                                  usuariosServices.usuarios[i]['foto'] =
                                      imageUrl;
                                  usuariosProvier.foto = imageUrl!;
                                  usuariosServices.updateUser(
                                      '${usuariosServices.usuarios[i]['uid']}',
                                      '${usuariosServices.usuarios[i]['date']}',
                                      '${usuariosServices.usuarios[i]['email']}',
                                      imageUrl,
                                      '${usuariosServices.usuarios[i]['genero']}',
                                      '${usuariosServices.usuarios[i]['nombre']}',
                                      '${usuariosServices.usuarios[i]['signo']}',
                                      usuariosServices.usuarios[i]
                                          ['calificacion'],
                                      '${usuariosServices.usuarios[i]['opinion']}');
                                }
                              }
                            }
                            Get.to(Perfil(usuariosSerivices: usuariosServices));
                          },
                          child: const Text(
                            'Actualizar IMG',
                            style: TextStyle(
                              fontFamily: 'Proxima Nova',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
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
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.grey,
              ),
              onPressed: () {
                Get.to(Perfil(
                  usuariosSerivices: usuariosServices,
                ));
              },
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.red,
              ),
              label: ''),
        ],
      ),
    );
  }

/*
 if(newPictureFile != null){
             final String? imageUrl = await usuariosServices.uploadImage(newPictureFile!);
               usuariosProvier.foto = imageUrl!;
                              usuariosServices.addUser(
                                usuariosProvier.date,
                                usuariosProvier.email,
                                imageUrl,
                                usuariosProvier.gender,
                                usuariosProvier.name,
                                usuariosProvier.zodiacSign
                              );
        }
*/
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
                      selImagen(1, context);
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
                      selImagen(2, context);
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
