import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../paginas/perfil.dart';

class Usuario extends GetxController{
  var count = 0.obs;
  var email = TextEditingController();
  var contrasena = TextEditingController();
  var guardarfile = "".obs;

  cambiar (){
    guardarfile="Lo que sea funca".obs;
  }

  validar () async {
    // conectar con firebase
    print(email.text);
    // despues de estar validado

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: contrasena.text
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }

    }
    Get.to(Perfil());
  }

  registrarse () async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: contrasena.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  increment() => count++;

  /*loginGoogle() {
    signInWithGoogle().then((result) {
      if (result != null) {
        print(result);
        Get.to(Inicio());
      }
    });
  }*/
}