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
    CollectionReference collectionReferenceUsers = db.collection('Reseñas');
    QuerySnapshot queryUsers = await collectionReferenceUsers.get();
    print('query $queryUsers');
    queryUsers.docs.forEach((documento) {
      usuarios.add(documento.data());
    });
    notifyListeners();
    return usuarios;
  }
}
