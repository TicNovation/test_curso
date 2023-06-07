import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestProvider {

  
  Future<bool> makeRequest(Map<String, dynamic> body) async {

    //https://curso-api.dominiopruebas.shop/api/signin //SERVICIO DE REGISTRO
    var url = Uri.parse('https://curso-api.dominiopruebas.shop/api/login');

    http.Response response = await http.post(url, body: jsonEncode(body),  headers:{'Content-Type': 'application/json'});

    print(response.body);

    if(response.statusCode == 200 || response.statusCode == 201){
      return true;

    }else{
      return false;
    }


  }






}