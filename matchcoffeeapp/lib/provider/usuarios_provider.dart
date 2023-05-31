import 'package:flutter/material.dart';

//*datos de la base de datos
class UsariosProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  String name = '';
  String date = '';
  String zodiacSign = '';
  String gender = '';
  String id = '';
  String? foto;

  bool _isLoading = false;
  Map<String, dynamic> favoritos = new Map();

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
