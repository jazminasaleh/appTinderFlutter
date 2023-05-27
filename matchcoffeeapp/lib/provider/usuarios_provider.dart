import 'package:flutter/material.dart';

class UsariosProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey();
  String email = '';
  String password = '';
  String name = '';
  String date = '';
  String zodiacSign = '';
  String gender = '';
  String? foto;

  bool _isLoading = false;
  Map<String, dynamic> favoritos = new Map();

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
