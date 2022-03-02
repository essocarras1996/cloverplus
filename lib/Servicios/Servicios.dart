import 'package:cloverplus/Helper/Operations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:device_information/device_information.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Servicios extends StatelessWidget {
  late List<Operation> operations=[
    Operation(Icons.network_cell, 'Activar 3G', 'Activar servicio 3G en su línea',null),
    Operation(Icons.wifi_tethering, 'Activar 4G', 'Activar servicio 4G en su línea',null),
    Operation(Icons.signal_cellular_connected_no_internet_4_bar_outlined, 'Información de Red', 'Verifique si su dispositivo soporta 3G o 4G',null),
    Operation(Icons.email, 'Vaciar Correo Nauta', 'Eliminar todos los correos electrónicos',null),
  ];
  TextEditingController imeiTx = TextEditingController();
  SmsSender sender = new SmsSender();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Servicios',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                    itemCount: operations.length,
                    itemBuilder: (BuildContext context,int index){

                      return ElevatedButton(
                        style: ButtonStyle(
                            elevation:MaterialStateProperty.all(0) ,
                            overlayColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor.withOpacity(0.5)),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),

                                )
                            )
                        ),
                        onPressed: (){

                          switch(index){
                            case 0:{
                              _info3G(context);
                              break;
                            }
                            case 1:{
                              _activar4G();
                              break;
                            }
                            case 2:{

                              _infoRed(context);
                              break;
                            }
                            case 3:{
                              break;
                            }
                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35.0,right: 35.0,top: 15.0,bottom: 15.0),
                          child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                    operations[index].avatar,
                                    size: 30.0 ,
                                    color: Colors.white,
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(operations[index].title,
                                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,fontSize: 18.0,color:Theme.of(context).primaryColor),
                                          overflow:TextOverflow.ellipsis ,
                                        ),
                                        SizedBox(height: 2.0,),
                                        Text(operations[index].subtitle,
                                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.w200,fontSize: 12.0,color:Theme.of(context).primaryColor),
                                          overflow:TextOverflow.ellipsis ,
                                        ),
                                      ],
                                    ),
                                  ),
                                )

                              ]

                          ),
                        ),
                      );
                    }
                ),
              ),
            )
        )
    ),)
    ;
  }
  _info3G(BuildContext context) {
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
                        "Activar 3G",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 20.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Información:',
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,),
                              ),
                              TextSpan(
                                text: '\n\n- Para poder activar el servicio 3G debe poseer un celular que soporte esta tecnología.',
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor),
                              ),
                              TextSpan(
                                text: '\n\n- Luego debe tenerconfigurado el punto de acceso nauta y tener conectado los datos móviles.',
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor),
                              ),
                              TextSpan(
                                text: '\n\n- Verifique que en la parte superior de la barra de cobertura aparezca 3G, H, H+, 4G o LTE para verificar su conexión.',
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor),
                              ),
                              TextSpan(
                                text: '\n\n- Luego abra el navegador y acceda al siguiente sitio web:',
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor),
                              ),
                              TextSpan(
                                text: '\n\n https://mi.cubacel.net/',
                                recognizer: new TapGestureRecognizer()..onTap = () async =>
                                {
                                if (await canLaunch('https://mi.cubacel.net/')) {
                                         await launch('https://mi.cubacel.net/')
                                          }
                                },
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                              ),
                              TextSpan(
                                text: '\n\nCuando acceda debe registrarse y iniciar sesión, luego debe esperar hasta un máximo de confirmación por vía sms de 24 horas.',
                                style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor),
                              ),

                            ]
                        ),
                      ),

                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  /*_activar4G() async {
    List<String> recipents = ["2266"];
    String _result = await sendSMS(message: 'LTE', recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }*/
  _activar4G() async {
    sender.sendSms(new SmsMessage('2266', 'LTE'));
  }

  getInfo() async {
    try {
      var platformVersion = await DeviceInformation.platformVersion;
      var imeiNo = await DeviceInformation.deviceIMEINumber;
      var modelName = await DeviceInformation.deviceModel;
      var manufacturer = await DeviceInformation.deviceManufacturer;
      var apiLevel =  await DeviceInformation.apiLevel;
      var deviceName = await DeviceInformation.deviceName;
      var productName = await DeviceInformation.productName;
      var cpuType = await DeviceInformation.cpuName;
      var hardware = await DeviceInformation.hardware;

      print(platformVersion);
      print(imeiNo);
      print(modelName);
      print(manufacturer);
      print(apiLevel);
      print(deviceName);
      print(productName);
      print(cpuType);
      print(hardware);
    } on PlatformException {
      var platformVersion = 'Failed to get platform version.';
    }
  }

  _infoRed(BuildContext context) async {
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
                          "Información de Red",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 17.0),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: Text(
                        "Inserte los primeros 8 dígitos del IMEI del teléfono, para ello marque en la plicación de llamada *#06# para poder visualizarlo.",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 40),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                          controller: imeiTx,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            new LengthLimitingTextInputFormatter(8),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            labelText: "IMEI",
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
                        String a =imeiTx.text;
                        if(a.length==8){

                          sender.sendSms(new SmsMessage('2266', a));
                          imeiTx.text="";
                          Navigator.pop(context);
                        }else{
                          Fluttertoast.showToast(
                              msg: "El IMEI es incorrecto",
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
                          "ENVIAR",
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16.0,),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
