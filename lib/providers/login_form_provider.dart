import "package:flutter/material.dart";
import 'dart:developer';


class LoginFormProvider extends ChangeNotifier {

 GlobalKey<FormState> formKey =  GlobalKey<FormState>();

 String email    ='';
 String password ='';

bool _isLoading = false;
bool get isLoading => _isLoading;

set isLoading( bool value ) {
  _isLoading = value;
  notifyListeners();
}



 bool isValidForm() {

  log('Validacion: ${formKey.currentState?.validate()}');
  log('Email: $email - Password: $password');

  return formKey.currentState?.validate() ?? false;
 }


}