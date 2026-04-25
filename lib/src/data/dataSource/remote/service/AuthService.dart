import 'dart:convert';
import 'package:progress1_project/src/data/api/ApiConfig.dart';
import 'package:progress1_project/src/domain/models/AuthResponse.dart';
import 'package:http/http.dart' as http;
import 'package:progress1_project/src/domain/utils/Resource.dart';

class Authservice {
  Future<Resource> login(String email,String password)async{
    try {
      Uri url = Uri.parse("${ApiConfig.API_COMMERCE}/auth/login");
      Map<String,String> headers = {
        "Content-Type":"application/json"
      };
      String body = json.encode(
        {
          'email':email,
          'password':password
        }
      );
      final response = await http.post(
        url,
        headers: headers,
        body: body
      );
      final data = json.decode(response.body);
      if (response.statusCode ==200 || response.statusCode ==201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Success(authResponse);  
      }else{
        return Error(data['message']);
      }
      
    } catch (e) {
      return Error(e.toString());
    }
  }
}