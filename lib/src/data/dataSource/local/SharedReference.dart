import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedReference {
  
  // guardar datos
  Future<void> save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  // lectura de datos
  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString(key) == null) return null;
    return json.decode(prefs.getString(key)!);
  }

  //eliminar un objeto de session
  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  //sabere si el usuario esta en session
  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}