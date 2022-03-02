import 'package:cloverplus/Nauta/Nauta_Helper/Info.dart';

class Informacion{
  String cookie;
  String user;
  String password;
  String csrf;
  List<Info> list_info;

  Informacion(this.cookie, this.user, this.password, this.csrf, this.list_info);
}