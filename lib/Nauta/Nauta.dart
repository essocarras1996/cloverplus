import 'package:cloverplus/BaseDatos/DataBase.dart';
import 'package:cloverplus/BaseDatos/SessionObject.dart';
import 'package:cloverplus/Nauta/Nauta_Helper/TimeNauta.dart';
import 'package:cloverplus/Nauta/Portal_Nauta.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio2/dio2.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

import 'Nauta_Helper/NautaSesion.dart';

class Nauta extends StatefulWidget {
  const Nauta({Key? key}) : super(key: key);

  @override
  _NautaState createState() => _NautaState();
}

class _NautaState extends State<Nauta> {
  late int tiempo;
  late String cookie_session;
  late String url_session;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  late bool _passwordVisible;
 @override
  void initState() {
   tiempo=0;
   _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),
        actions: [     Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Lista de usuarios', 'Retomar sesión'}.map((String choice) {
                return PopupMenuItem<String>(
                  textStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ),],
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
                        child: Icon(Icons.wifi,size: 40.0,color: Colors.white,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text('WIFI ETECSA',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20.0),
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
                            String username = user.text;
                            String password = pass.text;
                            bool existe= false;
                            
                            if(username.contains('@nauta.com.cu')||username.contains('@nauta.co.cu')){

                              if(password!=''){
                                List<SessionObject> listUsers = await TuEnvioDatabase.instance.readAllSesion();
                                for(int i=0;i<listUsers.length;i++){
                                  if(listUsers[i].usuario==username){
                                    existe=true;
                                    if(listUsers[i].password!=password){
                                      updateUser(username, password);
                                    }
                                  }
                                }
                                if(!existe){
                                  _saveUser(context,username,password);
                                }else{
                                  getNautaPortal();
                                }


                              }else{
                                Fluttertoast.showToast(
                                    msg: "El campo de la contraseña es incorrecto",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }

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
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: InkWell(
                        onTap: (){

                          Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) =>Portal_Nauta()));

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0,bottom: 40.0),
                          child: Text('Portal Nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 15.0),
                            overflow: TextOverflow.ellipsis,),
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
          )
      ),);
  }

  getNautaPortal() async {
    Fluttertoast.showToast(
        msg: "Iniciando Sesión",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
    await Future.delayed(Duration(milliseconds: 400));
    String cookie;
    String wlanacname;
    String CSRFHW;
    String wlanuserip;
    String ssid;
    String wlanmac;
    Dio dio;

    String username= user.text;
    String password= pass.text;
    var customHeaders = {
      'Accept-Encoding': 'gzip, deflate',
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
      print('iniciando sesion');
      var response = await http.get(Uri.parse('https://secure.etecsa.net:8443/'),headers: customHeaders);
      int status_code =response.statusCode;
      print(status_code);
      if(status_code==200){
        var document=parse(response.body);
        var listCookie = response.headers['set-cookie']?.split(" ");
        cookie=listCookie![0];
        print('cookie $cookie');
        wlanuserip= document.querySelectorAll("[name=wlanuserip]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        wlanacname= document.querySelectorAll("[name=wlanacname]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        wlanmac= document.querySelectorAll("[name=wlanmac]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        String firsturl= document.querySelectorAll("[name=firsturl]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        ssid= document.querySelectorAll("[name=ssid]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        String usertype= document.querySelectorAll("[name=usertype]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        String gotopage= document.querySelectorAll("[name=gotopage]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        String successpage= document.querySelectorAll("[name=successpage]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        String loggerId= document.querySelectorAll("[name=loggerId]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        String lang= 'es_ES';
        CSRFHW= document.querySelectorAll("[name=CSRFHW]").where((e) => e.attributes.containsKey('value'))
            .map((e) => e.attributes['value']).first
            .toString();
        String? formulario= document.getElementById('formulario')!.attributes['action'].toString();
        var customHeadersPost = {
          'Accept-Encoding': 'gzip, deflate',
          'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36',
          'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
          'accept-language': 'es-ES,es;q=0.9',
          'Cookie': cookie,
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
        print(username);
        print(password);
        var data ={
          'wlanuserip': wlanuserip,
          'wlanacname': wlanacname,
          'wlanmac': wlanmac,
          'firsturl': firsturl,
          'ssid':ssid,
          'usertype':usertype,
          'gotopage':gotopage,
          'successpage':successpage,
          'loggerId':loggerId,
          'lang':lang,
          'username':	username,
          'password':	password,
          'CSRFHW':	CSRFHW
        };
        var resp = await http.post(Uri.parse(formulario),body: data,headers: customHeadersPost);
        status_code = resp.statusCode;
        print('logueo bien $status_code');
        if(status_code==302){
          //entro bien
          var location = resp.headers['location'].toString();
          print(location);
          var listCookie = resp.headers['set-cookie']?.split(" ");
          cookie=listCookie![0];
          print(cookie);
          var customHeadersGET = {
            'Accept-Encoding': 'gzip, deflate',
            'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36',
            'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
            'accept-language': 'es-ES,es;q=0.9',
            'Cookie': cookie,
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
          resp = await http.get(Uri.parse(location),headers: customHeadersGET);
          status_code=resp.statusCode;
          if(status_code==200){
            Fluttertoast.showToast(
                msg: "Obteniendo tiempo",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0
            );
            var doc=parse(resp.body);
            String outerHtml = doc.outerHtml;
            int indexOf2 = outerHtml.indexOf("ATTRIBUTE_UUID");
            var split = outerHtml.substring(indexOf2, indexOf2 + 650).split("\"");
            print(cookie);
            cookie_session=cookie;
            var customHeadersPOSTTime = {
              'Accept-Encoding': 'gzip, deflate',
              'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Mobile Safari/537.36',
              'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
              'accept-language': 'es-ES,es;q=0.9',
              'Cookie': cookie,
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
            String ATTRIBUTE_UUID=split[0].split("=")[1];
            print(split[0].split("=")[1].split("&")[0]);
            var data ={
              'op':'getLeftTime',
              'ATTRIBUTE_UUID':split[0].split("=")[1].split("&")[0],
              'CSRFHW':CSRFHW,
              'wlanuserip':wlanuserip,
              'ssid':ssid,
              'loggerId':loggerId,
              'domain':'',
              'username':username,
              'wlanacname':wlanacname,
              'wlanmac':wlanmac
            };
            var respTime = await http.post(Uri.parse('https://secure.etecsa.net:8443/EtecsaQueryServlet'),body: data,headers: customHeadersPOSTTime);
            int st=respTime.statusCode;
            if(st==200){
              var docTime = parse(respTime.body);
              String tiem=docTime.body!.text;
              print(docTime.body!.text);
              var litTime=tiem.split(":");
              int hours= int.parse(litTime[0])*3600;
              print(hours);
              int minutes= int.parse(litTime[1])*60;
              print(minutes);
              int seg= int.parse(litTime[2]);
              print(seg);
              tiempo = hours+minutes+seg;
              print(tiempo);
              url_session = "https://secure.etecsa.net:8443/nauta_hogar/OnlineURL/offline.jsp?CSRFHW=$CSRFHW&lang=es_ES";
              print(url_session);
              NautaSesion nautaSesion =NautaSesion(cookie_session,username, tiempo, url_session,CSRFHW,loggerId,ssid,wlanuserip,split[0].split("=")[1].split("&")[0]);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>TimeNauta(sesion: nautaSesion)));
            }else{
              Fluttertoast.showToast(
                  msg: "Ocurrio un error al obtener el tiempo",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              NautaSesion nautaSesion =NautaSesion(cookie_session,username, 0, url_session,CSRFHW,loggerId,ssid,wlanuserip,split[0].split("=")[1].split("&")[0]);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>TimeNauta(sesion: nautaSesion)));
            }
            user.clear();
            pass.clear();


          }else{
            Fluttertoast.showToast(
                msg: "Ocurrio un error, vuelva a intentarlo",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        }else{
          Fluttertoast.showToast(
              msg: "Error de usuario y contraseña o no tiene tiempo disponible",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
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

  saveUser(String u, String p) async {
    final sessionObject =
    SessionObject(usuario: u, password: p);
    print('buscando');
    List<SessionObject> listUsers = await TuEnvioDatabase.instance.readAllSesion();
    bool existe=false;
    for(int i = 0 ; i<listUsers.length;i++){
      if(listUsers[i].usuario==sessionObject.usuario){
        existe=true;
      }
    }
    if(!existe){
      await TuEnvioDatabase.instance.createSession(sessionObject);
      Fluttertoast.showToast(
          msg: "Usuario guardado",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    print('fin');
  }
  updateUser(String u, String p)async{
    final sessionObject =
    SessionObject(usuario: u, password: p);
    print('buscando');
    List<SessionObject> listUsers = await TuEnvioDatabase.instance.readAllSesion();
    bool existe=false;
    for(int i = 0 ; i<listUsers.length;i++){
      if(listUsers[i].usuario==sessionObject.usuario){
        existe=true;
      }
    }
    if(existe){
      await TuEnvioDatabase.instance.update(sessionObject);
      Fluttertoast.showToast(
          msg: "Usuario actualizado",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    print('fin');
  }
  deleteUser(String u, String p) async {
    final sessionObject =
    SessionObject(usuario: u, password: p);
    print('buscando');
    List<SessionObject> listUsers = await TuEnvioDatabase.instance.readAllSesion();
    bool existe=false;
    int id=-1;
    for(int i = 0 ; i<listUsers.length;i++){
      if(listUsers[i].usuario==sessionObject.usuario){
        existe=true;
      }
    }
    if(existe){
      await TuEnvioDatabase.instance.delete(sessionObject.usuario);
      Fluttertoast.showToast(
          msg: "Usuario guardado",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    print('fin');
  }

  void handleClick(String value) {
    switch (value) {
      case 'Lista de usuarios':_listUser(context);
      break;
      case 'Retomar sesion':'';
      break;
    }
  }
  _saveUser(BuildContext context,String u,String p) {
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
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Recordar Usuario",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: Text(
                        "Desea guardar su usuario y contraseña para luego ser usado",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 16.0),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(

                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                             saveUser(u, p);
                              Navigator.pop(context);
                             getNautaPortal();
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.9),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(32.0),
                                ),
                              ),
                              child: Text(
                                "Sí",
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                              getNautaPortal();
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(32.0)),
                              ),
                              child: Text(
                                "No",
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  _listUser(BuildContext context) async {
    List<SessionObject> listUsers = await TuEnvioDatabase.instance.readAllSesion();
    print(listUsers);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Lista de usuarios",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    height: 4.0,
                  ),

                  Container(
                    margin: EdgeInsets.only(bottom: 5.0,right: 12,left: 12),
                    width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.5,
                    child: listUsers.isNotEmpty?ListView.builder(
                        itemCount: listUsers.length,
                        itemBuilder: (BuildContext context,int index){
                          return ElevatedButton(
                            style: ButtonStyle(
                                elevation:MaterialStateProperty.all(0) ,
                                overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor.withOpacity(0.6)),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),

                                    )
                                )
                            ),
                            onPressed: () async {
                              user.text=listUsers[index].usuario;
                              pass.text=listUsers[index].password;
                              Navigator.pop(context);
                            },
                            child:Padding(
                              padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 8.0),
                              child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 12.0,
                                      backgroundColor: Theme.of(context).primaryColor,
                                      child: Icon(
                                       Icons.person,
                                        size: 18.0 ,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(listUsers[index].usuario,
                                              style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,fontSize: 13.0,color:Theme.of(context).primaryColor),
                                              overflow:TextOverflow.ellipsis ,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )

                                  ]

                              ),
                            )
                          );
                        }
                    ):Center(
                    child: Text('No posee usuarios guardados',
                    style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,fontSize: 15.0,color:Theme.of(context).primaryColor),
                    overflow:TextOverflow.ellipsis ,
                  ),
            ),
                  )

                ],
              ),
            ),
          );
        });
  }
}
