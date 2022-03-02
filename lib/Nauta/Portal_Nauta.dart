import 'dart:convert';

import 'package:cloverplus/Nauta/Mi_Cuenta.dart';
import 'package:cloverplus/Nauta/Nauta_Helper/Informacion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio2/dio2.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'Nauta_Helper/Info.dart';


class Portal_Nauta extends StatefulWidget {
  const Portal_Nauta({Key? key}) : super(key: key);

  @override
  _NautaState createState() => _NautaState();
}

class _NautaState extends State<Portal_Nauta> {

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController code = TextEditingController();
  late int status_code;
  late String url_captcha,csrf,set_cookie;
  late bool _passwordVisible;
  late bool isLoading;
  @override
  void initState() {
    url_captcha="";
    isLoading=false;
    csrf="";
    set_cookie="session=eelomsbboq2mh3c1i3o2jc8vn1; nauta_lang=2ef815f050002a7b39c7ad7abb9e9b597ca63fa9%7Ees-es";
    status_code=-1;
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Portal Nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

      ),
      body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.5,
                    spreadRadius: 5.5,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.wifi_tethering,size: 40.0,color: Colors.white,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text('Portal Nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20.0),
                        overflow: TextOverflow.ellipsis,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      padding: EdgeInsets.only(top: 20, bottom: 2.0),
                      child: TextFormField(
                          controller: user,
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: <TextInputFormatter>[
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person,color: Theme.of(context).primaryColor.withOpacity(0.8),),
                            labelText: "Usuario",
                            hintStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                            floatingLabelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      padding: EdgeInsets.only(top: 10, bottom: 2.0),
                      child: TextFormField(
                          controller: pass,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _passwordVisible,
                          autocorrect: false,
                          inputFormatters: <TextInputFormatter>[
                          ],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                          decoration: InputDecoration(

                            prefixIcon: Icon(Icons.vpn_key_sharp,color: Theme.of(context).primaryColor.withOpacity(0.8),),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                //color: Theme.of(context).primaryColorDark,
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            labelText: "Contraseña",
                            hintStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                            floatingLabelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                            fillColor: Colors.white,
                            labelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor.withOpacity(0.5),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
                      child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15,right: 8,left: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.6,
                              child: Center(
                                child: Text(
                                    "  Entrar  ".toUpperCase(),
                                    style: TextStyle(fontSize: 14)
                                ),
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Theme.of(context).primaryColor)
                                  )
                              )
                          ),
                          onPressed: () async{
                            if(user.text.contains("@nauta.com.cu")||user.text.contains("@nauta.co.cu")){
                              _showCaptcha(context);
                            }else{
                              Fluttertoast.showToast(
                                  msg: "Usuario incorrecto",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }

                          }),
                    ),

                  ],

                ),
              ),
            ),
          )
      ),);
  }

  _showCaptcha(BuildContext context) {
    getPortal();
    if(!isLoading){
      Fluttertoast.showToast(
          msg: "Cargando captcha espere...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }


   getPortal() async {
    await Future.delayed(Duration(milliseconds: 400));
    Dio dio;
    var customHeaders = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0) Gecko/20100101 Firefox/97.0',
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
    'Accept-Language': 'es-ES,es;q=0.8,en-US;q=0.5,en;q=0.3',
    'Accept-Encoding': 'gzip, deflate, br',
    'Referer': 'https://www.portal.nauta.cu/',
    'Connection': 'keep-alive',
    'Upgrade-Insecure-Requests': '1',
    'Sec-Fetch-Dest': 'document',
    'Sec-Fetch-Mode': 'navigate',
    'Sec-Fetch-Site': 'same-origin',
    'Sec-Fetch-User': '?1',
    'Cache-Control': 'max-age=0',
    'Content-Type': 'text/html; charset=utf-8'
    };
    dio =Dio()
      ..options.connectTimeout = 100000
      ..options.receiveTimeout = 100000
      ..options.sendTimeout = 100000
      ..options.receiveDataWhenStatusError = true
      ..options.followRedirects = true
      ..options.method = 'GET'
      ..options.responseType = ResponseType.plain
      ..options.receiveDataWhenStatusError = true
      ..options.headers = customHeaders
      ..interceptors.add(LogInterceptor());

    try {
      var response = await dio.get('https://www.portal.nauta.cu/user/login/es-es');
      status_code=response.statusCode!;
      if(status_code==200){
        var cookie= response.headers['set-cookie'];
        String acceso =cookie.toString();
        var shopMsList=acceso.replaceAll("[", "").split('\ ');
        print(response.headers['set-cookie']);
        print(response.extra);
        print(response.headers);
        set_cookie="${shopMsList[0]} ${shopMsList[2]} ${shopMsList[shopMsList.length-2].replaceAll(";", "")}";

        var document=parse(response.data);
        dynamic currentTime = DateTime.now().millisecondsSinceEpoch;
        url_captcha='https://www.portal.nauta.cu/captcha/?$currentTime';
        csrf= document.querySelectorAll("[name=csrf]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        print(csrf);
        print(url_captcha);
        print('cookie $set_cookie');
        isLoading=true;
      }


      setState(() {

      });
      isLoading=false;
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Código de verificación",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 18.0),
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor.withOpacity(0.5),
                          height: 4.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: CachedNetworkImage(
                              imageUrl: url_captcha,
                              height: 65,
                              width: 100,
                              httpHeaders: {
                                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0) Gecko/20100101 Firefox/97.0',
                                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
                                'Accept-Language': 'es-ES,es;q=0.8,en-US;q=0.5,en;q=0.3',
                                'Accept-Encoding': 'gzip, deflate, br',
                                'Referer': 'https://www.portal.nauta.cu/',
                                'Cookie':set_cookie,
                                'Connection': 'keep-alive',
                                'Upgrade-Insecure-Requests': '1',
                                'Sec-Fetch-Dest': 'document',
                                'Sec-Fetch-Mode': 'navigate',
                                'Sec-Fetch-Site': 'same-origin',
                                'Sec-Fetch-User': '?1',
                                'Cache-Control': 'max-age=0'},
                              placeholder: (context, url) => Container(
                                  height: 20,
                                  width: 20,
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(30.0),
                                  child: new CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor)),
                              errorWidget: (context, url, error) => new Icon(Icons.image_not_supported,size: 50,),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 40),
                          child: TextFormField(
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                              controller: code,
                              keyboardType: TextInputType.name,
                              inputFormatters: <TextInputFormatter>[
                                new LengthLimitingTextInputFormatter(6),
                              ],
                              decoration: InputDecoration(
                                labelText: "Código",
                                floatingLabelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                labelStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8)),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                                    width: 2.0,
                                  ),
                                ),
                              )
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            String num = code.text;
                            print(num);
                            if(num!=''){
                              getPortalLogin();
                            }else{
                              Fluttertoast.showToast(
                                  msg: "Introduce el código",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(32.0),
                                  bottomRight: Radius.circular(32.0)),
                            ),
                            child: Text(
                              "Aceptar",
                              style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0,),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            );
          });

    } catch (e) {
      Fluttertoast.showToast(
          msg: "No se puede conectar al servidor",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print(e);
    }

  }
   getPortalLogin() async {
    await Future.delayed(Duration(milliseconds: 400));
    Dio dio;
    var customHeaders = {
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': set_cookie,
      'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36',
      'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
      'accept-language': 'es-ES,es;q=0.9',
      'cache-control': 'no-cache',
      'pragma': 'no-cache',
      'sec-ch-ua': '"Chromium";v="92", " Not A;Brand";v="99", "Google Chrome";v="92"',
      'sec-ch-ua-mobile': '?1',
      'sec-fetch-dest': 'document',
      'sec-fetch-mode': 'navigate',
      'sec-fetch-site': 'none',
      'sec-fetch-user': '?1',
      'upgrade-insecure-requests':'1'
    };
    String cod=code.text.toString();
    String users=user.text.toString();
    String password=pass.text.toString();
    var data = {
      'csrf': csrf,
      'login_user': users,
      'password_user': password,
      'captcha': cod,
      'btn_submit': ''
    };
    dio =Dio()
     ..options.connectTimeout = 100000
      ..options.receiveTimeout = 100000
      ..options.sendTimeout = 100000
      ..options.receiveDataWhenStatusError = true
      ..options.followRedirects = false
      ..options.validateStatus = (status) {
        return status! < 504;
          }
      ..options.method = 'GET'
      ..options.responseType = ResponseType.plain
      ..options.receiveDataWhenStatusError = true
      ..options.headers = customHeaders
      ..interceptors.add(LogInterceptor());


    try {
      var response = await http.post(Uri.parse('https://www.portal.nauta.cu/user/login/es-es'), body: data,headers: customHeaders);
      status_code =response.statusCode;
      print(response.statusCode);
      if(status_code==302){
        var respons = await dio.get('https://www.portal.nauta.cu/useraaa/user_info');
        if(respons.statusCode==200){
          var doc = parse(respons.data);
          var list_info = doc
              .querySelector("div.z-depth-1")!
              .querySelector("div.row")!.querySelectorAll('div.col.s12');
          int a =0;
          List<Info> list_information=[];
          for (dom.Element row in list_info) {
            String? title =row.querySelector('h5')?.text.toString();
            if(!title!.contains("ENLACE")){
              if(a>1){
                String? title =row.querySelector('h5')?.text.toString();
                String? subtitle=row.querySelector('p')?.text.toString();
                list_information.add(new Info(title!, subtitle!));
              }
            }

            a+=1;
            user.clear();
            code.clear();
            pass.clear();
          }
          Informacion informacion = new Informacion(set_cookie,users,password,csrf, list_information);

          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>Mi_Cuenta(informacion: informacion)));
          print(respons.data);
        }

      }else if(status_code==200){
        code.clear();
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Error en los datos, intentelo de nuevo",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }




      setState(() {

      });

    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error de conexión, intentelo de nuevo",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  }
}
