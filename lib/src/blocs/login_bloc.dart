import 'dart:async';

import 'package:form_login_flutter/src/validators/validations.dart';

class LoginBloc {
  StreamController userController = StreamController();
  StreamController passController = StreamController();

  Stream get userStream => userController.stream;

  Stream get passStream => passController.stream;

  /*
  Có thể viết thể này
  Stream getUserStream(){
    return userController.stream;
  }
   */

  bool isValidInfo(String username, String pass) {
    if (!Validation.isValidUser((username))) {
      userController.sink.addError('Account is Invalid');
      return false;
    }
    userController.sink.add('Ok');
    if (!Validation.isValidPass(pass)) {
      passController.sink.addError('Password must be more than 6 characters');
      return false;
    }
    passController.sink.add('Ok');
    return true;
  }

  void dispose() {
    userController.close();
    passController.close();
  }
}
