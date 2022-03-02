import 'package:cloverplus/Nauta/Nauta_Helper/Informacion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio2/dio2.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'Nauta_Helper/Info.dart';

class Mi_Cuenta extends StatefulWidget {
  final Informacion informacion;
  const Mi_Cuenta({Key? key, required this.informacion}) : super(key: key);

  @override
  _Mi_CuentaState createState() => _Mi_CuentaState(informacion);
}

class _Mi_CuentaState extends State<Mi_Cuenta> {
  late Informacion _informacion;
  TextEditingController cuenta = TextEditingController();
  TextEditingController cantidadTx = TextEditingController();
  TextEditingController recargaTx = TextEditingController();
  TextEditingController new_pass = TextEditingController();
  TextEditingController rnew_pass = TextEditingController();
  _Mi_CuentaState(Informacion _informacion){
    this._informacion=_informacion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: IconButton(
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () async {
                      _recargaSaldoNauta(context);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top:3),
                child: IconButton(
                    icon: Icon(
                      Icons.send_to_mobile,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () async {
                      _transferenciaNauta(context);
                    }),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: PopupMenuButton<String>(
                  onSelected: handleClick,
                  itemBuilder: (BuildContext context) {
                    return {'Cambiar contraseña de acceso', 'Cambiar contraseña de correo'}.map((String choice) {
                      return PopupMenuItem<String>(
                        textStyle: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ),
            ],
            elevation: 0,
            title:Text('Mi Cuenta',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

          ),
          body: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.5,
                            spreadRadius: 5.5,
                            offset: Offset(0, 1),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                    ),
                child: ListView.builder(
                          itemCount: _informacion.list_info.length,
                          itemBuilder: (BuildContext context,int index){
                          return Container(
                            width: MediaQuery.of(context).size.width*0.8,
                            margin: EdgeInsets.only(top: 20,left: 35.0,right: 35.0,bottom: 5.0),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 1.5,
                                    spreadRadius: 1.5,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                borderRadius: BorderRadius.all(Radius.circular(25.0))
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _informacion.list_info[index].title,style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(25.0))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                                    child: Text(
                                      _informacion.list_info[index].subtitle,style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 14.0),textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                /*Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),topRight: Radius.circular(15.0),topLeft: Radius.circular(15.0))
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                                    child: Text(
                                        _informacion.list_info[index].subtitle,style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 14.0),textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),*/
                              ],
                            ),
                          );
                          },
                ),
      ),
    );
  }
  void handleClick(String value) {
    switch (value) {
      case 'Cambiar contraseña de correo':_changePasswordEmail(context);
        break;
      case 'Cambiar contraseña de acceso':_changePasswordAccount(context);
        break;
    }
  }

  _recargaSaldoNauta(BuildContext context) {
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
                          "Recarga Nauta",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 18.0),
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
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: Text(
                        "Introduce el número del cupón",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 16.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 40),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                          controller: recargaTx,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            new LengthLimitingTextInputFormatter(16),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            labelText: "Cupón",
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
                        if(recargaTx.text.length==12||recargaTx.text.length==16){
                          _setRecargaNauta(recargaTx.text);
                        }else{
                          Fluttertoast.showToast(
                              msg: "Cupón no valido",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
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
                          "Recargar",
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
  _transferenciaNauta(BuildContext context) {
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
                          "Transferencia Nauta",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 17.0),
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
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: Text(
                        "Introduce los datos",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 16.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 10),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                          controller: cuenta,
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: <TextInputFormatter>[
                          ],
                          decoration: InputDecoration(
                            labelText: "Cuenta",
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
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 40),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                          controller: cantidadTx,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            new LengthLimitingTextInputFormatter(16),
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            labelText: "Cantidad",
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
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        String cant = cantidadTx.text;
                        String cuent = cuenta.text;
                        int temp=0;
                        int posicion=0;
                        double saldo_actual=0;
                        bool flag=false;
                        for(Info a in _informacion.list_info){
                          if(a.title.toLowerCase().contains('saldo disponible')){
                            posicion=temp;
                            saldo_actual=double.parse(a.subtitle.replaceAll("\$", "").replaceAll(" CUP", "").replaceAll(",", "."));

                            flag=true;
                          }
                          if(flag){
                            break;
                          }
                          temp++;
                        }
                        double c = double.parse(cant);
                        if(cuenta.text.contains("@nauta.com.cu")||cuenta.text.contains("@nauta.co.cu")){
                          if(saldo_actual>c){
                            _setTransferenciaNauta(cant,cuent);
                          }else{
                            Fluttertoast.showToast(
                                msg: "Error no puede enviar más de lo que posee",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }
                        }else{
                          Fluttertoast.showToast(
                              msg: "La cuenta a transferir no es válida",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
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
                          "Enviar",
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
  _changePasswordEmail(BuildContext context) {
    new_pass.clear();
    rnew_pass.clear();
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
                          "Cambiar Contraseña",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 17.0),
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
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: Text(
                        "Introduce la nueva contraseña para su cuenta de correo",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 16.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 10),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                          controller: new_pass,
                          keyboardType: TextInputType.visiblePassword,
                          inputFormatters: <TextInputFormatter>[
                            new LengthLimitingTextInputFormatter(16),
                          ],
                          decoration: InputDecoration(
                            labelText: "Nueva Contraseña",
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
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 40),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                          controller: rnew_pass,
                          keyboardType: TextInputType.visiblePassword,
                          inputFormatters: <TextInputFormatter>[
                            new LengthLimitingTextInputFormatter(20),
                          ],
                          decoration: InputDecoration(
                            labelText: "Repetir Nueva Contraseña",
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
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        String np = new_pass.text;
                        String rnp = rnew_pass.text;
                        if(np == rnp){
                          if(np.length>7){
                            _setPasswordEmail(np);
                          }else{
                            Fluttertoast.showToast(
                                msg: "Error debe poseer al menos 8 caracteres",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }

                        }else{
                          Fluttertoast.showToast(
                              msg: "Las contraseñas no coinciden",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
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
                          "Cambiar",
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
  _changePasswordAccount(BuildContext context) {
    new_pass.clear();
    rnew_pass.clear();
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
                          "Cambiar Contraseña",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor,fontSize: 17.0),
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
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      height: 4.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15,left: 30,right: 30,bottom: 30),
                      child: Text(
                        "Introduce la nueva contraseña para su cuenta de acceso",style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor,fontSize: 16.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 10),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                          controller: new_pass,
                          keyboardType: TextInputType.visiblePassword,
                          inputFormatters: <TextInputFormatter>[
                          ],
                          decoration: InputDecoration(
                            labelText: "Nueva Contraseña",
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
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 40),
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                          controller: rnew_pass,
                          keyboardType: TextInputType.visiblePassword,
                          inputFormatters: <TextInputFormatter>[
                          ],
                          decoration: InputDecoration(
                            labelText: "Repetir Nueva Contraseña",
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
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                width: 2.0,
                              ),
                            ),
                          )
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        String np = new_pass.text;
                        String rnp = rnew_pass.text;
                        if(np == rnp){
                          if(np.length>7){
                            _setPasswordAccount(np);
                          }else{
                            Fluttertoast.showToast(
                                msg: "Error debe poseer al menos 8 caracteres",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }

                        }else{
                          Fluttertoast.showToast(
                              msg: "Las contraseñas no coinciden",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
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
                          "Cambiar",
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
  _setRecargaNauta(String numero) async {
    await Future.delayed(Duration(milliseconds: 400));
    var customHeaders = {
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': _informacion.cookie,
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

    var data = {
      'csrf': _informacion.csrf,
      'recharge_code': numero,
      'btn_submit': ''
    };

    try {
      var response = await http.post(Uri.parse('https://www.portal.nauta.cu/useraaa/recharge_account'), body: data,headers: customHeaders);
      int status_code =response.statusCode;
      if(status_code==302){
        recargaTx.clear();
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Cuenta recargada",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
        _getUpdateInfo();
      } else if(status_code==200){
        var document = parse(response.body);
        String? precio = document.querySelector('div.card-panel')!.querySelector('div.row')!.querySelectorAll('div.col.s12').first.querySelector('p')?.text;
        bool flag= false;
        int temp=0;
        int posicion=0;
        for(Info a in _informacion.list_info){
          if(a.subtitle.contains(precio!)){
            flag=true;
          }
        }
        if(flag){
          Fluttertoast.showToast(
              msg: "Cupón inválido",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else{
          recargaTx.clear();
          Navigator.pop(context);
          Fluttertoast.showToast(
              msg: "Cuenta recargada",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0
          );
          _getUpdateInfo();
        }

      }else{
        Fluttertoast.showToast(
            msg: "Se ha producido un error. Vuelva a intentarlo",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
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
  _setTransferenciaNauta(String cantidad, String cuent) async {
    await Future.delayed(Duration(milliseconds: 400));

    var customHeaders = {
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': _informacion.cookie,
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

    var data = {
      'csrf' : _informacion.csrf,
      'transfer' :	cantidad,
      'password_user' : _informacion.password,
      'id_cuenta' :	cuent,
      'action' :	"checkdata"
    };

    try {
      var response = await http.post(Uri.parse('https://www.portal.nauta.cu/useraaa/transfer_balance'), body: data,headers: customHeaders);
      int status_code =response.statusCode;
      if(status_code==302){
        cantidadTx.clear();
        cuenta.clear();
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Transferencia realizada",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
        _getUpdateInfo();
      }else if(status_code==200){
        Fluttertoast.showToast(
            msg: "Error no se pudo realizar la transferencia",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        Fluttertoast.showToast(
            msg: "Se ha producido un error. Vuelva a intentarlo",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
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
  _setPasswordEmail(String new_password)async {
    await Future.delayed(Duration(milliseconds: 400));
    var customHeaders = {
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': _informacion.cookie,
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

    var data = {
      'csrf': _informacion.csrf,
      'old_password':	_informacion.password,
      'new_password':	new_password,
      'repeat_new_password':	new_password,
      'btn_submit': ''
    };

    try {
      var response = await http.post(Uri.parse('https://www.portal.nauta.cu/email/change_password'), body: data,headers: customHeaders);
      int status_code =response.statusCode;
      if(status_code==302){
        new_pass.clear();
        rnew_pass.clear();
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Contraseña de correo cambiada",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );

      } else if(status_code==200){
        Fluttertoast.showToast(
            msg: "Error contraseña no segura. Su contrasseña debe poseer mayúscula y algún carater especial",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        Fluttertoast.showToast(
            msg: "Se ha producido un error. Vuelva a intentarlo",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
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
  _setPasswordAccount(String new_password)async {
    await Future.delayed(Duration(milliseconds: 400));
    var customHeaders = {
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': _informacion.cookie,
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

    var data = {
      'csrf': _informacion.csrf,
      'old_password':	_informacion.password,
      'new_password':	new_password,
      'repeat_new_password':	new_password,
      'btn_submit': ''
    };

    try {
      var response = await http.post(Uri.parse('https://www.portal.nauta.cu/useraaa/change_password'), body: data,headers: customHeaders);
      int status_code =response.statusCode;
      if(status_code==302){
        _informacion.password=new_password;
        new_pass.clear();
        rnew_pass.clear();
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Contraseña de acceso cambiada",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );

      } else if(status_code==200){
        Fluttertoast.showToast(
            msg: "Error contraseña no segura. Su contrasseña debe poseer mayúscula y algún carater especial",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        Fluttertoast.showToast(
            msg: "Se ha producido un error. Vuelva a intentarlo",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
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
  _getUpdateInfo() async {
    await Future.delayed(Duration(milliseconds: 400));
    Dio dio;
    var customHeaders = {
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': _informacion.cookie,
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
        }
        Informacion informacion = new Informacion(_informacion.cookie,_informacion.user,_informacion.password,_informacion.csrf, list_information);
        _informacion=informacion;
        setState(() {

        });
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
      print(e);
    }

  }

}
