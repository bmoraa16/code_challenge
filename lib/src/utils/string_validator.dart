import 'package:flutter/material.dart';

class StringValidator {
  static String? validateRFC(String value) {
    String pattern =
        r'(^^[A-Z&Ñ]{3,4}[0-9]{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[01])[A-Z0-9]{2}[0-9A]$)';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return "Este campo es necesario";
    } else if (!regExp.hasMatch(value)) {
      return "Ingresa un RFC válido";
    } else if (value.length < 12) {
      return "Minimo 12 caracteres";
    } else if (value.length > 13) {
      return "Máximo 13 caracteres";
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
    String pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = RegExp(pattern);
    if (value == passwordCtrl.text) {
      return "Los campos no pueden ser iguales";
    } else if (value.isEmpty) {
      return "Este campo es necesario";
    } else {
      if (value.isEmpty) {
        return "El correo es necesario";
      } else if (!regExp.hasMatch(value)) {
        return "Correo invalido";
      } else {
        return null;
      }
    }
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
