import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UsuariosSerivices extends ChangeNotifier {
  List usuarios = [];
  FirebaseFirestore db = FirebaseFirestore.instance;

  UsuariosSerivices() {
    this.getUsers();
  }

  Future<List> getUsers() async {
    notifyListeners();
    CollectionReference collectionReferenceUsers = db.collection('usuarios');
    QuerySnapshot queryUsers = await collectionReferenceUsers.get();
    print('query $queryUsers');
    queryUsers.docs.forEach((documento) {
      final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
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

  Future addUser(String date, String email, String foto, String genero, String nombre, String signo) async {
    await db.collection('usuarios').add({"calificacion": 0, "date": date, "email": email, "foto": foto, "genero": genero, "nombre": nombre, "opinion": '', "signo": signo});
    usuarios.add({"calificacion": 0, "date": date, "email": email, "foto": foto, "genero": genero, "nombre": nombre, "opinion": '', "signo": signo});
    notifyListeners();
  }

  Future updateUser(String uid, String date, String email, String foto, String genero, String nombre, String signo, int calificacion, String opinion) async{
    await db.collection('usuarios').doc(uid).set({"calificacion": calificacion, "date": date, "email": email, "foto": foto, "genero": genero, "nombre": nombre, "opinion": opinion, "signo": signo});
  }
}
