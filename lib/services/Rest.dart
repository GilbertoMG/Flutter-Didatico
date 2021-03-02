import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

const URL = 'http://192.168.56.1/estudo-api/api2/public/';

class Rest {
  final _headers = {
    'Content-Type': 'application/json',
    'Authorization': '',
  };

  final storage = new FlutterSecureStorage();

  Rest() {}

  //Future<http.Response> post(String email, String senha) async {
  //Map data = {'email': email, 'senha': senha};
  //encode Map to JSON
  Future post_(String recurso, Map data) async {
    var _body = json.encode(data);
    _headers['Authorization'] =
        await storage.read(key: "token-x"); //await getToken();
    //print(_body);
    http.Response response =
        await http.post(URL + recurso, headers: _headers, body: _body);

    //print( );
    //print("${response.body}");
    //print(response.statusCode);

    return checkResponse(response);
  }

  Future get_(String recurso) async {
    _headers['Authorization'] =
        await storage.read(key: "token-x"); //await getToken();
    http.Response response = await http.get(URL + recurso, headers: _headers);
    //print("${response.body}");
    print(response.statusCode);
    return checkResponse(response);
  }

  Future delete_(String recurso) async {
    _headers['Authorization'] =
        await storage.read(key: "token-x"); //await getToken();
    http.Response response =
        await http.delete(URL + recurso, headers: _headers);
    print("${response.body}");
    print(response.statusCode);
    return checkResponse(response);
  }

  checkResponse(http.Response response) {
    /*
    if (response.statusCode < 200 || response.statusCode > 400) {
      return {
        'status': response.statusCode,
        'messages': {
          'error': 'Não foi possível conectar ao servidor',
        }
      };
    }
    return {'status': response.statusCode, 'data': json.decode(response.body)};*/
    /*if (response.statusCode == 500) {
      return {
        'status': response.statusCode,
        'messages': {
          'error': 'Ocorreu um erro interno no servidor',
        }
      };
    } else {
      return {
        'status': response.statusCode,
        'data': json.decode(response.body)
      };
    }
  }
*/
    if (response.statusCode == 404) {
      return {
        'status': response.statusCode,
        'messages': {
          'error': json.decode(response.body),
        }
      };
    } else if (response.statusCode == 401) {
      return {
        'status': response.statusCode,
        'data': json.decode(response.body)
      };
    } else if (response.statusCode == 500) {
      return {
        'status': response.statusCode,
        'messages': {
          'error': 'Ocorreu um erro interno no servidor',
        }
      };
    } else {
      return {
        'status': response.statusCode,
        'data': json.decode(response.body)
      };
    }
  }

  Future<String> getToken() async {
    var storage = FlutterSecureStorage();
    return await storage.read(key: "token-x");
  }
}
