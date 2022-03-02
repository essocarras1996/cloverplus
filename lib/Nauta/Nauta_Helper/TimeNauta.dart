import 'package:cloverplus/Nauta/Nauta_Helper/NautaSesion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../CustomTimerPainter.dart';

class TimeNauta extends StatefulWidget {
  final NautaSesion sesion;
  const TimeNauta({Key? key,required this.sesion}) : super(key: key);

  @override
  _TimeNautaState createState() => _TimeNautaState(sesion);
}

class _TimeNautaState extends State<TimeNauta> with TickerProviderStateMixin{
  late NautaSesion sesion;
  _TimeNautaState(NautaSesion sesion){
    this.sesion=sesion;
  }
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: sesion.tiempo),
    );
    controller.reverse(from: controller.value == 0.0
        ? 1.0
        : controller.value);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Tiempo Nauta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

      ),
      body:  Container(
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
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 50.0),
                      color: Colors.white,
                      height:
                      controller.value * MediaQuery.of(context).size.height,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: Padding(
                              padding: const EdgeInsets.all(38.0),
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: CustomPaint(
                                          painter: CustomTimerPainter(
                                            animation: controller,
                                            backgroundColor: Theme.of(context).primaryColor,
                                            color: themeData.indicatorColor,
                                          )),
                                    ),
                                    Align(
                                      alignment: FractionalOffset.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                              "Bienvenido\n${sesion.user}",
                                              style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor,fontSize: 15.0),
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                          Text(
                                            timerString,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 30.0,
                                                fontFamily: 'Ubuntu',
                                                color: Theme.of(context).primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return FloatingActionButton.extended(
                                  onPressed: () {
                                    _cerrarSession();
                                  },
                                  icon: Icon( Icons.stop),
                                  label: Text( 'Desconectar',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold)  ));
                            }),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    String twoDigits(int n)=>n.toString().padLeft(2,"0");
    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '${twoDigits(duration.inHours)}:${twoDigitsMinutes}:${twoDigitSeconds}';
  }

  _cerrarSession() async {
    await Future.delayed(Duration(milliseconds: 400));

    var customHeaders = {
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': sesion.cookie,
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

    var data ={
      'op':'getLeftTime',
      'ATTRIBUTE_UUID':sesion.ATTRIBUTE_UUID,
      'CSRFHW':sesion.CSRFHW,
      'wlanuserip':sesion.wlanuserip,
      'ssid':sesion.ssid,
      'loggerId':sesion.loggerId,
      'domain':'',
      'username':sesion.user,
      'wlanacname':'',
      'wlanmac':''
    };

    try{
      var response = await http.post(Uri.parse('https://secure.etecsa.net:8443/LogoutServlet'),body: data,headers: customHeaders);
      int status = response.statusCode;
      if(status==200){
        Fluttertoast.showToast(
            msg: "Se ha cerrado la sesión",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
        Navigator.pop(context);
      }else{
        Fluttertoast.showToast(
            msg: "Se ha producido un error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }catch(e){
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
