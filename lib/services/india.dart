import 'dart:async';
import 'package:http/http.dart' as http;

const url = "https://letshunt.herokuapp.com/get_report";

class india{
  static Future getUsers() {
    return http.get(url);
  }
}