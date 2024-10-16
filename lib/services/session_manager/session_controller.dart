import 'dart:convert';

import 'package:sky_fare/model/user/user_model.dart';
import 'package:sky_fare/services/storage/local_storage.dart';

class SessionController {
  static final SessionController _session = SessionController._internal();
  final LocalStorage localStorage = LocalStorage();
  String? name;
  bool? isLogin;
  bool? isAdmin;

  SessionController._internal() {
    name = "";
    isLogin = false;
    isAdmin = false;
  }

  factory SessionController() {
    return _session;
  }

  Future<void> saveUserInPreference(dynamic user) async {
    localStorage.setValue('token', user['token']);
    localStorage.setValue('isLogin', user['isLogin'].toString());
    localStorage.setValue('isAdmin', user['isAdmin'].toString());
    localStorage.setValue('name', user['name']);
  }

  Future<dynamic> getUserInPreference(String user) async {
    try {
      return await localStorage.getValue("$user");
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> removeuserPerference() async {
    try {
      localStorage.deleteValue('token');
      localStorage.deleteValue('name');
      localStorage.deleteValue('isLogin');
      localStorage.deleteValue('isAdmin');
      return true;
    } catch (e) {
      return false;
    }
  }
}
