import 'package:flutter/material.dart';

class StringValidator {
  static String? validateName(String value) {
    String pattern = r'(^[a-zA-ZáéíóúÁÉÍÓÚäÄëËïÏöÖüÜ\u00f1\u00d1 ]*$)';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Este campo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Solo puede contener letras";
    } else if (value.length < 3) {
      return "Minimo 3 caracteres";
    } else if (value.length > 200) {
      return "Máximo 200 caracteres";
    } else if (value.trim().isEmpty) {
      return "Este campo está vacio";
    }
    return null;
  }

  static String? validateObservations(String value) {
    String pattern = r'(^[\r\n,0-9a-zA-ZáéíóúÁÉÍÓÚäÄëËïÏöÖüÜ\u00f1\u00d1 ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Este campo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Solo puede contener letras o numeros";
    } else if (value.length < 3) {
      return "Minimo 3 caracteres";
    }
    return null;
  }

  static String? validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "El telefono es necesario";
    } else if (value.length < 10) {
      return "El número debe tener 10 digitos";
    } else if (value.length > 15) {
      return "El número no puede tener mas de 15 digitos";
    } else if (!regExp.hasMatch(value)) {
      return "Solo puede contener números";
    }
    return null;
  }

  static String? validateCode(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return "El código es necesario";
    } else if (value.length != 6) {
      return "El código debe tener 6 digitos";
    } else if (!regExp.hasMatch(value)) {
      return "Solo puede contener números";
    }
    return null;
  }

  static String? validatePassword(
      String value, TextEditingController passwordCtrl) {
    if (value != passwordCtrl.text) {
      return "Las contraseñas no coinciden";
    } else if (value.isEmpty) {
      return "Este campo es necesario";
    }
    return null;
  }

  static String? emptyPassword(String value) {
    if (value.isEmpty) {
      return "Este campo es necesario";
    } else if (value.length < 7) {
      return "Minimo 8 caracteres";
    }
    return null;
  }

  static String? validateEmail(String value) {
    String pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "El correo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Correo invalido";
    } else {
      return null;
    }
  }

  static String? validateInput(String value) {
    if (value.isEmpty) {
      return "Este campo es necesario";
    } else if (value.length < 3) {
      return "Minimo 3 caracteres";
    } else if (value.trim().isEmpty) {
      return "Este campo está vacio";
    }
    return null;
  }
}
