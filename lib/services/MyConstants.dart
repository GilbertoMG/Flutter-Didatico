import 'package:rotas/models/Auth.dart';

class MyConstants {
  static String SUCCESS_MESSAGE = " You will be contacted by us very soon.";

  Auth _auth = Auth();

  String getUserName() {
    _auth.getToken().then((res) {
      String USERNAME = res['nome'];
    });
  }
}
