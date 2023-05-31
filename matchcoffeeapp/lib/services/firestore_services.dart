import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

//*conexion con la base de datos
class UsuariosSerivices extends ChangeNotifier {
  List usuarios = [];
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isSaving = false;
  File? newPictureFile;

  //*constructor
  UsuariosSerivices() {
    this.getUsers();
  }

//*obtener usuaario s de la base de datos
  Future<List> getUsers() async {
    notifyListeners();
    CollectionReference collectionReferenceUsers = db.collection('usuarios');
    QuerySnapshot queryUsers = await collectionReferenceUsers.get();
    queryUsers.docs.forEach((documento) {
      final Map<String, dynamic> data =
          documento.data() as Map<String, dynamic>;
      final user = {
        "calificacion": data['calificacion'],
        "date": data['date'],
        "email": data['email'],
        "foto": data["foto"],
        "genero": data['genero'],
        "nombre": data["nombre"],
        "opinion": data["opinion"],
        "signo": data["signo"],
        "uid": documento.id,
      };
      usuarios.add(user);
    });
    notifyListeners();
    return usuarios;
  }

//*Agregar infromacion a la base de datos
  Future addUser(String date, String email, String foto, String genero,
      String nombre, String signo) async {
    await db.collection('usuarios').add({
      "calificacion": 0,
      "date": date,
      "email": email,
      "foto": foto,
      "genero": genero,
      "nombre": nombre,
      "opinion": '',
      "signo": signo
    });
    usuarios.add({
      "calificacion": 0,
      "date": date,
      "email": email,
      "foto": foto,
      "genero": genero,
      "nombre": nombre,
      "opinion": '',
      "signo": signo
    });
    notifyListeners();
  }

  Future updateUser(
      String uid,
      String date,
      String email,
      String foto,
      String genero,
      String nombre,
      String signo,
      int calificacion,
      String opinion) async {
    await db.collection('usuarios').doc(uid).set({
      "uid": uid,
      "calificacion": calificacion,
      "date": date,
      "email": email,
      "foto": foto,
      "genero": genero,
      "nombre": nombre,
      "opinion": opinion,
      "signo": signo
    });
    for (var i = 0; i < usuarios.length; i++) {
      if (usuarios[i]['uid'] == uid) {
        usuarios[i]['calificacion'] = calificacion;
        usuarios[i]['foto'] = foto;
        usuarios[i]['opinion'] = opinion;
      }
    }
  }

//*Agregar imagen en cloudiary
  Future<String?> uploadImage(File newPictureFile) async {
    if (newPictureFile == null) return null;
    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dtjggbrgv/image/upload?upload_preset=p2iho5ca');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newPictureFile.path);
    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }
    this.newPictureFile = null;
    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
