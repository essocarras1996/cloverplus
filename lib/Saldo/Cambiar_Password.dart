import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cambiar_Password extends StatefulWidget {

  @override
  _Cambiar_PasswordState createState() => _Cambiar_PasswordState();
}

class _Cambiar_PasswordState extends State<Cambiar_Password> {
  TextEditingController actual = TextEditingController();
  TextEditingController nuevo = TextEditingController();
  TextEditingController rnuevo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title:Text('Cambiar Contraseña',style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),),

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(

                          padding: EdgeInsets.only(top: 40,left: 30,right: 30,bottom: 15),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                new LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                              controller: actual,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                              decoration: InputDecoration(
                                labelText: "Código Actual",
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
                        Container(
                          padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 15),
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                new LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                              controller: nuevo,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                              decoration: InputDecoration(
                                labelText: "Código Nuevo",
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
                        Container(
                          padding: EdgeInsets.only(top: 0,left: 30,right: 30,bottom: 15),
                          child: TextFormField(
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Ubuntu',fontWeight: FontWeight.normal,color: Theme.of(context).primaryColor.withOpacity(0.8),fontSize: 14),
                              controller: rnuevo,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                new LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                              ],
                              decoration: InputDecoration(
                                labelText: "Repetir Código Nuevo",
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
                        Container(
                          margin: EdgeInsets.only(top: 15.0,bottom: 15.0),
                          alignment: Alignment.center,

                          child: ElevatedButton(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 15,right: 8,left: 8),
                                child: Text(
                                    "  Cambiar  ".toUpperCase(),
                                    style: TextStyle(fontSize: 14)
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
                                _setCambiar();
                              }),
                        ),


                      ],
                    ),
                  )
              )
          )
      ),);
  }
  _setCambiar() async {
    String act= actual.text;
    String nue = nuevo.text;
    String rnue=  rnuevo.text;
    if(act.length==4&&nue.length==4&&rnue.length==4){
      if(nue==rnue){
        var numbers = '*234*2*$act*$nue#';
        bool? res = await FlutterPhoneDirectCaller.callNumber(numbers);
        actual.clear();
        nuevo.clear();
        rnuevo.clear();
      }else{
        Fluttertoast.showToast(
            msg: "Error, la nueva contraseña no coincide",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }else{
      Fluttertoast.showToast(
          msg: "Error verifique los campos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    setState(() {

    });


  }
}
