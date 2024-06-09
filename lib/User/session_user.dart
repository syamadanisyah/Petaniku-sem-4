import 'package:d_method/d_method.dart';
import 'package:get/get.dart';
import 'package:petaniku2/User/modelUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserLevel {
  penjual,
  pembeli,
}

class PetanikuService {
  static const userId = 'iduser';
  // static const phone = 'phone';
  static const email = 'email';
  static const nama = 'nama';
  static const username = 'username';
  static const level = 'level';
  static const photo = 'photo';
  static const alamat = 'alamat';

  /// cek apakah user sudah login atau belum
  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // get email
    String? userEmail = prefs.getString('email'); // Pastikan Anda menggunakan key yang benar

    if (userEmail == null || userEmail.isEmpty) {
      DMethod.log('Email login: null or empty');
      return false;
    }

    DMethod.log('Email login: $userEmail');

    // Validasi email menggunakan regex
    bool isValidEmail = _isValidEmail(userEmail);

    if (!isValidEmail) {
      DMethod.log('Email is not valid');
    }

    return isValidEmail;
  }

  static bool _isValidEmail(String email) {
    // Regex for validating email
    String emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);
  }


  // get user data
  static Future<String> getUserData(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(data)) {
      return prefs.getString(data) ?? '';
    } else {
      return '';
    }
  }

  static Future<String> getEmailLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(email)) {
      return prefs.getString(email) ?? '';
    } else {
      return '';
    }
  }

  static Future<int> getUserDataInt(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(data)) {
      return prefs.getInt(data) ?? 1;
    } else {
      return 1;
    }
  }

  static Future<int> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(userId)) {
      return prefs.getInt(userId) ?? 0;
    } else {
      return 0;
    }
  }


  // set user data
  static Future<void> setUserData(String data, String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(data, value ?? '');
  }

  static Future<void> setUserDataInt(String data, int? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(data, value ?? 0);
  }

  /// login
  static Future<void> login(modelUser user) async {
    await setUserData(userId, user.id_user);
    await setUserData(email, user.email);
    await setUserData(nama, user.nama);
    await setUserData(username, user.username);
    await setUserData(photo, user.level);
    await setUserData(alamat, user.alamat);
  }

  /// logout
  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userId);
    await prefs.remove(nama);
    await prefs.remove(email);
    await prefs.remove(username);
    await prefs.remove(photo);
    await prefs.remove(level);
  }
}